-- Prosed�r� test etme
BEGIN
  INVOICE_PROC_PKG.PROCESS_INVOICE_FILE(TO_DATE('23.09.2017', 'DD.MM.YYYY'));
END;
/


-- Job loglar�n� kontrol et
SELECT * FROM JOB_LOG;

-- Fatura detaylar�n� kontrol et
SELECT * FROM FATURA_DETAY;
