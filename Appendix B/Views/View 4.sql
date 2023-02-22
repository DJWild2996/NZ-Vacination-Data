use Vaccinations
Go

create or alter view vaccinesDone as
select Vaccinator.iRDNumber, Vaccinator.preferredName, Count(Appointment.personId) as [# of Vaccinations Given], Count(Appointment.vaccinator) as [# of Sessions]
From Vaccinator 
left join Appointment
On vaccinator.iRDNumber = Appointment.vaccinator
left join Place
on Appointment.placeId = Place.id
group by Vaccinator.iRDNumber, Vaccinator.preferredName
Go

-- test View
select * from vaccinesDone
Go
