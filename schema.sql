-- 1. Plataformas
CREATE TABLE Platforms (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE
);

-- 2. Géneros
CREATE TABLE Genres (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE
);

-- 3. Moods (estados de ánimo)
CREATE TABLE Moods (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE
);

-- 4. Juegos
CREATE TABLE Games (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  platform_id INT NOT NULL,
  genre_id INT NOT NULL,
  mood_id INT NOT NULL,
  release_date DATE,
  FOREIGN KEY (platform_id) REFERENCES Platforms(id),
  FOREIGN KEY (genre_id)    REFERENCES Genres(id),
  FOREIGN KEY (mood_id)     REFERENCES Moods(id),
  INDEX (title)
);

-- 5. Trivia (datos curiosos)
CREATE TABLE Trivia (
  id INT AUTO_INCREMENT PRIMARY KEY,
  game_id INT NOT NULL,
  trivia_text TEXT NOT NULL,
  FOREIGN KEY (game_id) REFERENCES Games(id)
);

-- 6. Scores (para comparaciones)
CREATE TABLE Scores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  game_id INT NOT NULL,
  source VARCHAR(30),
  value DECIMAL(5,2),
  FOREIGN KEY (game_id) REFERENCES Games(id)
);
