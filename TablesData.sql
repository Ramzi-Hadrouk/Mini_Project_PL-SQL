
DROP TABLE ETUDIANT CASCADE CONSTRAINTS ;
DROP TABLE MODULE   CASCADE CONSTRAINTS ;
DROP TABLE NOTES    CASCADE CONSTRAINTS ;
DROP TABLE CHOIX    CASCADE CONSTRAINTS ;
DROP TABLE MASTER    CASCADE CONSTRAINTS ;

---------------------TABLES--------------------------------------
CREATE TABLE ETUDIANT
( 
rang varchar2(10),
code_e number(10),
Nom varchar2(50),
Prenom varchar2(100),
Moyenne number,
Specialite varchar2(10)

) ;

---------
create table MODULE 
(
code_m varchar2(10),
Intitule varchar2(100),
Coefficient number(2)

) ;

---------
create table NOTES
(
code_e number(10),
code_m varchar2(10),
note varchar2(10)
);
---------
create table CHOIX 
(
code_e varchar2(10),
choix1 varchar2(10),
choix2 varchar2(10),
choix3 varchar2(10)


) ;

--------------------CONSTRAINTS-----------------------------------
ALTER TABLE ETUDIANT
ADD CONSTRAINT pk_code_e
PRIMARY KEY (code_e);
------
ALTER TABLE MODULE
ADD CONSTRAINT pk_code_m
PRIMARY KEY (code_m);
-------
ALTER TABLE NOTES
ADD CONSTRAINT fk_code_e 
FOREIGN KEY (code_e )
REFERENCES ETUDIANT (code_e );
--------
ALTER TABLE NOTES
ADD CONSTRAINT fk_code_m 
FOREIGN KEY (code_m )
REFERENCES MODULE (code_m );
--------
ALTER TABLE NOTES
ADD CONSTRAINT pk_code_e_code_m
PRIMARY KEY (code_e,code_m);
--------
ALTER TABLE CHOIX
ADD CONSTRAINT pk_code_e_choix
PRIMARY KEY (code_e);

------------------------INSERT-------------------------------------
---------Etudiat datda :
insert into ETUDIANT(Rang, code_e, nom, prenom, moyenne, specialite)
values(null,10000,'n1','p1',null,null);

insert into ETUDIANT(Rang, code_e, nom, prenom, moyenne, specialite)
values(null,20000,'n2','p2',null,null);

insert into ETUDIANT(Rang, code_e, nom, prenom, moyenne, specialite)
values(null,30000,'n3','p3',null,null);

insert into ETUDIANT(Rang, code_e, nom, prenom, moyenne, specialite)
values(null,40000,'n4','p4',null,null);

insert into ETUDIANT(Rang, code_e, nom, prenom, moyenne, specialite)
values(null,50000,'n5','p5',null,null);

insert into ETUDIANT(Rang, code_e, nom, prenom, moyenne, specialite)
values(null,60000,'n6','p6',null,null);

---------- Module data:
insert into MODULE(code_m, intitule, coefficient)
values('bda','Base de données Avancée ',2);

insert into MODULE(code_m, intitule, coefficient)
values('pwa','Programmation web Avancée',2);

insert into MODULE(code_m, intitule, coefficient)
values('ms','Modélisation est simulation ',3);

-----------Notes data:
insert into NOTES(code_e, code_m, note) 
values(10000,'bda',20);

insert into NOTES(code_e, code_m, note) 
values(10000,'pwa',20);

insert into NOTES(code_e, code_m, note) 
values(10000,'ms',20);
--
insert into NOTES(code_e, code_m, note) 
values(20000,'bda',10);

insert into NOTES(code_e, code_m, note) 
values(20000,'pwa',10);

insert into NOTES(code_e, code_m, note) 
values(20000,'ms',6);
--
insert into NOTES(code_e, code_m, note) 
values(30000,'bda',4);

insert into NOTES(code_e, code_m, note) 
values(30000,'pwa',4);

insert into NOTES(code_e, code_m, note) 
values(30000,'ms',0);
--
insert into NOTES(code_e, code_m, note) 
values(40000,'bda',20);

insert into NOTES(code_e, code_m, note) 
values(40000,'pwa',20);

insert into NOTES(code_e, code_m, note) 
values(40000,'ms',20);
--
insert into NOTES(code_e, code_m, note) 
values(50000,'bda',0);

insert into NOTES(code_e, code_m, note) 
values(50000,'pwa',0);

insert into NOTES(code_e, code_m, note) 
values(50000,'ms',0);
--
insert into NOTES(code_e, code_m, note) 
values(60000,'bda',1);

insert into NOTES(code_e, code_m, note) 
values(60000,'pwa',2);

insert into NOTES(code_e, code_m, note) 
values(60000,'ms',3);
-----------CHOIX data:
insert into CHOIX (code_e, choix1, choix2,choix3) 
values(10000,' rsd','idtwa ',' ifia');
insert into CHOIX (code_e, choix1, choix2,choix3) 
values(20000,' rsd','idtwa ',' ifia');
insert into CHOIX (code_e, choix1, choix2,choix3) 
values(30000,' rsd','idtwa ',' ifia');
insert into CHOIX (code_e, choix1, choix2,choix3) 
values(40000,' rsd','idtwa ',' ifia');
insert into CHOIX (code_e, choix1, choix2,choix3) 
values(50000,' rsd','idtwa ',' ifia');
insert into CHOIX (code_e, choix1, choix2,choix3) 
values(60000,' rsd','idtwa ',' ifia');

---------------------------Modifier les notes de l’étudiant 40000----------
UPDATE NOTES  set  note =10 where  code_e=40000;
-------------------------- Create Table Master --------------------------------
create table  MASTER as select * from  ETUDIANT ;
delete from Master ;

--------------------------
COMMIT;
--------------------------

