IF DB_ID(N'RequestStats') IS NULL
BEGIN
    CREATE DATABASE RequestStats;
END
GO

USE RequestStats;
GO

IF OBJECT_ID(N'dbo.request_history', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.request_history (
        id          BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        method      NVARCHAR(16)  NOT NULL,
        path        NVARCHAR(512) NOT NULL,
        client_ip   NVARCHAR(64)  NULL,
        user_agent  NVARCHAR(512) NULL,
        created_at  DATETIME2(0)  NOT NULL CONSTRAINT DF_request_history_created_at DEFAULT (SYSUTCDATETIME())
    );

    CREATE INDEX IX_request_history_method ON dbo.request_history(method);
    CREATE INDEX IX_request_history_created_at ON dbo.request_history(created_at DESC);
END
GO
