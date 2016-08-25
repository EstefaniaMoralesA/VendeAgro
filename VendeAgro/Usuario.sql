CREATE TABLE [dbo].[Usuario]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[nombre] VARCHAR(50) NOT NULL, 
	[apellidos] VARCHAR(80) NOT NULL, 
	[telefono] INT NOT NULL, 
	[email] VARCHAR(50) NOT NULL, 
	[password] VARCHAR(40) NOT NULL, 
	[confirmaEmail] BIT NOT NULL, 
	[token] VARCHAR(40) NOT NULL
)
