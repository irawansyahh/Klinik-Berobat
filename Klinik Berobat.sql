CREATE TABLE rekam_medis
  (
    id_periksa  VARCHAR2 (10) NOT NULL ,
    tanggal_periksa    DATE ,
    nama_penyakit   VARCHAR2 (255) ,
    nama_dokter    VARCHAR2(255) ,
    nama_pasien VARCHAR2 (255)
  ) ;
ALTER TABLE rekam_medis ADD CONSTRAINT rekam_medis_PK PRIMARY KEY ( id_periksa ) ;

CREATE TABLE pasien
  (
    id_pasien  VARCHAR2 (10) NOT NULL ,
    nama_pasien    VARCHAR2(255) ,
    keluhan   VARCHAR2 (255) ,
    alamat    VARCHAR2(255) ,
    riwayat_penyakit VARCHAR2 (255)
  ) ;
ALTER TABLE pasien ADD CONSTRAINT pasien_PK PRIMARY KEY ( id_pasien ) ;

CREATE TABLE dokter
  (
    id_dokter  VARCHAR2 (10) NOT NULL ,
    nama_dokter    VARCHAR2(255) ,
    no_telepon   VARCHAR2 (14) ,
    jenis_dokter    VARCHAR2(255) ,
    alamat VARCHAR2 (255),
    id_ruang VARCHAR2(10)
  ) ;
ALTER TABLE dokter ADD CONSTRAINT dokter_PK PRIMARY KEY ( id_dokter ) ;

CREATE TABLE ruang_periksa
  (
    id_ruang  VARCHAR2 (10) NOT NULL ,
    nama_ruang    VARCHAR2(255) ,
    jenis_ruang   VARCHAR2 (255) ,
    keterangan    VARCHAR2(255) ,
    hasil VARCHAR2 (255),
  ) ;
ALTER TABLE ruang_periksa ADD CONSTRAINT ruang_periksa_PK PRIMARY KEY ( id_ruang ) ;

CREATE TABLE pegawai
  (
    id_pegawai  VARCHAR2 (10) NOT NULL ,
    nama_pegawai    VARCHAR2(30) ,
    no_telepon   VARCHAR2 (14) ,
    umur    NUMBER ,
    alamat VARCHAR2 (255)
  ) ;
ALTER TABLE pegawai ADD CONSTRAINT pegawai_PK PRIMARY KEY ( id_pegawai ) ;

CREATE TABLE transaksi
  (
    id_transaksi  VARCHAR2 (10) NOT NULL ,
    total_biaya  VARCHAR2 (255) ,
    id_pegawai   VARCHAR2 (10)
  ) ;
ALTER TABLE transaksi ADD CONSTRAINT transaksi_PK PRIMARY KEY ( id_transaksi ) ;

CREATE TABLE obat
  (
    id_obat  VARCHAR2 (10) NOT NULL ,
    nama_obat  VARCHAR2(255) ,
    dosis   VARCHAR2 (255) ,
    aturan_pemakaian VARCHAR2(255) ,
    jenis_obat VARCHAR2 (255)
  ) ;
ALTER TABLE obat ADD CONSTRAINT obat_PK PRIMARY KEY ( id_obat ) ;

CREATE TABLE detail_transaksi
  (
    no_transaksi  VARCHAR2 (10) NOT NULL ,
    id_transaksi   VARCHAR2(10) ,
    id_obat  VARCHAR2 (10) 
  ) ;
ALTER TABLE detail_transaksi ADD CONSTRAINT detail_transaksi_PK PRIMARY KEY ( no_transaksi ) ;


CREATE TABLE diperiksa
  (
    id_pasien  VARCHAR2 (10) ,
    id_dokter  VARCHAR2(10) ,
    id_transaksi   VARCHAR2 (10) ,
    id_periksa   VARCHAR2(10) 
  ) ;
  
alter session set nls_date_format= 'dd-month-yyyy';  
  
ALTER TABLE diperiksa ADD CONSTRAINT diperiksa_rekam_medis_FK FOREIGN KEY ( id_periksa ) REFERENCES rekam_medis ( id_periksa ) ;

