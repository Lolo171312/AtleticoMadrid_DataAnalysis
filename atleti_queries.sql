SELECT * FROM results;

SELECT DISTINCT(Competition) FROM results;

/*Get the total count of goals per season and order it from more to less*/
SELECT SUM(Atletico_Goals) as TotalGoals, Season FROM results
GROUP BY Season
ORDER BY TotalGoals DESC;

/*Get the same result as the previous one but filter by Competition*/
/*SPAIN LIGA*/
SELECT SUM(Atletico_Goals) as TotalGoals_Liga, Season FROM results
WHERE Competition = "Spain Liga"
GROUP BY Season
ORDER BY TotalGoals_Liga DESC;
/*UEFA CHAMPIONS*/
SELECT SUM(Atletico_Goals) as TotalGoals_Champions, Season FROM results
WHERE Competition = "UEFA Champions League"
GROUP BY Season
ORDER BY TotalGoals_Champions DESC;
/*UEFA EUROPA LEAGUE*/
SELECT SUM(Atletico_Goals) as TotalGoals_EuroLeague, Season FROM results
WHERE Competition = "UEFA Europa League"
GROUP BY Season
ORDER BY TotalGoals_EuroLeague DESC;
/*Mix between UEFA CHAMPIONS and UEFA EUROPA LEAGUE*/
SELECT SUM(Atletico_Goals) as TotalGoals_Euro, Competition, Season FROM results
WHERE Competition LIKE "UEFA%"
GROUP BY Season, Competition
ORDER BY TotalGoals_Euro DESC;

/*Goal Average Queries*/
/*Calculate the Goal Average per Season*/
SELECT AVG(Atletico_Goals) AS Avarage_Goals, Season FROM results
GROUP BY Season
ORDER BY Avarage_Goals DESC;
/*Calculate the Goal Average per Competition*/
SELECT AVG(Atletico_Goals) AS Avarage_Goals, Competition FROM results
GROUP BY Competition
ORDER BY Avarage_Goals DESC;
/*Calculate the Goal Average per Season and Competition*/
SELECT AVG(Atletico_Goals) AS Avarage_Goals, Competition, Season FROM results
GROUP BY Competition, Season
ORDER BY Avarage_Goals DESC;

