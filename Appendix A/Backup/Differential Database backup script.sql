-- Use Vaccination database
USE Vaccinations
GO

-- Selects database to be backed up
BACKUP DATABASE [Vaccinations]               
        TO DISK =  'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\VaccinationsDifferential.bak' -- Selects location for backup
        WITH DIFFERENTIAL; -- Backup type differental so only backs up the changes compared to last full backup
GO