CREATE TABLE [dbo].[Plazo]
(
	[id] INT NOT NULL PRIMARY KEY,
	[meses] INT NOT NULL, 
	[precio] FLOAT NOT NULL,
	[porcentajeAhorro] FLOAT NOT NULL,
	[activo] BIT NOT NULL
)
