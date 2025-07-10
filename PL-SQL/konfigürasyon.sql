--SEQUENCE -> sira numarasi otomatik olarak artan sayilar 
-- 2 farkli sequence olusturulur
-- Sequences
CREATE SEQUENCE FATURA_DETAY_SEQ START WITH 1 INCREMENT BY 1;  --1'den basla (primary key fatura_detay tablosunda)
CREATE SEQUENCE JOB_LOG_SEQ START WITH 1 INCREMENT BY 1;       --Her seferinde 1 arttir  (her fatura kaydi gelince)


-- Konfig�rasyon verilerinin y�klenmesi
INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --dosya alani hangi karakterle ayriliyor
('FILE_DELIMITER', '|', 'Dosya ayrac�', SYSDATE);   ---Dosya okuma i�leminde bu ayra� kullan�lacak |

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES --hizmetler i�in uygulanacak KDV oran�n� belirtir
('DATA_KDV', '18', 'DATA servisleri i�in KDV oran�', SYSDATE);   --vergiyle gelecek toplam ucret hesaplanacak

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('DATA_OIV', '5', 'DATA servisleri i�in ��V oran�', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('SES_KDV', '18', 'SES servisleri i�in KDV oran�', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('SES_OIV', '25', 'SES servisleri i�in ��V oran�', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('SMS_KDV', '18', 'SMS servisleri i�in KDV oran�', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('SMS_OIV', '25', 'SMS servisleri i�in ��V oran�', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('VAS_KDV', '18', 'VAS servisleri i�in KDV oran�', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('VAS_OIV', '25', 'VAS servisleri i�in ��V oran�', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('CIHAZ_KDV', '0', 'CIHAZ servisleri i�in KDV oran�', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  
('CIHAZ_OIV', '0', 'CIHAZ servisleri i�in ��V oran�', SYSDATE);



