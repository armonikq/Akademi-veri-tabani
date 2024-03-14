use Akademi


CREATE TABLE Kurs (
    id INT PRIMARY key IDENTITY(1,1),
    KursAdi VARCHAR(30),
    BaslangıcTarihi DATE NOT NULL,
    KursKontenjani int NOT NULL,
)
-- Örnek Kurslar Oluştur.
INSERT INTO Kurs (KursAdi, BaslangıcTarihi, KursKontenjani) VALUES ('İngilizce Kursu', '2150-05-10', 10);
INSERT INTO Kurs (KursAdi, BaslangıcTarihi, KursKontenjani) VALUES ('Yazılım Kursu', '2160-05-10', 15);
INSERT INTO Kurs (KursAdi, BaslangıcTarihi, KursKontenjani) VALUES ('Matemetik Kursu', '2200-05-10', 100);


CREATE TABLE Ders (
    id INT PRIMARY key IDENTITY(1,1),
    DersAdi VARCHAR(30),
    DersGunu VARCHAR(30),
    KursId int NOT NULL,
    FOREIGN KEY (KursId) REFERENCES Kurs(id)
)

-- Örnek Dersleri Oluştur.
INSERT INTO Ders (DersAdi, DersGunu, KursId) VALUES ('Temel İngilizce Başlangıç', 'Pazartesi', 1);
INSERT INTO Ders (DersAdi, DersGunu, KursId) VALUES ('Veri Tabanı İlişkileri', 'Salı', 2);
INSERT INTO Ders (DersAdi, DersGunu, KursId) VALUES ('İngilizce Cümle Yapısı', 'Çarşamba', 1);
INSERT INTO Ders (DersAdi, DersGunu, KursId) VALUES ('Geometri', 'Perşembe', 3);
INSERT INTO Ders (DersAdi, DersGunu, KursId) VALUES ('Yazılım Nedir?', 'Cuma', 2);

CREATE TABLE Kullanci (
   id INT PRIMARY key IDENTITY(1,1),
   KullaciAdi VARCHAR(30),
   Sifre VARCHAR (max),
   Rol VARCHAR (max),
)

-- Örnek Kullanıcıları Oluştur.
INSERT INTO Kullanci (KullaciAdi, Sifre, Rol) VALUES ('furkanayn', '123456', 'Öğretmen');
INSERT INTO Kullanci (KullaciAdi, Sifre, Rol) VALUES ('muhammetykt', 'qwe123qwe', 'Öğrenci');

CREATE TABLE Ogrenci (
    id INT PRIMARY key IDENTITY(1,1),
    KullanciId int not NULL,
    Ad VARCHAR(30) NOT NULL,
    Soyad VARCHAR(30) not NULL,
    TC VARCHAR(11) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    CepTelefonu VARCHAR(12) NOT NULL,
    Adres VARCHAR (255) NOT NULL,
    DogumTarihi DATE NOT NULL,
    KursId int NOT NULL,
    FOREIGN KEY (KursId) REFERENCES Kurs(id),
    FOREIGN KEY (KullanciId) REFERENCES Kullanci(id)
)


-- Örnek Kullanıcıları Oluştur.
INSERT INTO Ogrenci (KullanciId, Ad, Soyad, TC, Email, CepTelefonu, Adres, DogumTarihi, KursId) VALUES (2, 'Muhammed', 'Yikit', '11111111111', 'mmmmm@gmail.com', '900530000000', 'test', '2004/10/05', 2);


CREATE TABLE DersNotu(
     id INT PRIMARY key IDENTITY(1,1),
     DersId int NOT NULL,
     OgrenciId int NOT NULL,
     DersNotu INT NOT NULL,
     FOREIGN KEY (DersId) REFERENCES Ders(id),
     FOREIGN KEY (OgrenciId) REFERENCES Ogrenci(id)
)

-- Örnek Ders Notu Oluştur
INSERT INTO DersNotu (DersId, OgrenciId, DersNotu) VALUES (2, 1, 100);
INSERT INTO DersNotu (DersId, OgrenciId, DersNotu) VALUES (5, 1, 100);

CREATE table Egitmen (
    id INT PRIMARY key IDENTITY(1,1),
    KullanciId int not NULL,
    Ad VARCHAR(30) NOT NULL,
    Soyad VARCHAR(30) not NULL,
    TC VARCHAR(11) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    CepTelefonu VARCHAR(12) NOT NULL,
    Adres VARCHAR (255) NOT NULL,
    DogumTarihi DATE NOT NULL,
    FOREIGN KEY (KullanciId) REFERENCES Kullanci(id)
)


-- Örnek Eğitmen Oluştur.
INSERT INTO Egitmen (KullanciId, Ad, Soyad, TC, Email, CepTelefonu, Adres, DogumTarihi) VALUES (1, 'Furkan', 'Ayhan', '11111111111', 'fffff@gmail.com', '900530000000', 'test', '2002/11/02');


create table EgitmenMaası (
  id  int PRIMARY key IDENTITY(1,1),
  EgitmenId int not NULL,
  Maas int not NULL,
  Yil DATE not NULL,
  FOREIGN KEY (EgitmenId) REFERENCES Egitmen(id)
)

-- Örnek Eğitmen Maaşı Oluştur.

INSERT INTO EgitmenMaası (EgitmenId, Maas, Yil) VALUES(1, 50000, '2020/02/10')