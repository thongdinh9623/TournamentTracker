SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE spPeople_Insert
	@FirstName NVARCHAR(50), 
	@LastName NVARCHAR(50),
	@EmailAddress NVARCHAR(50),
	@CellphoneNumber NVARCHAR(50),
	@id INT = 0 OUTPUT
AS
BEGIN	
	SET NOCOUNT ON;
    
	INSERT dbo.People (FirstName, LastName, EmailAddress, CellphoneNumber)
	VALUES (@FirstName, @LastName, @EmailAddress, @CellphoneNumber);

	SELECT @id = SCOPE_IDENTITY();
END
GO