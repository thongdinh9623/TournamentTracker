CREATE TABLE dbo.Tournaments (
	id INT PRIMARY KEY IDENTITY(1, 1),
	TournamentName NVARCHAR(50),
	EntryFee MONEY
);

CREATE TABLE dbo.Prizes (
	id INT PRIMARY KEY IDENTITY(1, 1),
	PlaceNumber INT,
	PlaceName NVARCHAR(50),
	PrizeAmount MONEY,
	PrizePercentage FLOAT
);

CREATE TABLE dbo.Teams (
	id INT PRIMARY KEY IDENTITY(1, 1),
	TeamName NVARCHAR(50)
);

CREATE TABLE dbo.People (
	id INT PRIMARY KEY IDENTITY(1, 1),
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Email NVARCHAR(50),
	CellphoneNumber NVARCHAR(50)
);

CREATE TABLE dbo.TournamentEntries (
	id INT PRIMARY KEY IDENTITY(1, 1),
	TournamentId INT,
	TeamId INT,
	CONSTRAINT FK_TournamentEntries_Tournaments FOREIGN KEY (TournamentId) REFERENCES dbo.Tournaments(id),
	CONSTRAINT FK_TournamentEntries_Teams FOREIGN KEY (TeamId) REFERENCES dbo.Teams(id)
);

CREATE TABLE dbo.TournamentPrizes (
	id INT PRIMARY KEY IDENTITY(1, 1),
	TournamentId INT,
	PrizeId INT,
	CONSTRAINT FK_TournamentPrizes_Tournaments FOREIGN KEY (TournamentId) REFERENCES dbo.Tournaments(id),
	CONSTRAINT FK_TournamentPrizes_Teams FOREIGN KEY (TeamId) REFERENCES dbo.Teams(id)
);

CREATE TABLE dbo.TeamMembers (
	id INT PRIMARY KEY IDENTITY(1, 1),
	TeamId INT,
	PersonId INTR,
	CONSTRAINT FK_TeamMembers_Teams FOREIGN KEY (TeamId) REFERENCES dbo.Teams(id),
	CONSTRAINT FK_TeamMembers_People FOREIGN KEY (PersonId) REFERENCES dbo.People(id)
)

CREATE TABLE dbo.Matchups (
	id INT PRIMARY KEY IDENTITY(1, 1),
	WinnerId INT,
	MatchupRound INT,
	CONSTRAINT FK_Matchups_Teams FOREIGN KEY (WinnerId) REFERENCES dbo.Teams(id)
)

CREATE TABLE dbo.MatchupEntries (
	id INT PRIMARY KEY IDENTITY(1, 1),
	MatchupId INT,
	ParentMatchupId INT,
	TeamCompetingId INT,
	Score INT,
	CONSTRAINT FK_MatchupEntries_Matchups_1 FOREIGN KEY (MatchupId) REFERENCES dbo.Matchups(id),
	CONSTRAINT FK_MatchupEntries_Matchups_2 FOREIGN KEY (ParentMatchupId) REFERENCES dbo.Matchups(id),
	CONSTRAINT FK_MatchupEntries_Teams FOREIGN KEY (TeamCompetingId) REFERENCES dbo.Teams(id)
)