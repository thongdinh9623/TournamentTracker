CREATE OR ALTER PROCEDURE [dbo].[spPrizes_Insert]
	@PlaceNumber INT,
	@PlaceName NVARCHAR(50),
	@PrizeAmount MONEY,
	@PrizePercentage FLOAT,
	@id INT = 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT dbo.Prizes (PlaceNumber, PlaceName, PrizeAmount, PrizePercentage)
	VALUES (@PlaceNumber, @PlaceName, @PrizeAmount, @PrizePercentage);

	SELECT @id = SCOPE_IDENTITY();
END

select * from dbo.Prizes