CREATE TABLE [dbo].[Paquete]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[nombre] VARCHAR(50) NOT NULL,
	[meses] INT NOT NULL, 
	[numeroAnuncios] INT NOT NULL,
	[precio] FLOAT NOT NULL,
	[descripcion] VARCHAR(200) NOT NULL,
	[paqueteBase] BIT NOT NULL,
	[fechaModificacion] DATE NOT NULL, 
	[activo] BIT NOT NULL
)
