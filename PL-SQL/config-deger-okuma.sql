CREATE OR REPLACE PACKAGE INVOICE_PROC_PKG AS   --paketi(PACKAGE belirtir) olusturur mevcutsa üzerine yazar
    -- fatura dosyasini isler
    PROCEDURE PROCESS_INVOICE_FILE(p_date IN DATE);   --p_date -> islenecek faturanin tarihi bu dosya gelince isleyecek 
    FUNCTION GET_CONFIG_VALUE(p_key IN VARCHAR2) RETURN VARCHAR2;  -- config degerlerini okumak icin kullanilir bu fonksiyon
    
END INVOICE_PROC_PKG;
/

-- p_key hangi config degerinin okunacagini belirten anahtar