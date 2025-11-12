# Atlético de Madrid Match Analysis (2009/10 - Present)
This repository contains a comprehensive analysis of the Atlético de Madrid match results, spanning from the 2009/2010 season up to today.

This project was developed as a practical exercise to cover all the relevant stages found in a real-world data analysis pipeline: data acquisition, cleaning, transformation, querying, and visualization.

🛠️ Project Stages
1. Python (Data Acquisition & Initial Processing)
- Web Scraping: Python was used to perform web scraping to obtain all match results for Atlético de Madrid from the 2009/10 season until now.
- Data Source: All results were successfully sourced from the footballdatabase.com website.

2. Pandas (Data Cleaning & Transformation): Once all the results were acquired, the Pandas library was used to clean and transform the data:
- Data Unification: Standardizing and unifying values, such as the names of the different tournaments.
- Feature Engineering: Creating new, insightful columns, like "Goal Difference."
- Text Cleaning: Removing special characters (e.g., accents/tildes) from team names for consistency.

3. SQL (Data Querying & Insights): The cleaned dataset was imported into a SQL database.
Various queries were executed to extract meaningful conclusions and create aggregated tables with the most relevant values. Examples include:
- Calculating the average percentage of wins, draws, and losses for each season.
- Identifying seasons with the highest number of goals scored and goals conceded.
- More...

4. Power BI (Data Visualization):
The final stage of the project brought all the obtained data to life with a visual layer for quick and intuitive understanding.
The Power BI dashboard includes several charts focused on key metrics to understand the team's performance across all these seasons.
The dashboard features various filters and buttons to focus the analysis clearly, allowing users to filter the data by competition or by home/away matches.

🎯 Key Questions Addressed: 
This analysis provides visual answers to several key questions regarding the club's performance over the last decade:
- Which competition is the one where Atlético de Madrid generally performs best?
- In which seasons did the team demonstrate the best defense or the best offense?
- Is there a significant difference in performance between home and away matches?
- How significantly did the arrival of Diego Simeone impact the club's results?