ALTER TABLE diperiksa ADD CONSTRAINT diperiksa_pasien_FK FOREIGN KEY ( id_pasien ) REFERENCES pasien ( id_pasien ) ;

ALTER TABLE diperiksa ADD CONSTRAINT diperiksa_dokter_FK FOREIGN KEY ( id_dokter ) REFERENCES dokter ( id_dokter ) ;

ALTER TABLE diperiksa ADD CONSTRAINT diperiksa_transaksi_FK FOREIGN KEY ( id_transaksi ) REFERENCES transaksi ( id_transaksi ) ;

ALTER TABLE dokter ADD CONSTRAINT dokter_ruang_periksa_FK FOREIGN KEY ( id_ruang ) REFERENCES ruang_periksa ( id_ruang ) ;

ALTER TABLE transaksi ADD CONSTRAINT transaksi_pegawai_FK FOREIGN KEY ( id_pegawai ) REFERENCES pegawai ( id_pegawai ) ;

ALTER TABLE detail_transaksi ADD CONSTRAINT detail_transaksi_transaksi_FK FOREIGN KEY ( id_transaksi ) REFERENCES transaksi ( id_transaksi ) ;

ALTER TABLE detail_transaksi ADD CONSTRAINT detail_transaksi_obat_FK FOREIGN KEY ( id_obat ) REFERENCES obat ( id_obat ) ;





INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Kamila Rose', '1104776120', 'Gg. Atmawigena Sukabirus, Bandung', 'Pusing, Demam, Mual',	'Tipes');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Nadiya', '1104775320', 'Jl. Mangga dua Sukapura, Bandung', 'Nyeri pinggang, mudah lelah', 'Asma');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Irawansyah', '1106893410', 'Gg. Hj Slamet mengger, Bandung', 'Bengkak pada gusi, radang tenggorokan', 'Tipes');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Farhan', '1109283670', 'Jl. Merdeka Ciganitri, Bandung,', 'Nyeri pada bagian uluh hati, pusing, nyeri pada dada',	'Maag');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Jonathan', '1109283780', 'Gg. Kalimantan satu malaya, Bandung', 'Sakit pada gigi graham, gusi berdarah', 'Jantung');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Kayla', '1176339980',	'Jl. Ciputra falah, Bandung', 'Batuk Berdahak, sakit pada tenggorokan',	'Paru-Paru');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Zivanna', '1176387260',	'Gg. Hj Gumilar, Bandung', 'Batuk kering, pusing, sakit pada tenggorokkan', 'Darah Tinggi');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Sorina', '1173727890',	'Jl. Padjajaran Dua Cibinong, Bandung', 'Mual, mudah cemas, keringat dingin', 'Ginjal');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Ajeng', '1173676770',	'Jl. Tentara Satu Citereup, Bandung', 'Demam tinggi, keringat dingin, denyut jantung tidak teratur
', 'TBC');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Cintalya', '1176767670','Gg. Sirojul Falah Kedung Halang, Bandung', 'Muntah dan mual', 'Campak');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Hanum', '1176778990', 'Gg. Salam Citaharu Pomad, Bandung', 'Demam di sertai pusing', 'Hepatitis');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Dinda', '1165767680', 'Jl. Patimura Senayan, Bandung', 'Sesak napas, sakit kepala, mual', 'Pneumonia');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Kusumawira', '1165768870', 'Jl. Raya Sumpah Pemuda, bandung', 'Nyeri pada perut bagian kiri', 'Eksim');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Kiantari', '1177698760', 'Gg. Sempur Kedung halang, Bandung', 'Batuk berdarah, pusing, demam','Polio');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Kinan', '1167679890', 'Gg. Atmawigena Sukabirus, Bandung', 'Nyeri saat menelan, batuk kering, bau napas tidak sedap', '
Malaria');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Aliya', '1167899880', 'Gg. Merdeka dua Pomad, Bandung', 'Sembelit, mudah cemas, kembung dan mudah bersendawa', 'Demam Berdarah');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Sulthan', '1187980970',	'Jl. Edelweis II Keranggan, Bandung', 'Diare, keringat dingin, mual', 'Tetanus');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Dafa Resa', '1187890990', 'Gg. Merdeka III Ciluar, Bandung', 'Sakit pada mata, mata berair', 'Konjungtivitis');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Risa', '1176897750', 'Jl. Harapan Kita Karadenan', 'Nyeri pada pinggang, mudah lelah','Disentri');

