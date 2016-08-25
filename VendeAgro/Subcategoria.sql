CREATE TABLE [dbo].[Subcategoria]
(
	[id] INT NOT NULL PRIMARY KEY,
	[nombre] VARCHAR(50) NOT NULL, 
	[activo] BIT NOT NULL, 
	[idCategoria] INT REFERENCES Categoria(id) ON DELETE CASCADE ON UPDATE CASCADE
)
