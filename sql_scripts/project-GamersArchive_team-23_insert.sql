-- Inserting additional sample data into Studio table
INSERT INTO Studio (studio_name, street_num, street_name, city, state, zip)
VALUES 
('StarForge Studios', '123', 'Galactic Blvd', 'Nebula City', 'TX', '78901'),
('PixelPeak Games', '456', 'Arcade Ave', 'Retroville', 'CA', '90210'),
('Quantum Realms', '789', 'Quantum St', 'Paradox Bay', 'FL', '32102'),
('ThunderPixel Interactive', '101', 'Pixel Path', 'Cyber City', 'NY', '10001'),
('NeonSynthesis', '202', 'Circuit Rd', 'Digital Hills', 'NV', '89109');

-- Inserting additional sample data into Video_Game table
INSERT INTO Video_Game (title, release_year, esrb, description, studio_id)
VALUES 
('Astral Odyssey', 2023, 'T', 'A space exploration game with endless planets to discover.', 1),
('Retro Rampage', 2022, 'E', 'A throwback platformer with 8-bit graphics and modern gameplay.', 2),
('Neon Drift', 2021, 'E10+', 'A futuristic racing game with dynamic neon tracks.', 2),
('Temporal Tactics', 2020, 'M', 'A turn-based strategy game set in different timelines.', 3),
('Mystic Realms', 2019, 'T', 'A fantasy MMORPG with an evolving world and epic quests.', 3),
('Cyber Clash', 2023, 'T', 'A futuristic hack-and-slash game with a cyberpunk theme.', 4),
('Starfall Knights', 2020, 'E10+', 'A cooperative fantasy RPG with magical combat.', 4),
('Quantum Racer', 2018, 'E', 'A fast-paced racing game in a sci-fi universe.', 5),
('Pixel Pioneers', 2022, 'E', 'A sandbox building game with retro-style graphics.', 2),
('Neon Battle Arena', 2021, 'T', 'A neon-themed multiplayer battle game with different modes.', 5);

-- Inserting additional sample data into Genre table
INSERT INTO Genre (genre_name)
VALUES 
('Space Exploration'),
('Platformer'),
('Racing'),
('Strategy'),
('MMORPG'),
('Hack and Slash'),
('Fantasy RPG'),
('Sandbox'),
('Battle Arena');

-- Inserting additional sample data into Game_Genre table
INSERT INTO Game_Genre (game_id, genre_id)
VALUES 
(1, 1), -- Astral Odyssey is a Space Exploration game
(2, 2), -- Retro Rampage is a Platformer
(3, 3), -- Neon Drift is a Racing game
(4, 4), -- Temporal Tactics is a Strategy game
(5, 5), -- Mystic Realms is an MMORPG
(6, 6), -- Cyber Clash is a Hack and Slash game
(7, 7), -- Starfall Knights is a Fantasy RPG
(8, 3), -- Quantum Racer is also a Racing game
(9, 8), -- Pixel Pioneers is a Sandbox game
(10, 9); -- Neon Battle Arena is a Battle Arena game

-- Inserting additional sample data into Player table
INSERT INTO Player (player_name, email)
VALUES 
('Luna Skye', 'luna.skye@example.com'),
('Max Power', 'max.power@example.com'),
('Zara Shadow', 'zara.shadow@example.com'),
('Echo Blaze', 'echo.blaze@example.com'),
('Kai Vortex', 'kai.vortex@example.com'),
('Aurora Flux', 'aurora.flux@example.com'),
('Jax Pulse', 'jax.pulse@example.com'),
('Nova Ember', 'nova.ember@example.com'),
('Rex Voltage', 'rex.voltage@example.com'),
('Skyler Storm', 'skyler.storm@example.com');

-- Inserting additional sample data into Review table
INSERT INTO Review (rating, comments, game_id, player_id)
VALUES 
(5, 'An out-of-this-world experience!', 1, 1),
(4, 'Great retro vibes, but challenging levels!', 2, 2),
(5, 'Super fun and addictive racing game!', 3, 3),
(3, 'Interesting concept but needs more balancing.', 4, 4),
(4, 'An MMORPG with limitless potential!', 5, 5),
(5, 'Action-packed with amazing graphics!', 6, 6),
(4, 'Enjoyable fantasy adventure with friends.', 7, 7),
(3, 'Needs more variety in the tracks.', 8, 8),
(5, 'The sandbox mode offers endless creativity!', 9, 9),
(4, 'Intense battles and great neon visuals!', 10, 10),
(2, 'Too repetitive and needs more content updates.', 6, 4),
(5, 'My favorite game this year!', 7, 1),
(3, 'Controls are difficult to master.', 8, 2),
(4, 'A fun experience with great multiplayer modes.', 10, 3),
(2, 'Too many bugs and glitches.', 4, 5);

-- Inserting additional sample data into Submits table
INSERT INTO Submits (player_id, review_id, timestamp)
VALUES 
(1, 1, '2024-09-01 12:30:00'),
(2, 2, '2024-09-02 15:45:00'),
(3, 3, '2024-09-03 18:20:00'),
(4, 4, '2024-09-04 20:10:00'),
(5, 5, '2024-09-05 22:50:00'),
(6, 6, '2024-09-06 11:30:00'),
(7, 7, '2024-09-07 14:40:00'),
(8, 8, '2024-09-08 17:50:00'),
(9, 9, '2024-09-09 10:20:00'),
(10, 10, '2024-09-10 19:30:00'),
(4, 11, '2024-09-11 14:00:00'),
(1, 12, '2024-09-12 15:10:00'),
(2, 13, '2024-09-13 16:20:00'),
(3, 14, '2024-09-14 17:30:00'),
(5, 15, '2024-09-15 18:40:00');

-- Verification statements to check the data inserted
SELECT * FROM Studio;
SELECT * FROM Video_Game;
SELECT * FROM Genre;
SELECT * FROM Game_Genre;
SELECT * FROM Player;
SELECT * FROM Review;
SELECT * FROM Submits;
