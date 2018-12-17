CREATE TABLESPACE mahasiswa DATAFILE '/u01/app/oracle/oradata/XE/Mahasiswa.dbf' SIZE 50M; 
DROP TABLESPACE mahasiswa INCLUDING CONTENTS AND DATAFILES;

-- show schema/user/database
select USERNAME from SYS.ALL_USERS;

create table mahasiswa (
NIM char(12),
Nama char(10),
Tempat_Lahir char(7),
Tanggal_Lahir date
);

create table kelas (
Nama char(12),
Kode char(10),
Detail char(7)
);

create table dosen (
Nama char(12),
Kode char(10)
);

create table mata_kuliah (
Nama char(12),
Kode char(10)
);

DROP TABLE mahasiswa;
DROP TABLE dosen;
DROP TABLE kelas;
DROP TABLE mata_kuliah;

CREATE ROLE internal_CISA
IDENTIFIED BY internal_CISA;
CREATE ROLE ekternal_CISA
IDENTIFIED BY ekternal_CISA;
CREATE ROLE head_CISA
IDENTIFIED BY head_CISA;

CREATE USER yuriza
IDENTIFIED BY yuriza
DEFAULT TABLESPACE mahasiswa
TEMPORARY TABLESPACE temp;
CREATE USER putu
IDENTIFIED BY putu
DEFAULT TABLESPACE mahasiswa
TEMPORARY TABLESPACE temp;
CREATE USER ilham
IDENTIFIED BY ilham
DEFAULT TABLESPACE mahasiswa
TEMPORARY TABLESPACE temp;
CREATE USER irfan
IDENTIFIED BY irfan
DEFAULT TABLESPACE mahasiswa
TEMPORARY TABLESPACE temp;
CREATE USER fikri
IDENTIFIED BY fikri
DEFAULT TABLESPACE mahasiswa
TEMPORARY TABLESPACE temp;

GRANT SELECT ON mahasiswa TO ekternal_CISA;
GRANT UPDATE ON mahasiswa TO ekternal_CISA;
GRANT DELETE ON mahasiswa TO ekternal_CISA;

GRANT SELECT ON dosen TO internal_CISA;
GRANT UPDATE ON dosen TO internal_CISA;
GRANT DELETE ON dosen TO internal_CISA;
GRANT SELECT ON kelas TO internal_CISA;
GRANT UPDATE ON kelas TO internal_CISA;
GRANT DELETE ON kelas TO internal_CISA;
GRANT SELECT ON mata_kuliah TO internal_CISA;
GRANT UPDATE ON mata_kuliah TO internal_CISA;
GRANT DELETE ON mata_kuliah TO internal_CISA;

GRANT SELECT ON mahasiswa TO head_CISA;
GRANT UPDATE ON mahasiswa TO head_CISA;
GRANT DELETE ON mahasiswa TO head_CISA;
GRANT SELECT ON dosen TO head_CISA;
GRANT UPDATE ON dosen TO head_CISA;
GRANT DELETE ON dosen TO head_CISA;
GRANT SELECT ON kelas TO head_CISA;
GRANT UPDATE ON kelas TO head_CISA;
GRANT DELETE ON kelas TO head_CISA;
GRANT SELECT ON mata_kuliah TO head_CISA;
GRANT UPDATE ON mata_kuliah TO head_CISA;
GRANT DELETE ON mata_kuliah TO head_CISA;

GRANT CREATE SESSION TO yuriza;
GRANT CREATE SESSION TO putu;
GRANT CREATE SESSION TO ilham;
GRANT CREATE SESSION TO irfan;
GRANT CREATE SESSION TO fikri;

GRANT ekternal_CISA TO yuriza;
GRANT ekternal_CISA TO putu;
GRANT head_CISA TO ilham;
GRANT internal_CISA TO irfan;
GRANT internal_CISA TO fikri;

DROP USER yuriza CASCADE;
DROP USER putu CASCADE;
DROP USER ilham CASCADE;
DROP USER irfan CASCADE;
DROP USER fikri CASCADE;
DROP ROLE ekternal_CISA;
DROP ROLE internal_CISA;
DROP ROLE head_CISA;
