﻿CREATE TABLE [dbo].[Estado]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[nombre] VARCHAR(30) NOT NULL,
	[idPais] INT NOT NULL FOREIGN KEY REFERENCES Pais(id) ON UPDATE CASCADE ON DELETE CASCADE
)
