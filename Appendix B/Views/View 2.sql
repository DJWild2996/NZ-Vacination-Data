use Vaccinations
Go

-- Create view showing people that had appointments before todays date but don't have a accinator id
create or alter view BookingsMissed as
select Person.preferredName, Person.eMail, Person.phone, Person.preferredContactMethod, Appointment.apptTime, Appointment.vialNumber, Appointment.vaccinator
from Person inner join Appointment
on Person.NHI = Appointment.personId
where Appointment.apptTime < getdate() and Appointment.vialNumber Is Null
Go

-- test View
select * from BookingsMissed
Go
