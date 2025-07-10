--SEQUENCE -> sira numarasi otomatik olarak artan sayilar 
-- 2 farkli sequence olusturulur
-- Sequences
CREATE SEQUENCE FATURA_DETAY_SEQ START WITH 1 INCREMENT BY 1;  --1'den basla (primary key fatura_detay tablosunda)
CREATE SEQUENCE JOB_LOG_SEQ START WITH 1 INCREMENT BY 1;       --Her seferinde 1 arttir  (her fatura kaydi gelince)


-- Konfigürasyon verilerinin yüklenmesi
INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --dosya alani hangi karakterle ayriliyor
('FILE_DELIMITER', '|', 'Dosya ayracý', SYSDATE);   ---Dosya okuma iþleminde bu ayraç kullanýlacak |

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES --hizmetler için uygulanacak KDV oranýný belirtir
('DATA_KDV', '18', 'DATA servisleri için KDV oraný', SYSDATE);   --vergiyle gelecek toplam ucret hesaplanacak

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('DATA_OIV', '5', 'DATA servisleri için ÖÝV oraný', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('SES_KDV', '18', 'SES servisleri için KDV oraný', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('SES_OIV', '25', 'SES servisleri için ÖÝV oraný', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('SMS_KDV', '18', 'SMS servisleri için KDV oraný', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('SMS_OIV', '25', 'SMS servisleri için ÖÝV oraný', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('VAS_KDV', '18', 'VAS servisleri için KDV oraný', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('VAS_OIV', '25', 'VAS servisleri için ÖÝV oraný', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  --oiv orani belirtir vergi hesaplamamasinda kullanilacak
('CIHAZ_KDV', '0', 'CIHAZ servisleri için KDV oraný', SYSDATE);

INSERT INTO SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE, DESCRIPTION, LAST_UPDATE_DATE) VALUES  
('CIHAZ_OIV', '0', 'CIHAZ servisleri için ÖÝV oraný', SYSDATE);



