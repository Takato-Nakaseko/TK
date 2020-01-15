#List of members who attend clubs on Sunday
SELECT DISTINCT CONCAT(FirstName, ', ', LastName) AS Name
FROM	Members 
		JOIN MemberInClub
			USING (MemberID)
		JOIN Clubs
			USING (ClubID)
WHERE	MeetingDay = 'Su';

# list of club ID, meeting day, and gameTitle that has primary game to play.
SELECT	clubID, MeetingDay, gameTitle
FROM 	games
		JOIN clubs
			ON gameID = PrimaryGame
WHERE	PrimaryGame IS NOT NULL;

# list of clubs ID, meeting day, genre type, and genre description that has primary genre.
SELECT clubID, MeetingDay, GenreType, GenreDesc AS Description
FROM	clubs
		JOIN Genres
			 ON PrimaryGenre = GenreID
WHERE PrimaryGenre IS NOT NULL;

#All games and available platforms.
SELECT gameTitle, systemName AS platform
FROM   games
	   JOIN gamesonsystems
			USING (gameID)
	   JOIN systems
			USING (systemID);

#number of games in each genre (highest first)
SELECT 	genretype,
		COUNT(gameID) AS games
FROM	games
			JOIN genres
				USING (genreID)
GROUP BY genretype
ORDER BY games DESC;

