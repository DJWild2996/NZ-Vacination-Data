drop database homes;
create database homes;
use homes;


CREATE TABLE Owner
(
OwnerNo	   smallint  PRIMARY KEY,
OName  	   varchar(20) ,
OPhone 	   varchar(10)	
) engine=innoDB;

insert into Owner values (200,UCASE('JOHN'),'9966-888');
savepoint insert1;
select * from Owner;

insert into Owner values (201,UCASE('SCott'),'7700-555');
select * from Owner;
rollback to savepoint insert1;
select * from Owner;