/*Avarage Win, Draw and Loss Games*/
/*Avarage at Home or Away*/
SELECT
    COUNT(*) AS Total_Matches,
    CAST(SUM(CASE WHEN Match_Status = 'Win' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Win_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Draw' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Draw_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Loss' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Loss_Percentage,
    Place FROM results
GROUP BY Place;
/*Avarage results per Season*/
SELECT
    Place, COUNT(*) AS Total_Matches,
    CAST(SUM(CASE WHEN Match_Status = 'Win' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Win_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Draw' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Draw_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Loss' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Loss_Percentage,
    Season FROM results
GROUP BY Place, Season
ORDER BY Season DESC, Place DESC;
/*Avarage results per Competition*/
SELECT
    Place, Competition, COUNT(*) AS Total_Matches,
    CAST(SUM(CASE WHEN Match_Status = 'Win' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Win_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Draw' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Draw_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Loss' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Loss_Percentage 
    FROM results
GROUP BY Place, Competition
ORDER BY Competition DESC, Place DESC;
/*Avarage results per Season and Competition*/
SELECT
    Place, Competition, COUNT(*) AS Total_Matches,
    CAST(SUM(CASE WHEN Match_Status = 'Win' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Win_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Draw' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Draw_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Loss' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Loss_Percentage,
    Season FROM results
GROUP BY Place, Season, Competition
ORDER BY Season DESC, Competition, Place DESC;
/*Average results per day LALIGA*/
SELECT
    DAYNAME(results.Date) AS Day_Name, COUNT(*) AS Total_Matches,
    CAST(SUM(CASE WHEN Match_Status = 'Win' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Win_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Draw' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Draw_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Loss' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Loss_Percentage
    FROM results
WHERE Competition = "Spain Liga"
GROUP BY Day_Name
ORDER BY
FIELD(Day_Name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
/*Average results per day UEFA Champions League*/
SELECT
    DAYNAME(results.Date) AS Day_Name, COUNT(*) AS Total_Matches,
    CAST(SUM(CASE WHEN Match_Status = 'Win' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Win_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Draw' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Draw_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Loss' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Loss_Percentage
    FROM results
WHERE Competition = "UEFA Champions League"
GROUP BY Day_Name
ORDER BY
FIELD(Day_Name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
/*Average results per day UEFA Europa League*/
SELECT
    DAYNAME(results.Date) AS Day_Name, COUNT(*) AS Total_Matches,
    CAST(SUM(CASE WHEN Match_Status = 'Win' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Win_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Draw' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Draw_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Loss' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Loss_Percentage
    FROM results
WHERE Competition = "UEFA Europa League"
GROUP BY Day_Name
ORDER BY
FIELD(Day_Name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

/*Goals For and Goals Against Atletico de Madrid*/
/*La Liga*/
SELECT SUM(Opponent_Goals) AS Goals_Against, 
	CASE
		WHEN Home_Team = "Atletico Madrid" THEN Away_Team
        ELSE Home_Team
    END AS Opponent
FROM results
WHERE Competition = "Spain Liga"
GROUP BY Opponent
ORDER BY Goals_Against DESC, Opponent DESC;
/*Champions*/
SELECT SUM(Opponent_Goals) AS Goals_Against, 
	CASE
		WHEN Home_Team = "Atletico Madrid" THEN Away_Team
        ELSE Home_Team
    END AS Opponent
FROM results
WHERE Competition = "UEFA Champions League"
GROUP BY Opponent
ORDER BY Goals_Against DESC, Opponent DESC
LIMIT 10;
/*La Liga*/
SELECT SUM(Atletico_Goals) AS Goals_Scored, 
	CASE
		WHEN Home_Team = "Atletico Madrid" THEN Away_Team
        ELSE Home_Team
    END AS Opponent
FROM results
WHERE Competition = "Spain Liga"
GROUP BY Opponent
ORDER BY Goals_Scored DESC, Opponent DESC
LIMIT 10;
/*Champions*/
SELECT SUM(Atletico_Goals) AS Goals_Scored,
	CASE
		WHEN Home_Team = "Atletico Madrid" THEN Away_Team
        ELSE Home_Team
    END AS Opponent
FROM results
WHERE Competition = "UEFA Champions League"
GROUP BY Opponent
ORDER BY Goals_Scored DESC, Opponent DESC
LIMIT 10;

/*Nemesis*/
SELECT
	SUM(CASE WHEN Match_Status = "Loss" THEN 1 ELSE 0 END) AS Games_Lost,
    CASE WHEN Home_Team = "Atletico Madrid" THEN Away_Team ELSE Home_Team END AS Nemesis
FROM results
WHERE Competition = "Spain Liga"
GROUP BY Nemesis
ORDER BY Games_Lost DESC
LIMIT 5;
/*Teams that Atletico is superior to*/
SELECT
	SUM(CASE WHEN Match_Status = "Win" THEN 1 ELSE 0 END) AS Games_Won,
    SUM(CASE WHEN Match_Status = "Loss" THEN 1 ELSE 0 END) AS Games_Lost,
    CASE WHEN Home_Team = "Atletico Madrid" THEN Away_Team ELSE Home_Team END AS Other_Team,
    Competition
FROM results
WHERE Competition = "UEFA Europa League"
GROUP BY Other_Team, Competition
ORDER BY Games_Won DESC;

/*Avarage results Before and After Simeone*/
SELECT
	CASE
		WHEN results.Date > '2011-12-1' THEN "After Simeone" ELSE "Before Simeone" /*Simeone started in Atletico at 1st December 2011*/
    END AS Simeone,
    COUNT(*) AS Total_Matches,
    CAST(SUM(CASE WHEN Match_Status = 'Win' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Win_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Draw' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Draw_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Loss' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Loss_Percentage 
    FROM results
WHERE Competition = "Spain Liga"
GROUP BY Simeone;
/*Avarage results After Simeone*/
SELECT
    COUNT(*) AS Total_Matches,
    CAST(SUM(CASE WHEN Match_Status = 'Win' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Win_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Draw' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Draw_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Loss' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Loss_Percentage,
    Season
    FROM results
WHERE Competition = "Spain Liga" AND results.Date > '2011-12-1' /*Simeone started in Atletico at 1st December 2011*/
GROUP BY Season
ORDER BY Win_Percentage DESC;

/*Avarage results Before and After Metropolitano*/
SELECT
	CASE
		WHEN results.Date > '2017-9-17' THEN "After Metropolitano" ELSE "Before Metropolitano" /*Atletico´s first match in Metropolitano was September 17th 2017*/
    END AS Metropolitano,
    COUNT(*) AS Total_Matches,
    CAST(SUM(CASE WHEN Match_Status = 'Win' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Win_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Draw' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Draw_Percentage,
    CAST(SUM(CASE WHEN Match_Status = 'Loss' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS Loss_Percentage 
    FROM results
WHERE Competition = "Spain Liga" AND Home_Team = "Atletico Madrid"
GROUP BY Metropolitano;