INSERT INTO pasien (nama_pasien, id_pasien, alamat, keluhan, riwayat_penyakit) 
VALUES('Bajang', '1176897749', 'Jl. Harapan Kita Karadenan', 'Mual, pusing, badan terasa panas','Hepatitis B');




INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Afif Syach', '1100543612', 'Subang Village', 'THT','081360553245','1111');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Syah Irawan', '1100531241', 'Lampung City', 'Kulit dan Kelamin','082174354617','1112');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Kadita Lia', '1100531242', 'Jl. Srigunting Raya No.1 Bandung', 'Anak','082174354611','1113');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Maemunah', '1100531243', 'Jl. A H Nasution No. 14 Bandung', 'Anak','082174354612','1114');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Luckmansyah', '1100531244', 'Jl. Cisaranten Kulon Bandung', 'Spesialis Tulang','082174354613','1115');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Lucinta', '1100531245', 'Jl. Bojongloa No.69 Bandung', 'Kulit dan Kelamin','082174354614','1116');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Aziz Nuramalia', '1100531246', 'Jl. Babakan Ciparay No. 212 Bandung', 'THT','082174354615','1117');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Nurrasyid', '1100531247', 'Jl. Batununggal No.3 Bandung', 'Kandungan','082174354616','1118');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Santi Saranti', '1100531248', 'Jl. Holis No.210/191 A Bandung', 'Saraf','082174354617','1119');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Tatang Saratang', '1100531249', 'Jl. Taman Sari No.49 Bandung', 'Anak','082174354618','1120');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Efendi Ali', '1100531250', 'Jl. Venus No. 6 Bandung', 'Bedah','082174354619','1121');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Aan', '1100531251', 'Jl. KH. Wahid Hasyim No. 258 Bandung', 'Spesialis Mata','082174354610','1122');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Syahlan Andi', '1100531252', 'Jl. Leuwi Panjang / Kebon Lega Bandung', 'Spesialis Radiologi','082174354621','1123');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Munaroh', '1100531253', 'Jl. Cijawura Hilir No. 64 Bandung', 'THT','082174354622','1124');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Entin Sepentin', '1100531254', 'Jalan Raya Cigadung Selatan Nomor 100 C Bandung', 'Saraf','082174354623','1125');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Budi Setiawan', '1100531255', 'Jl. Sukasenang No.11 Bandung', 'Spesialis Mata','082174354624','1126');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Nina Marlina', '1100531256', 'Jl. Manisi No.13 Bandung', 'Bedah','082174354625','1127');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Sandi Samudra', '1100531257', 'Jl. Hegarmanah Tengah No.1 Bandung', 'Kandungan','085774354926','1128');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Arianto', '1100531258', 'Jl. Gede Bage No.23', 'Bedah','081360553245','1129');

INSERT INTO dokter (nama_dokter, id_dokter, alamat, jenis_dokter, no_telepon, id_ruang) 
VALUES('Dr. Dede Mardani', '1100531259', 'Jl. Cikopo Selatan No.32', 'Spesialis Tulang','084460550045','1130');





INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon) 
VALUES('Jajang', '1301174666', '26', 'Jalan Soekarno Hatta','089526292733');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Sueb', '1301174677', '30', 'Jalan Satelit 1 No 11','089526292734');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Cubi', '1301174688', '25', 'Jalan Umar','089526292735');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Anhar', '1301174689', '23', 'Jalan Terong','089526292736');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Abim', '1301174690', '26', 'Jalan Mawar','089526292736');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Paimin', '1301174691', '28', 'Jalan Mawar','089526292736');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Reza', '1301174692', '25', 'Jalan Satelit 2','089526292739');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Teguh', '1301174699', '21', 'Jalan BojongSoang','089526292737');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Farhan', '1301174693', '22', 'Jalan Kalianda','089526292732');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Nadhia', '1301174695', '28', 'Jalan Metro','089526292711');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Elga','1301174676','21','Jalan Way Lalan','09526292111');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Putri','1301174321','25','Jalan Palapa 1','09526292112');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Verent','1301174667','23','Jalan Ganesa','09526292111');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Vio','1301174662','22','Jalan Palapa 2','09526292111');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Yesika','1301174621','26','Jalan Palapa 5','0952629212');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Antifa','1301174675','27','Jalan Sumatera','09526292331');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Mutiara','1301174332','25','Jalan Way Umpu','09526292578');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Jajang Suhendra','1301174331','27','Gang Pluto','09526292321');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Elga','1301173667','21','Jalan Way Lalan','09526292111');

