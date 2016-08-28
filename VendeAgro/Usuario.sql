CREATE TABLE [dbo].[Usuario]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[nombre] VARCHAR(50) NOT NULL, 
	[apellidos] VARCHAR(80) NOT NULL, 
	[telefono] INT NOT NULL, 
	[email] VARCHAR(50) NOT NULL, 
	[password] VARCHAR(40) NOT NULL, 
	[confirmaEmail] BIT NOT NULL, 
	[tokenEmail] VARCHAR(40) NOT NULL,
	[tokenSesion] VARCHAR(40) NOT NULL
)
