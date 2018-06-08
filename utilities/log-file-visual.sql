-- From http://stevestedman.com/2016/04/visualizing-log-file-vlf-sizing/

USE tempdb;
GO
DECLARE @logInfoResults AS TABLE
(
 [RecoveryUnitId] BIGINT, -- only on SQL Server 2012 and newer
 [FileId] TINYINT,
 [FileSize] BIGINT,
 [StartOffset] BIGINT,
 [FSeqNo] INTEGER,
 [Status] TINYINT,
 [Parity] TINYINT,
 [CreateLSN] NUMERIC(38,0)
);
   
INSERT INTO @logInfoResults
EXEC sp_executesql N'DBCC LOGINFO WITH NO_INFOMSGS';
  
SELECT cast(FileSize / 1024.0 / 1024 AS DECIMAL(20,1)) as FileSizeInMB, 
 [Status] ,
 REPLICATE('x', FileSize / 1024 / 1024 ) as [BarChart ________________________________________________________________________________________________]
 FROM @logInfoResults ;