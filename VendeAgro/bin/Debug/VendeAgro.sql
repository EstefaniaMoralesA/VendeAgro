﻿/*
Deployment script for VendeAgro

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "VendeAgro"
:setvar DefaultFilePrefix "VendeAgro"
:setvar DefaultDataPath "C:\Users\estef\AppData\Local\Microsoft\VisualStudio\SSDT\VendeAgro"
:setvar DefaultLogPath "C:\Users\estef\AppData\Local\Microsoft\VisualStudio\SSDT\VendeAgro"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
The column [dbo].[Pago].[idTarjeta] is being dropped, data loss could occur.

The column [dbo].[Pago].[digitosTarjeta] on table [dbo].[Pago] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Pago].[tipoTarjeta] on table [dbo].[Pago] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[Pago])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The column [dbo].[Usuario_Administrador].[token] on table [dbo].[Usuario_Administrador] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[Usuario_Administrador])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The type for column tipoTarjeta in table [dbo].[Usuario_Tarjeta] is currently  VARCHAR (30) NOT NULL but is being changed to  INT NOT NULL. Data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[Usuario_Tarjeta])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Dropping unnamed constraint on [dbo].[Pago]...';


GO
ALTER TABLE [dbo].[Pago] DROP CONSTRAINT [FK__Pago__idUsuario__5070F446];


GO
PRINT N'Dropping unnamed constraint on [dbo].[Pago]...';


GO
ALTER TABLE [dbo].[Pago] DROP CONSTRAINT [FK__Pago__idTarjeta__5165187F];


GO
PRINT N'Dropping unnamed constraint on [dbo].[Pago_Concepto]...';


GO
ALTER TABLE [dbo].[Pago_Concepto] DROP CONSTRAINT [FK__Pago_Conc__idPag__52593CB8];


GO
PRINT N'Altering [dbo].[Anuncio]...';


GO
ALTER TABLE [dbo].[Anuncio] ALTER COLUMN [precio] FLOAT (53) NOT NULL;


GO
PRINT N'Altering [dbo].[Beneficio]...';


GO
ALTER TABLE [dbo].[Beneficio] ALTER COLUMN [precio] FLOAT (53) NOT NULL;


GO
PRINT N'Altering [dbo].[Fotos_Anuncio]...';


GO
ALTER TABLE [dbo].[Fotos_Anuncio] ALTER COLUMN [ruta] VARCHAR (100) NOT NULL;


GO
PRINT N'Starting rebuilding table [dbo].[Pago]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Pago] (
    [id]             INT          NOT NULL,
    [idUsuario]      INT          NOT NULL,
    [tipoTarjeta]    INT          NOT NULL,
    [digitosTarjeta] INT          NOT NULL,
    [total]          FLOAT (53)   NOT NULL,
    [fecha]          DATE         NOT NULL,
    [tipo]           INT          NOT NULL,
    [Referencia]     VARCHAR (40) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Pago])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Pago] ([id], [idUsuario], [total], [fecha], [tipo], [Referencia])
        SELECT   [id],
                 [idUsuario],
                 [total],
                 [fecha],
                 [tipo],
                 [Referencia]
        FROM     [dbo].[Pago]
        ORDER BY [id] ASC;
    END

DROP TABLE [dbo].[Pago];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Pago]', N'Pago';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[Plazo]...';


GO
ALTER TABLE [dbo].[Plazo] ALTER COLUMN [precio] FLOAT (53) NOT NULL;


GO
PRINT N'Altering [dbo].[PlazoBase]...';


GO
ALTER TABLE [dbo].[PlazoBase] ALTER COLUMN [precioBase] FLOAT (53) NOT NULL;


GO
PRINT N'Starting rebuilding table [dbo].[Usuario_Administrador]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Usuario_Administrador] (
    [id]            INT          NOT NULL,
    [nombre]        VARCHAR (30) NULL,
    [email]         VARCHAR (50) NOT NULL,
    [token]         VARCHAR (40) NOT NULL,
    [confirmaEmail] BIT          NOT NULL,
    [password]      VARCHAR (40) NOT NULL,
    [activo]        BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Usuario_Administrador])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Usuario_Administrador] ([id], [nombre], [email], [confirmaEmail], [password], [activo])
        SELECT   [id],
                 [nombre],
                 [email],
                 [confirmaEmail],
                 [password],
                 [activo]
        FROM     [dbo].[Usuario_Administrador]
        ORDER BY [id] ASC;
    END

DROP TABLE [dbo].[Usuario_Administrador];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Usuario_Administrador]', N'Usuario_Administrador';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[Usuario_Tarjeta]...';


GO
ALTER TABLE [dbo].[Usuario_Tarjeta] ALTER COLUMN [tipoTarjeta] INT NOT NULL;


GO
PRINT N'Altering [dbo].[Videos_Anuncio]...';


GO
ALTER TABLE [dbo].[Videos_Anuncio] ALTER COLUMN [ruta] VARCHAR (100) NOT NULL;


GO
PRINT N'Creating unnamed constraint on [dbo].[Pago]...';


GO
ALTER TABLE [dbo].[Pago] WITH NOCHECK
    ADD FOREIGN KEY ([idUsuario]) REFERENCES [dbo].[Usuario] ([id]) ON UPDATE CASCADE;


GO
PRINT N'Creating unnamed constraint on [dbo].[Pago_Concepto]...';


GO
ALTER TABLE [dbo].[Pago_Concepto] WITH NOCHECK
    ADD FOREIGN KEY ([idPago]) REFERENCES [dbo].[Pago] ([id]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creating unnamed constraint on [dbo].[Usuario_Tarjeta]...';


GO
ALTER TABLE [dbo].[Usuario_Tarjeta] WITH NOCHECK
    ADD FOREIGN KEY ([idUsuario]) REFERENCES [dbo].[Usuario] ([id]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creating unnamed constraint on [dbo].[Videos_Anuncio]...';


GO
ALTER TABLE [dbo].[Videos_Anuncio] WITH NOCHECK
    ADD FOREIGN KEY ([idAnuncio]) REFERENCES [dbo].[Anuncio] ([id]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
CREATE TABLE [#__checkStatus] (
    id           INT            IDENTITY (1, 1) PRIMARY KEY CLUSTERED,
    [Schema]     NVARCHAR (256),
    [Table]      NVARCHAR (256),
    [Constraint] NVARCHAR (256)
);

SET NOCOUNT ON;

DECLARE tableconstraintnames CURSOR LOCAL FORWARD_ONLY
    FOR SELECT SCHEMA_NAME([schema_id]),
               OBJECT_NAME([parent_object_id]),
               [name],
               0
        FROM   [sys].[objects]
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.Pago'), OBJECT_ID(N'dbo.Pago_Concepto'), OBJECT_ID(N'dbo.Usuario_Tarjeta'), OBJECT_ID(N'dbo.Videos_Anuncio'))
               AND [type] IN (N'F', N'C')
                   AND [object_id] IN (SELECT [object_id]
                                       FROM   [sys].[check_constraints]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0
                                       UNION
                                       SELECT [object_id]
                                       FROM   [sys].[foreign_keys]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0);

DECLARE @schemaname AS NVARCHAR (256);

DECLARE @tablename AS NVARCHAR (256);

DECLARE @checkname AS NVARCHAR (256);

DECLARE @is_not_trusted AS INT;

DECLARE @statement AS NVARCHAR (1024);

BEGIN TRY
    OPEN tableconstraintnames;
    FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
    WHILE @@fetch_status = 0
        BEGIN
            PRINT N'Checking constraint: ' + @checkname + N' [' + @schemaname + N'].[' + @tablename + N']';
            SET @statement = N'ALTER TABLE [' + @schemaname + N'].[' + @tablename + N'] WITH ' + CASE @is_not_trusted WHEN 0 THEN N'CHECK' ELSE N'NOCHECK' END + N' CHECK CONSTRAINT [' + @checkname + N']';
            BEGIN TRY
                EXECUTE [sp_executesql] @statement;
            END TRY
            BEGIN CATCH
                INSERT  [#__checkStatus] ([Schema], [Table], [Constraint])
                VALUES                  (@schemaname, @tablename, @checkname);
            END CATCH
            FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
        END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') >= 0
    CLOSE tableconstraintnames;

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') = -1
    DEALLOCATE tableconstraintnames;

SELECT N'Constraint verification failed:' + [Schema] + N'.' + [Table] + N',' + [Constraint]
FROM   [#__checkStatus];

IF @@ROWCOUNT > 0
    BEGIN
        DROP TABLE [#__checkStatus];
        RAISERROR (N'An error occurred while verifying constraints', 16, 127);
    END

SET NOCOUNT OFF;

DROP TABLE [#__checkStatus];


GO
PRINT N'Update complete.';


GO