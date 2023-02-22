-- Use Vaccination database
USE Vaccinations
GO

-- Selects logs in the database to be backed up
BACKUP LOG [Vaccinations] 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\VaccinationsTransactionLog.bak'; -- Selects location for backup
GO
