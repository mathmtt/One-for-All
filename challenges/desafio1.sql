DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.subscription_plans (
  plan_id INT PRIMARY KEY,
  plan_title VARCHAR(255) NOT NULL,
  cost DECIMAL(10, 2)
);

INSERT INTO SpotifyClone.subscription_plans (plan_id, plan_title, cost)
VALUES
  (1, 'free plan', 0.00),
  (2, 'family plan', 7.99),
  (3, 'university plan', 5.99),
  (4, 'personal plan', 6.99);

CREATE TABLE SpotifyClone.members (
  member_id INT PRIMARY KEY,
  member_name VARCHAR(255) NOT NULL,
  age INT,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES subscription_plans(plan_id)
);

INSERT INTO SpotifyClone.members (member_id, member_name, age, plan_id)
VALUES
  (1, 'Barbara Liskov', 82, 1),
  (2, 'Robert Cecil Martin', 58, 1),
  (3, 'Ada Lovelace', 37, 2),
  (4, 'Martin Fowler', 46, 2),
  (5, 'Sandi Metz', 58, 2),
  (6, 'Paulo Freire', 19, 3),
  (7, 'Bell Hooks', 26, 3),
  (8, 'Christopher Alexander', 85, 4),
  (9, 'Judith Butler', 45, 4),
  (10, 'Jorge Amado', 58, 4);

CREATE TABLE SpotifyClone.performers(
  performer_id INT PRIMARY KEY,
  performer_name VARCHAR(255)
);

INSERT INTO SpotifyClone.performers (performer_id, performer_name)
VALUES
  (1, 'Beyoncé'),
  (2, 'Queen'),
  (3, 'Elis Regina'),
  (4, 'Baco Exu do Blues'),
  (5, 'Blind Guardian'),
  (6, 'Nina Simone');

CREATE TABLE SpotifyClone.recordings(
  recording_id INT PRIMARY KEY,
  recording_title VARCHAR(255),
  performer_id INT,
  year_released INT,
  FOREIGN KEY (performer_id) REFERENCES performers(performer_id)
);

INSERT INTO SpotifyClone.recordings (recording_id, recording_title, performer_id, year_released)
VALUES
  (1, 'Renaissance', 1, 2022),
  (2, 'Jazz', 2, 1978),
  (3, 'Hot Space', 2, 1982),
  (4, 'Falso Brilhante', 3, 1998),
  (5, 'Vento de Maio', 3, 2001),
  (6, 'QVVJFA?', 4, 2003),
  (7, 'Somewhere Far Beyond', 5, 2007),
  (8, 'I Put A Spell On You', 6, 2012);

CREATE TABLE SpotifyClone.tracks(
  track_id INT PRIMARY KEY,
  track_title VARCHAR(255) NOT NULL,
  recording_id INT,
  duration_in_seconds INT,
  FOREIGN KEY (recording_id) REFERENCES recordings(recording_id)
);

INSERT INTO SpotifyClone.tracks (track_id, track_title, recording_id, duration_in_seconds)
VALUES
  (1, 'BREAK MY', 1, 279),
  (2, 'VIRGO''S GROOVE', 1, 369),
  (3, 'ALIEN SUPERSTAR', 1, 116),
  (4, 'Don''t Stop Me Now', 2, 203),
  (5, 'Under Pressure', 3, 152),
  (6, 'Como Nossos Pais', 4, 105),
  (7, 'O Medo de Amar é o Medo de Ser Livre', 5, 207),
  (8, 'Samba em Paris', 6, 267),
  (9, 'The Bard''s Song', 7, 244),
  (10, 'Feeling Good', 8, 100);

CREATE TABLE SpotifyClone.play_history(
  history_entry_id INT PRIMARY KEY,
  member_id INT,
  track_id INT,
  play_date DATETIME,
  FOREIGN KEY (member_id) REFERENCES members(member_id),
  FOREIGN KEY (track_id) REFERENCES tracks(track_id)
);

INSERT INTO SpotifyClone.play_history (history_entry_id, member_id, track_id, play_date)
VALUES
  (1, 1, 8, '2022-02-28 10:45:55'),
  (2, 1, 2, '2020-05-02 05:30:35'),
  (3, 1, 10, '2020-03-06 11:22:33'),
  (4, 2, 10, '2022-08-05 08:05:17'),
  (5, 2, 7, '2020-01-02 07:40:33'),
  (6, 3, 10, '2020-11-13 16:55:13'),
  (7, 3, 2, '2020-12-05 18:38:30'),
  (8, 4, 8, '2021-08-15 17:10:10'),
  (9, 5, 8, '2022-01-09 01:44:33'),
  (10, 5, 5, '2020-08-06 15:23:43'),
  (11, 6, 7, '2017-01-24 00:31:17'),
  (12, 6, 1, '2017-10-12 12:35:20'),
  (13, 7, 4, '2011-12-15 22:30:49'),
  (14, 8, 4, '2012-03-17 14:56:41'),
  (15, 9, 9, '2022-02-24 21:14:22'),
  (16, 10, 3, '2015-12-13 08:30:22');

CREATE TABLE SpotifyClone.fan_follows(
  member_id INT,
  performer_id INT,
  PRIMARY KEY (member_id, performer_id),
  FOREIGN KEY (member_id) REFERENCES members(member_id),
  FOREIGN KEY (performer_id) REFERENCES performers(performer_id)
);

INSERT INTO SpotifyClone.fan_follows (member_id, performer_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);
