CREATE TABLE [dbo].[Anuncio]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	[titulo] VARCHAR(30) NOT NULL, 
	[descripcion] VARCHAR(250) NOT NULL, 
	[precio] FLOAT NOT NULL, 
	[activo] BIT NOT NULL, 
	[idUsuario] INT REFERENCES Usuario(id) ON DELETE SET NULL ON UPDATE CASCADE, 
	[idSubcategoria] INT REFERENCES Subcategoria(id) ON DELETE SET NULL ON UPDATE CASCADE, 
	[idCiudad] INT REFERENCES Ciudad(id) ON DELETE SET NULL ON UPDATE CASCADE, 
	[clicks] INT, 
	[vistas] INT,
	[estado] INT NOT NULL
)
