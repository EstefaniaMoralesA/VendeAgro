CREATE TABLE [dbo].[PlazoBase]
(
	[id] INT NOT NULL PRIMARY KEY,
	[precioBase] FLOAT NOT NULL,
	[fechaModificacion] DATE NOT NULL, 
	[activo] BIT NOT NULL
)
