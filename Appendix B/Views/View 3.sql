use Vaccinations
Go

-- Create views
Create or Alter View Under40Vaccinated as
select TOP(1000) DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766 AS Age, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
from Person inner join Appointment
on Person.NHI = Appointment.personId
where Appointment.vaccinator Is NOT NUll
group by Person.dateOfBirth, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
having DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766 <= 40
order by Age desc
Go

Create or Alter View Under50Vaccinated as
select TOP(1000) DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766 AS Age, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
from Person inner join Appointment
on Person.NHI = Appointment.personId
where Appointment.vaccinator Is NOT NUll
group by Person.dateOfBirth, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
having (DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766) <= 50 and (DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766) >= 41
order by Age desc
Go

Create or Alter View Under60Vaccinated as
select TOP(1000) DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766 AS Age, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
from Person inner join Appointment
on Person.NHI = Appointment.personId
where Appointment.vaccinator Is NOT NUll
group by Person.dateOfBirth, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
having (DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766) <= 60 and (DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766) >= 51
order by Age desc
Go

Create or Alter View Under70Vaccinated as
select TOP(1000) DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766 AS Age, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
from Person inner join Appointment
on Person.NHI = Appointment.personId
where Appointment.vaccinator Is NOT NUll
group by Person.dateOfBirth, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
having (DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766) <= 70 and (DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766) >= 61
order by Age desc
Go

Create or Alter View Under80Vaccinated as
select TOP(1000) DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766 AS Age, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
from Person inner join Appointment
on Person.NHI = Appointment.personId
where Appointment.vaccinator Is NOT NUll
group by Person.dateOfBirth, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
having (DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766) <= 80 and (DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766) >= 71
order by Age desc
Go

Create or Alter View Under90Vaccinated as
select TOP(1000) DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766 AS Age, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
from Person inner join Appointment
on Person.NHI = Appointment.personId
where Appointment.vaccinator Is NOT NUll
group by Person.dateOfBirth, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
having (DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766) <= 90 and (DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766) >= 81
order by Age desc
Go

Create or Alter View Over90Vaccinated as
select TOP(1000) DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766 AS Age, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
from Person inner join Appointment
on Person.NHI = Appointment.personId
where Appointment.vaccinator Is NOT NUll
group by Person.dateOfBirth, Person.NHI, person.preferredName, Appointment.apptTime, Appointment.vaccinator
having (DATEDIFF(hour,Person.dateOfBirth,GETDATE())/8766) >= 91
order by Age desc
Go


-- test Views
select * from Under40Vaccinated
go

select * from Under50Vaccinated
go

select * from Under60Vaccinated
go

select * from Under70Vaccinated
go

select * from Under80Vaccinated
go

select * from Under90Vaccinated
go

select * from Over90Vaccinated
go