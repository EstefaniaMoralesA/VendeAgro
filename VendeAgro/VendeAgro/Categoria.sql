﻿CREATE TABLE [dbo].[Categoria]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[nombre] VARCHAR(50) NOT NULL, 
	[activo] BIT NOT NULL
)
