# Project: Gamer's Archive Database Implementation - Team 23

## Overview
This project involves the implementation of a video game review database application called "Gamer's Archive." The database stores information about video games, studios, genres, players, and reviews. The application supports functionalities such as inserting, updating, deleting, and querying data for each of the entities.

## Key Issues from the Feedback

1. **Genre and Game Relationship**:
   - The Genre entity was initially modeled as a weak entity, incorrectly showing that it depends on the `Video_Game` entity. Since genres can exist independently, this relationship needed adjustment.

2. **Participation/Cardinality Issues**:
   - **Studio and Video_Game**: The original model suggested that a studio produces exactly one video game and that a video game could be produced by multiple studios. This was incorrect; a single studio can produce multiple games, but each game is developed by only one studio.
   - **Player and Review Relationship**: The diagram incorrectly indicated that a player submits exactly one review and a review could be submitted by multiple players. This needed to be changed to reflect that a player can submit multiple reviews, but each review is associated with only one player.
   - **Total Participation**: The `Review` entity needed to show total participation with the `Player` entity to accurately represent that every review must be written by a player.

## Adjustments Made Based on the Feedback

1. **Corrected Genre as a Strong Entity**:
   - The `Genre` entity is now an independent, strong entity, and its many-to-many relationship with `Video_Game` is managed by the `Game_Genre` associative table.

2. **Corrected Participation/Cardinality for Studio and Video_Game**:
   - Ensured that a `Studio` produces multiple games, but each `Video_Game` is developed by exactly one `Studio`.

3. **Ensured Total Participation for Review with Player**:
   - The `Review` entity now has total participation with `Player`, reflecting that every review must be submitted by a player.

## Description of the SQL Files

### 1. project-GamersArchive_team-23_create.sql
   - Contains the SQL statements for creating the tables in the database, including the primary and foreign key constraints.
   - The tables created are: `Studio`, `Video_Game`, `Genre`, `Game_Genre` (associative entity for the many-to-many relationship), `Player`, `Review`, and `Submits`.
   - This script ensures referential integrity using appropriate `ON DELETE CASCADE` constraints.

### 2. project-GamersArchive_team-23_insert.sql
   - Contains SQL statements to insert sample data into each of the tables.
   - The sample data includes entries for `Studio`, `Video_Game`, `Genre`, `Player`, `Review`, `Game_Genre`, and `Submits` tables.
   - This data is designed to test and demonstrate the functionalities of the database application.

### 3. project-GamersArchive_team-23_select.sql
   - Contains a variety of SELECT queries to demonstrate the usefulness of the database.
   - These queries retrieve data such as video game details, reviews by players, genres associated with games, and the top-rated video games.
   - The queries demonstrate the relationships between different entities and showcase the database's querying capabilities.

## How to Run the SQL Files Using the MySQL Console

1. **Open Command Prompt**:
   - Press `Windows + R`, type `cmd`, and press Enter.

2. **Log in to MySQL**:
   - Enter the following command:
     ```
     mysql -u root -p
     ```
   - Replace `root` with your MySQL username if different, and enter your password when prompted.

3. **Create and Use the Database**:
   - Run the following commands to create and select your database:
     ```sql
     CREATE DATABASE gamers_archive;
     USE gamers_archive;
     ```

4. **Run the SQL Files**:
   - Assuming your SQL files are located in `C:\sql_files`, you can run each file using the following commands:
     ```sql
     SOURCE C:\sql_files\project-GamersArchive_team-23_create.sql;
     SOURCE C:\sql_files\project-GamersArchive_team-23_insert.sql;
     SOURCE C:\sql_files\project-GamersArchive_team-23_select.sql;
     ```
   - Make sure the file paths match the actual location of your SQL files.

**Note**: If you see no output for `create.sql` and `insert.sql`, it means they executed successfully. The `select.sql` file should display the results of the queries.

## Notes
- The database was implemented using MySQL, and all SQL scripts are compatible with MySQL syntax.
- Ensure you have the necessary permissions to create and modify tables in your MySQL database before executing the scripts.

## Video URL
- https://www.youtube.com/watch?v=0tZIjYg3G9Y
