use Vaccinations
Go

CREATE or alter TRIGGER AU_appointmentChanged ON [dbo].[Appointment]
FOR UPDATE
AS
declare @id int;
declare @personId char(12);
declare @reason char(50);
declare @missed bit;
declare @OldapptTime datetime2(0);
declare @NewapptTime datetime2(0);
BEGIN
declare myCursor cursor local for select id, apptTime from Appointment
open myCursor
fetch next from myCursor into @id,@OldapptTime;
while @@FETCH_STATUS=0
begin
select @personId=personId from Appointment where id=@id;
select @OldapptTime=apptTime from Appointment where id=@id;
insert into OldAppointment Values(@id,@personId,@reason,@missed)
update Appointment SET apptTime=@NewapptTime where id=@id;
end
close myCursor
end

select * from Appointment
Go

-- Date currently 2021-08-02 09:00:00
update Appointment
set apptTime = '2021-10-19 14:00:00'
where personId = 'BKX3780'

select * from Appointment
where personId = 'BKX3780 '
Go

select * from OldAppointment
Go
