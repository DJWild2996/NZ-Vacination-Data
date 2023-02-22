CREATE DATABASE Vaccinations;

USE Vaccinations;

CREATE TABLE Appointment
(id INT PRIMARY KEY,
placeId CHAR(10),
slot tinyint,
apptTime datetime,
vaccineNumber tinyint,
personId CHAR(12),
vialNumber CHAR(15),
vaccinator CHAR(10) )engine = innodb;

CREATE TABLE OldAppointment
(id INT PRIMARY KEY,
personId CHAR(12),
reason VARCHAR(50),
missed bit )engine = innodb;

INSERT INTO Appointment
VALUES ('1446','Tim_Wool','1','2021-08-02 10:00:00','1','BKX3780',null,null);

USE Vaccinations

delimiter $$
create trigger au_AppointmentChanged
after update on Appointment
for each row
begin
if (old.apptTime <> new.apptTime) then
insert into OldAppointment (id, personId, reason, missed)
values (old.id, old.personId, 'Changed appointment', 1);
END if;
END;
$$

select * from Appointment

delimiter ;
update Appointment
set apptTime = '2021-10-19 14:00:00'
where personId = 'BKX3780';

select * from Appointment
where personId = 'BKX3780';

select * from OldAppointment;