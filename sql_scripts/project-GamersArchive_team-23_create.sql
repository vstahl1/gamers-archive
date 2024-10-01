-- Creating Studio Table
CREATE TABLE Studio (
    studio_id INT AUTO_INCREMENT PRIMARY KEY,
    studio_name VARCHAR(100) NOT NULL,
    street_num VARCHAR(10),
    street_name VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(10)
);

-- Creating Video_Game Table
CREATE TABLE Video_Game (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year YEAR,
    esrb VARCHAR(5),
    description TEXT,
    studio_id INT NOT NULL,
    FOREIGN KEY (studio_id) REFERENCES Studio(studio_id) ON DELETE CASCADE
);

-- Creating Genre Table
CREATE TABLE Genre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- Creating Game_Genre Table (Associative Entity for many-to-many relationship)
CREATE TABLE Game_Genre (
    game_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (game_id, genre_id),
    FOREIGN KEY (game_id) REFERENCES Video_Game(game_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id) ON DELETE CASCADE
);

-- Creating Player Table
CREATE TABLE Player (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Creating Review Table
CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments VARCHAR(500),
    game_id INT NOT NULL,
    player_id INT NOT NULL,
    FOREIGN KEY (game_id) REFERENCES Video_Game(game_id) ON DELETE CASCADE,
    FOREIGN KEY (player_id) REFERENCES Player(player_id) ON DELETE CASCADE
);

-- Creating Submits Table (Handles the relationship between Player and Review)
CREATE TABLE Submits (
    player_id INT NOT NULL,
    review_id INT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (player_id, review_id),
    FOREIGN KEY (player_id) REFERENCES Player(player_id) ON DELETE CASCADE,
    FOREIGN KEY (review_id) REFERENCES Review(review_id) ON DELETE CASCADE
);

-- Verification statements to check the tables created
SHOW TABLES;

-- Display the structure of each table
DESCRIBE Studio;
DESCRIBE Video_Game;
DESCRIBE Genre;
DESCRIBE Game_Genre;
DESCRIBE Player;
DESCRIBE Review;
DESCRIBE Submits;
