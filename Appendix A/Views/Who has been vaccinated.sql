USE Vaccinations
GO

-- 2. Who has been vaccinated
-- Create index on Appointment table
create index AppointmtentIndex
on [dbo].[Appointment] ([slot],[apptTime],[vaccineNumber],[vialNumber]);

-- Does not do much to speed up quiery speed
select [id],[placeId],[slot],[apptTime],[vaccineNumber],[personId],[vialNumber],[vaccinator]
from [dbo].[Appointment]
where [vialNumber] like 'SC%';

-- Creating Views as well as index is a better solution the will increase performance
create or alter view TheVacinated  as
select [id],[placeId],[slot],[apptTime],[vaccineNumber],[personId],[vialNumber],[vaccinator]
from [dbo].[Appointment]
where [vialNumber] like 'SC%';

select * from TheVacinated ;
