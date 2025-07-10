-- Fatura detaylarýnýn tutulacaðý ana tablo
CREATE TABLE FATURA_DETAY (
    ID NUMBER PRIMARY KEY,
    MSISDN VARCHAR2(20),
    SERVICE_NAME VARCHAR2(100),
    START_DATE DATE,
    END_DATE DATE,
    PRODUCT_TYPE VARCHAR2(10),
    NET_AMOUNT NUMBER(10,2),
    GROSS_AMOUNT NUMBER(10,2),
    KDV_AMOUNT NUMBER(10,2),
    OIV_AMOUNT NUMBER(10,2),
    PROCESS_DATE DATE,
    INVOICE_PERIOD VARCHAR2(6)
);

-- Konfigürasyon bilgilerinin tutulacaðý tablo
CREATE TABLE SYSTEM_CONFIG (
    CONFIG_KEY VARCHAR2(50) PRIMARY KEY,
    CONFIG_VALUE VARCHAR2(200),
    DESCRIPTION VARCHAR2(500),
    LAST_UPDATE_DATE DATE
);

-- Job log bilgilerinin tutulacaðý tablo
CREATE TABLE JOB_LOG (
    ID NUMBER PRIMARY KEY,
    JOB_NAME VARCHAR2(50),
    START_TIME TIMESTAMP,
    END_TIME TIMESTAMP,
    TOTAL_RECORDS NUMBER,
    STATUS VARCHAR2(20),
    ERROR_MESSAGE VARCHAR2(4000)
);


-- Önce tabloyu oluþturalým
CREATE TABLE VERGI_ORAN (
    urun_tipi VARCHAR2(20),
    kdv NUMBER,
    oiv NUMBER,
    CONSTRAINT pk_vergi_oran PRIMARY KEY (urun_tipi)
);

-- Þimdi vergi oranlarýný ekleyelim
INSERT INTO VERGI_ORAN (urun_tipi, kdv, oiv) VALUES ('DATA', 18, 5);
INSERT INTO VERGI_ORAN (urun_tipi, kdv, oiv) VALUES ('SES', 18, 25);
INSERT INTO VERGI_ORAN (urun_tipi, kdv, oiv) VALUES ('SMS', 18, 25);
INSERT INTO VERGI_ORAN (urun_tipi, kdv, oiv) VALUES ('VAS', 18, 25);
INSERT INTO VERGI_ORAN (urun_tipi, kdv, oiv) VALUES ('CIHAZ', 0, 0);

-- Deðiþiklikleri kaydedelim
commit;
