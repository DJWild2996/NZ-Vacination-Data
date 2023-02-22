USE Vaccinations
GO

-- 3. Where vaccinations have occurred
-- Create index on Appointment table
create index AppointmentIndex
on [dbo].[Appointment] ([slot],[apptTime],[vaccineNumber],[vialNumber]);

create index PlaceIndex
on [dbo].[Place] ([longName],[maxSlots]);

-- Does not do much to speed up quiery speed
select Appointment.id, Appointment.apptTime, place.longName
from Appointment inner join Place
on Appointment.placeId = place.id;

-- Creating Views as well as index is a better solution the will increase performance
create or alter view whereVaccinationOccurred as
select Appointment.id, Appointment.apptTime, place.longName
from Appointment inner join Place
on Appointment.placeId = place.id;

select * from whereVaccinationOccurred;