CREATE TABLE [dbo].[Usuario_Tarjeta]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[tipoTarjeta] INT NOT NULL, 
	[digitosTarjeta] INT NOT NULL, 
	[fechaVencimiento] DATE NOT NULL, 
	[tokenTarjeta] VARCHAR(40) NOT NULL, 
	[idUsuario] INT NOT NULL FOREIGN KEY REFERENCES Usuario(id) ON DELETE CASCADE ON UPDATE CASCADE, 
	[activo] BIT NOT NULL
)
