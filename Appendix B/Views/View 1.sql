use Vaccinations
Go

create or alter view vaccinationsHappening  as
select Place.longName, count(Appointment.slot) as [# of vaccinations that could happen], count(Appointment.vialNumber) as [# that actually happened], Appointment.apptTime
from Place inner join Appointment 
on Place.id = Appointment.placeId
group by Place.longName, Appointment.apptTime
go

-- test View
select * from vaccinationsHappening
Go