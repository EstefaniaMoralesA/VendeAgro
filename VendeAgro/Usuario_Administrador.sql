CREATE TABLE [dbo].[Usuario_Administrador]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[nombre] VARCHAR(30),
	[email] VARCHAR(50) NOT NULL, 
	[tokenEmail] VARCHAR(40) NOT NULL, 
	[tokenSesion] VARCHAR(40) NOT NULL, 
	[confirmaEmail] BIT NOT NULL, 
	[password] VARCHAR(40) NOT NULL, 
	[activo] BIT NOT NULL

)
