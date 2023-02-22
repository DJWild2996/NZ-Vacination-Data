USE [Vaccinations]
GO

--Create Admins role
CREATE ROLE Admins AUTHORIZATION db_owner;  
GO

--Create Worker login
CREATE LOGIN Worker   
WITH PASSWORD = 'Password';  
GO

--Create Worker User
CREATE USER Worker1 FOR LOGIN Worker;
GO

--Add Worker1 to Admins
ALTER ROLE Admins ADD MEMBER Worker1;
GO

-- Grant Admins access to view whereVaccinationOccurred but deny them changes
GRANT SELECT ON [dbo].whereVaccinationOccurred TO Admins
GO
DENY ALTER ON [dbo].whereVaccinationOccurred TO Admins
GO
DENY CONTROL ON [dbo].whereVaccinationOccurred TO Admins
GO
DENY DELETE ON [dbo].whereVaccinationOccurred TO Admins
GO
DENY INSERT ON [dbo].whereVaccinationOccurred TO Admins
GO
DENY UPDATE ON [dbo].whereVaccinationOccurred TO Admins
GO

--Deny access to the tables
DENY ALTER ON [dbo].[AllPeople] TO [Admins]
GO
DENY CONTROL ON [dbo].[AllPeople] TO [Admins]
GO
DENY DELETE ON [dbo].[AllPeople] TO [Admins]
GO
DENY INSERT ON [dbo].[AllPeople] TO [Admins]
GO
DENY REFERENCES ON [dbo].[AllPeople] TO [Admins]
GO
DENY SELECT ON [dbo].[AllPeople] TO [Admins]
GO
DENY TAKE OWNERSHIP ON [dbo].[AllPeople] TO [Admins]
GO
DENY UPDATE ON [dbo].[AllPeople] TO [Admins]
GO

DENY ALTER ON [dbo].[Appointment] TO [Admins]
GO
DENY CONTROL ON [dbo].[Appointment] TO [Admins]
GO
DENY DELETE ON [dbo].[Appointment] TO [Admins]
GO
DENY INSERT ON [dbo].[Appointment] TO [Admins]
GO
DENY REFERENCES ON [dbo].[Appointment] TO [Admins]
GO
DENY SELECT ON [dbo].[Appointment] TO [Admins]
GO
DENY TAKE OWNERSHIP ON [dbo].[Appointment] TO [Admins]
GO
DENY UPDATE ON [dbo].[Appointment] TO [Admins]
GO

DENY ALTER ON [dbo].[OldAppointment] TO [Admins]
GO
DENY CONTROL ON [dbo].[OldAppointment] TO [Admins]
GO
DENY DELETE ON [dbo].[OldAppointment] TO [Admins]
GO
DENY INSERT ON [dbo].[OldAppointment] TO [Admins]
GO
DENY REFERENCES ON [dbo].[OldAppointment] TO [Admins]
GO
DENY SELECT ON [dbo].[OldAppointment] TO [Admins]
GO
DENY TAKE OWNERSHIP ON [dbo].[OldAppointment] TO [Admins]
GO
DENY UPDATE ON [dbo].[OldAppointment] TO [Admins]
GO

DENY ALTER ON [dbo].[Person] TO [Admins]
GO
DENY CONTROL ON [dbo].[Person] TO [Admins]
GO
DENY DELETE ON [dbo].[Person] TO [Admins]
GO
DENY INSERT ON [dbo].[Person] TO [Admins]
GO
DENY REFERENCES ON [dbo].[Person] TO [Admins]
GO
DENY SELECT ON [dbo].[Person] TO [Admins]
GO
DENY TAKE OWNERSHIP ON [dbo].[Person] TO [Admins]
GO
DENY UPDATE ON [dbo].[Person] TO [Admins]
GO

DENY ALTER ON [dbo].[Place] TO [Admins]
GO
DENY CONTROL ON [dbo].[Place] TO [Admins]
GO
DENY DELETE ON [dbo].[Place] TO [Admins]
GO
DENY INSERT ON [dbo].[Place] TO [Admins]
GO
DENY REFERENCES ON [dbo].[Place] TO [Admins]
GO
DENY SELECT ON [dbo].[Place] TO [Admins]
GO
DENY TAKE OWNERSHIP ON [dbo].[Place] TO [Admins]
GO
DENY UPDATE ON [dbo].[Place] TO [Admins]
GO

DENY ALTER ON [dbo].[Vaccinator] TO [Admins]
GO
DENY CONTROL ON [dbo].[Vaccinator] TO [Admins]
GO
DENY DELETE ON [dbo].[Vaccinator] TO [Admins]
GO
DENY INSERT ON [dbo].[Vaccinator] TO [Admins]
GO
DENY REFERENCES ON [dbo].[Vaccinator] TO [Admins]
GO
DENY SELECT ON [dbo].[Vaccinator] TO [Admins]
GO
DENY TAKE OWNERSHIP ON [dbo].[Vaccinator] TO [Admins]
GO
DENY UPDATE ON [dbo].[Vaccinator] TO [Admins]
GO