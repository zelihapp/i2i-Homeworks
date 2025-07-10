CREATE OR REPLACE PACKAGE BODY INVOICE_PROC_PKG AS
    v_file_delimiter VARCHAR2(1);   -- dosya ayiraci icin özel bir degisken tanimlaniyor |
    
     -- sistem config degerlerini almak icin bir fonksiyon p_key degerini döndürür
    FUNCTION GET_CONFIG_VALUE(p_key IN VARCHAR2) RETURN VARCHAR2 IS
        v_value VARCHAR2(200);
    BEGIN
        SELECT CONFIG_VALUE INTO v_value
        FROM BILGE.SYSTEM_CONFIG
        WHERE CONFIG_KEY = p_key;
        
        RETURN v_value;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END GET_CONFIG_VALUE;
    
    -- vergi hesaplama islemi
    PROCEDURE CALCULATE_TAX_AMOUNTS(
        p_product_type IN VARCHAR2,     -- data ses sms vb ürün tiplerini aliyor
        p_net_amount IN NUMBER,         -- net tutar
        p_kdv_amount OUT NUMBER,        --kdv tutari
        p_oiv_amount OUT NUMBER,        --oiv tutari
        p_gross_amount OUT NUMBER       -- toplam tutar
    ) IS
        v_kdv_rate NUMBER;
        v_oiv_rate NUMBER;
    BEGIN
         -- urun tipine göre vergi oranlarini getiriyor
        CASE p_product_type
            WHEN 'DATA' THEN
                v_kdv_rate := TO_NUMBER(GET_CONFIG_VALUE('DATA_KDV'));          -- kdv ve oiv oranlari belirleniyor 
                v_oiv_rate := TO_NUMBER(GET_CONFIG_VALUE('DATA_OIV'));
            WHEN 'SES' THEN
                v_kdv_rate := TO_NUMBER(GET_CONFIG_VALUE('SES_KDV'));
                v_oiv_rate := TO_NUMBER(GET_CONFIG_VALUE('SES_OIV'));
            WHEN 'SMS' THEN
                v_kdv_rate := TO_NUMBER(GET_CONFIG_VALUE('SMS_KDV'));
                v_oiv_rate := TO_NUMBER(GET_CONFIG_VALUE('SMS_OIV'));
            WHEN 'VAS' THEN
                v_kdv_rate := TO_NUMBER(GET_CONFIG_VALUE('VAS_KDV'));
                v_oiv_rate := TO_NUMBER(GET_CONFIG_VALUE('VAS_OIV'));
            WHEN 'CIHAZ' THEN
                v_kdv_rate := TO_NUMBER(GET_CONFIG_VALUE('CIHAZ_KDV'));
                v_oiv_rate := TO_NUMBER(GET_CONFIG_VALUE('CIHAZ_OIV'));
        END CASE;
        
        -- vergi hesaplanir
        p_kdv_amount := p_net_amount * (v_kdv_rate/100);
        p_oiv_amount := p_net_amount * (v_oiv_rate/100);
        p_gross_amount := p_net_amount + p_kdv_amount + p_oiv_amount;
    END CALCULATE_TAX_AMOUNTS;
    
    -- ana fatura isleme prosedürü  tarih parametresini alir
    PROCEDURE PROCESS_INVOICE_FILE(p_date IN DATE) IS
        v_file_name VARCHAR2(100);      --dosya adini tutar
        v_job_log_id NUMBER;            --is kaydi id tutar
        v_total_records NUMBER := 0;    --toplam kaydi tutar
        v_start_time TIMESTAMP;         -- baslangic zamanini tutar
        v_invoice_period VARCHAR2(6);    -- fatura tekrarini tutar
        v_error_msg VARCHAR2(4000);  -- Hata mesajý için deðiþken eklendi
    BEGIN
        
        v_start_time := SYSTIMESTAMP;
        v_file_delimiter := GET_CONFIG_VALUE('FILE_DELIMITER');
        v_invoice_period := TO_CHAR(p_date, 'DDMMYY');
        v_file_name := 'invoice_' || v_invoice_period || '.txt';
        
         -- is kaydini olusturuyor
        INSERT INTO BILGE.JOB_LOG (ID, JOB_NAME, START_TIME, STATUS)
        VALUES (BILGE.JOB_LOG_SEQ.NEXTVAL, 'INVOICE_PROCESSING', v_start_time, 'RUNNING')
        RETURNING ID INTO v_job_log_id;
        
        -- varolan kayitlari o donem icin siliyor 
        DELETE FROM BILGE.FATURA_DETAY WHERE INVOICE_PERIOD = v_invoice_period;
        
        -- Process file here using UTL_FILE or EXTERNAL TABLES
        -- (Implementation details to be added)
        
        -- Update job log
        UPDATE BILGE.JOB_LOG
        SET END_TIME = SYSTIMESTAMP,
            TOTAL_RECORDS = v_total_records,
            STATUS = 'COMPLETED'
        WHERE ID = v_job_log_id;
        
        COMMIT;
    EXCEPTION       -- hata mesaji job_log a kaydedilir
        WHEN OTHERS THEN
            v_error_msg := DBMS_UTILITY.FORMAT_ERROR_STACK;  -- SQLERRM yerine bu kullanýldý
            
            UPDATE BILGE.JOB_LOG
            SET END_TIME = SYSTIMESTAMP,
                STATUS = 'ERROR',
                ERROR_MESSAGE = v_error_msg
            WHERE ID = v_job_log_id;
                
            COMMIT;
            RAISE;
    END PROCESS_INVOICE_FILE;
    
END INVOICE_PROC_PKG;
/