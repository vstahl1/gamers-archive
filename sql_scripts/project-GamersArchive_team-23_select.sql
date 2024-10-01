-- 1. Retrieve all video games along with their corresponding studio names and release years
SELECT vg.title AS Game_Title, s.studio_name AS Studio, vg.release_year
FROM Video_Game vg
JOIN Studio s ON vg.studio_id = s.studio_id
ORDER BY vg.release_year DESC;

-- 2. List all reviews for a specific video game (e.g., "Astral Odyssey") with player names and ratings
SELECT vg.title AS Game_Title, p.player_name AS Reviewer, r.rating, r.comments
FROM Review r
JOIN Video_Game vg ON r.game_id = vg.game_id
JOIN Player p ON r.player_id = p.player_id
WHERE vg.title = 'Astral Odyssey'
ORDER BY r.rating DESC;

-- 3. Find all video games that belong to a specific genre (e.g., "Space Exploration")
SELECT vg.title AS Game_Title, g.genre_name AS Genre
FROM Video_Game vg
JOIN Game_Genre gg ON vg.game_id = gg.game_id
JOIN Genre g ON gg.genre_id = g.genre_id
WHERE g.genre_name = 'Space Exploration';

-- 4. Display the top-rated video games (average rating) with at least 2 reviews
SELECT vg.title AS Game_Title, AVG(r.rating) AS Average_Rating, COUNT(r.review_id) AS Number_of_Reviews
FROM Video_Game vg
JOIN Review r ON vg.game_id = r.game_id
GROUP BY vg.game_id
HAVING COUNT(r.review_id) >= 2
ORDER BY Average_Rating DESC;

-- 5. Retrieve the number of video games developed by each studio
SELECT s.studio_name AS Studio, COUNT(vg.game_id) AS Number_of_Games
FROM Studio s
LEFT JOIN Video_Game vg ON s.studio_id = vg.studio_id
GROUP BY s.studio_name
ORDER BY Number_of_Games DESC;

-- 6. Find all players who have written reviews for a specific video game (e.g., "Cyber Clash")
SELECT p.player_name AS Player, r.rating, r.comments, r.review_id
FROM Player p
JOIN Review r ON p.player_id = r.player_id
JOIN Video_Game vg ON r.game_id = vg.game_id
WHERE vg.title = 'Cyber Clash';

-- 7. List all genres associated with a specific video game (e.g., "Mystic Realms")
SELECT vg.title AS Game_Title, g.genre_name AS Genre
FROM Video_Game vg
JOIN Game_Genre gg ON vg.game_id = gg.game_id
JOIN Genre g ON gg.genre_id = g.genre_id
WHERE vg.title = 'Mystic Realms';

-- 8. Display all players who haven't written any reviews yet
SELECT p.player_name AS Player, p.email
FROM Player p
LEFT JOIN Review r ON p.player_id = r.player_id
WHERE r.review_id IS NULL;

-- 9. Retrieve all reviews with the game title, player name, and timestamp, sorted by the latest review first
SELECT vg.title AS Game_Title, p.player_name AS Reviewer, r.rating, r.comments, s.timestamp
FROM Review r
JOIN Video_Game vg ON r.game_id = vg.game_id
JOIN Player p ON r.player_id = p.player_id
JOIN Submits s ON r.review_id = s.review_id
ORDER BY s.timestamp DESC;

-- 10. List all video games along with the number of reviews they have received
SELECT vg.title AS Game_Title, COUNT(r.review_id) AS Number_of_Reviews
FROM Video_Game vg
LEFT JOIN Review r ON vg.game_id = r.game_id
GROUP BY vg.game_id
ORDER BY Number_of_Reviews DESC;

-- 11. Find all games developed by a specific studio (e.g., "PixelPeak Games")
SELECT vg.title AS Game_Title, s.studio_name AS Studio
FROM Video_Game vg
JOIN Studio s ON vg.studio_id = s.studio_id
WHERE s.studio_name = 'PixelPeak Games';

-- 12. Display all players who have reviewed more than one game
SELECT p.player_name AS Player, COUNT(r.review_id) AS Number_of_Reviews
FROM Player p
JOIN Review r ON p.player_id = r.player_id
GROUP BY p.player_name
HAVING COUNT(r.review_id) > 1;

-- 13. Show the average rating for each game, ordered by the highest average rating
SELECT vg.title AS Game_Title, AVG(r.rating) AS Average_Rating
FROM Video_Game vg
JOIN Review r ON vg.game_id = r.game_id
GROUP BY vg.game_id
ORDER BY Average_Rating DESC;

-- 14. List all genres that have more than one game associated with them
SELECT g.genre_name AS Genre, COUNT(gg.game_id) AS Number_of_Games
FROM Genre g
JOIN Game_Genre gg ON g.genre_id = gg.genre_id
GROUP BY g.genre_name
HAVING COUNT(gg.game_id) > 1;

-- 15. Find the most recent review submitted for each game
SELECT vg.title AS Game_Title, r.comments AS Latest_Review, s.timestamp
FROM Video_Game vg
JOIN Review r ON vg.game_id = r.game_id
JOIN Submits s ON r.review_id = s.review_id
WHERE s.timestamp = (SELECT MAX(s2.timestamp) FROM Submits s2 WHERE s2.review_id = r.review_id)
ORDER BY s.timestamp DESC;

-- 16. Display the number of players who have reviewed each genre
SELECT g.genre_name AS Genre, COUNT(DISTINCT r.player_id) AS Number_of_Players
FROM Genre g
JOIN Game_Genre gg ON g.genre_id = gg.genre_id
JOIN Review r ON gg.game_id = r.game_id
GROUP BY g.genre_name
ORDER BY Number_of_Players DESC;

-- 17. List games that have no reviews yet
SELECT vg.title AS Game_Title
FROM Video_Game vg
LEFT JOIN Review r ON vg.game_id = r.game_id
WHERE r.review_id IS NULL;

-- 18. Retrieve the details of the highest-rated review for each game
SELECT vg.title AS Game_Title, r.comments AS Review, r.rating
FROM Video_Game vg
JOIN Review r ON vg.game_id = r.game_id
WHERE r.rating = (SELECT MAX(r2.rating) FROM Review r2 WHERE r2.game_id = vg.game_id);
