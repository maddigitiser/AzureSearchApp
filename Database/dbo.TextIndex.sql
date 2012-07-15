CREATE TABLE [dbo].[TextIndex]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Token] NVARCHAR(50) NOT NULL, 
    [SourceFile] NVARCHAR(50) NOT NULL, 
    [Occurances] INT NOT NULL
)

GO

CREATE INDEX [IX_TextIndex_Token] ON [dbo].[TextIndex] ([Token])
