USE DATABASE
GO
ALTER DATABASE DATABASE SET RECOVERY SIMPLE WITH NO_WAIT
DBCC SHRINKFILE(DATABASE_LOG,10240)
ALTER DATABASE DATABASE SET RECOVERY FULL WITH NO_WAIT
GO