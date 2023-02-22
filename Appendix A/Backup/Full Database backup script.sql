-- Use Vaccination database
USE Vaccinations
GO

-- Create backup of this database
BACKUP DATABASE [Vaccinations]
-- Save it to this location
TO DISK ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\VaccinationsFull.bak'
-- specifies that the backup operation verifies each page for checksum and torn page
WITH CHECKSUM;