INSERT INTO pegawai (nama_pegawai, id_pegawai, umur, alamat, no_telepon)
VALUES('Elmarossa','1301174891','27','Jalan Way Lalan','09526292111');





INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0001','Acetosal','Analgesik','3 X sehari (setelah makan)','80 – 180 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0002','Allopurinol','Antipiretik ','2 X sehari (setelah makan)','60 – 120 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0003','As. Mefenamat','Anti-inflamasi','3 X sehari (setelah makan)','60 – 120 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0004','Fentanil','Nonsteroid','2 X sehari (setelah makan)','60 – 120 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0005','Ibuprofen','Anti-pirai','2 X sehari (setelah makan)','60 – 120 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0006','Ketoprofen','Analgesik','3 X sehari (setelah makan)','60 – 120 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0007','Cetrizin','Anti-alergi','3 X sehari (setelah makan)','80 – 180 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0008','Deksametason','Anti-alergi','3 X sehari (setelah makan)','80 – 180 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0009','Dipenhidramin','Anafilaksis','3 X sehari (setelah makan)','80 – 180 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0010','Epinefrin','Anafilaksis','3 X sehari (setelah makan)','80 – 180 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0011','Klorpheniramin','Anafilaksis','3 X sehari (setelah makan)','80 – 180 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0012','Loratadin','Anafilaksis','3 X sehari (setelah makan)','80 – 180 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0013','Mg Sulfat','Anti-dot','3 X sehari (setelah makan)','80 – 180 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0014','Kalsium Glukonat','Anti-dot','3 X sehari (setelah makan)','80 – 180 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0015','Diazepam','Anti-konvulsi','3 X sehari (setelah makan)','80 – 180 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0016','Fenitoin','Anti-konvulsi','3 X sehari (setelah makan)','80 – 180 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0017','Ergotamin','Anti-migrain','3 X sehari (setelah makan)','80 – 180 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0018','Ciprofloksasin','Anti-infeksi','3 X sehari (setelah makan)','60 – 120 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0019','Dapson','Anti-infeksi','3 X sehari (setelah makan)','60 – 120 mg');

INSERT INTO obat (id_obat, nama_obat, jenis_obat, aturan_pemakaian, dosis) 
VALUES('0020','Dikloksasilin','Anti-infeksi','3 X sehari (setelah makan)','60 – 120 mg mg');





INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai)
VALUES('0001069','80000','1301174666');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001070','120000','1301174677');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001071','150000','1301174688');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001072','90000','1301174689');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001073','100000','1301174690');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001074','60000','1301174699');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001075','80000','1301174692');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001076','70000','1301174699');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001077','60000','1301174693');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001078','190000','1301174695');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001079','43000','1301174676');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001080','54000','1301174321');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001081','44000','1301174667');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001082','80000','1301174662');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001083','35000','1301174621');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001084','130000','1301174675');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001085','54000','1301174332');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001086','89000','1301174331');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001087','70000','1301173667');

INSERT INTO transaksi (id_transaksi, total_biaya, id_pegawai) 
VALUES('0001088','90000','1301174891');




INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1111','Bunga Kamboja','Ruang Rawat Jalan','Mual dan lunglai','Tipes');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1112','Bunga Kertas','Ruang Rawat Inap','Demam tinggi, keringat dingin, denyut jantung tidak teratur','TBC');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1113','Bunga Anggrek','Ruang Rawat Inap','Muntah dan mual','campak');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1114','Bunga Matahari','Ruang Rawat Jalan','Demam di sertai pusing','Hepatitis');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1115','Bunga Anggrek','Ruang Rawat Inap','Sesak napas, sakit kepala, mual','Pneumonia');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1116','Bunga Matahari','Ruang Rawat Inap','Nyeri pada perut bagian kiri','Eksim');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1117','Bunga Kamboja','Ruang Rawat Jalan','Batuk berdarah, pusing, demam','Polio');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1118','Bunga Matahari','Ruang Rawat Inap','Nyeri saat menelan, batuk kering, bau napas tidak sedap ','Malaria');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1119','Bunga Kamboja','Ruang Rawat Jalan','Sembelit, mudah cemas, kembung dan mudah bersendawa','Demam Berdarah');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1120','Bunga Matahari','Ruang Rawat Inap','Diare, keringat dingin, mual','Tetanus');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1121','Bunga Kertas','Ruang Rawat Inap','Sakit pada mata, mata berair','Konjungtivitas');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1122','Bunga Anggrek','Ruang Rawat Inap','Nyeri pada pinggang, mudah lelah','Disentri ');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1123','Bunga Anggrek','Ruang Rawat Inap','Mual, mudah cemas, keringat dingin','Ginjal');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1124','Bunga Matahari','Ruang Rawat Inap','Batuk kering, pusing, sakit pada tenggorokkan','Darah Tinggi');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1125','Bunga Kamboja','Ruang Rawat Jalan','Batuk Berdahak, sakit pada tenggorokan','Paru');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1126','Bunga Kertas','Ruang Rawat Inap','Sakit pada gigi graham, gusi berdarah','Jantung');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1127','Bunga Anggrek','Ruang Rawat Inap','Nyeri pada bagian uluh hati, pusing, nyeri pada dada','Maag');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1128','Bunga Kertas','Ruang Rawat Inap','Bengkak pada gusi, radang tenggorokan','Darah Tinggi');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1129','Bunga Kamboja','Ruang Rawat Jalan','Nyeri pinggang, mudah lelah','Asma');

INSERT INTO ruang_periksa (id_ruang,nama_ruang,jenis_ruang,keterangan,hasil)
VALUES('1130','Bunga Matahari','Ruang Rawat Jalan','Pusing, Demam, Mual','Tipes');




INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1123','Demam','03-oct-2018','Kamila Rose','Dr. Afif Syach');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1124','Tipes','04-oct-2018','Nadiya','Dr. Syah Irawan');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1125','Asma','04-oct-2018','Irawansyah','Dr. Kadita Lia');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1126','Darah tinggi','05-oct-2018','Farhan','Dr. Maemunah');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1127','anemia','06-oct-2018','Jonathan','Dr. Luckmansyah');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter )
VALUES('1128','leukimia','07-oct-2018','Kayla','Dr. Lucinta');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1129','jantung','08-oct-2018','Zivanna','Dr. Aziz Nuramalia');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1130','paru-paru','09-oct-2018','Sorina','Dr. Nurrasyid');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1131','demam','10-oct-2018','Ajeng','Dr. Santi Saranti');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1132','DBD','11-oct-2018','Cintalya','Dr. Tatang Saratang');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1133','malaria','12-oct-2018','Hanum','Dr. Efendi Ali');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1134','tetanus','12-oct-2018','Dinda','Dr. Aan');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1135','alergi','13-oct-2018','Kusumawira','Dr. Syahlan Andi');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1136','demam','14-oct-2018','Kiantari','Dr. Munaroh');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1137','maag','15-oct-2018','Kinan','Dr. Entin Sepentin');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1138','campak','15-oct-2018','Aliya','Dr. Budi Setiawan');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1139','ginjal','16-oct-2018','Sulthan','Dr. Nina Marlina');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1140','hepatitis','16-oct-2018','Dafa Resa','Dr. Sandi Samudra');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1141','pneumonia','17-oct-2018','Risa','Dr. Arianto');

INSERT INTO rekam_medis (id_periksa, nama_penyakit, tanggal_periksa, nama_pasien, nama_dokter ) 
VALUES('1142','tipes','18-oct-2018','resa','Dr. Dede Mardani');



commit;



select * from detail_transaksi;

select * from diperiksa;

select * from dokter;

select * from obat;

select * from pasien;

select * from pegawai;

select * from rekam_medis;

select * from ruang_periksa;

select * from transaksi;
