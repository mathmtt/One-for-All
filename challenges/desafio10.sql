CREATE TABLE SpotifyClone.favSongs (
    member_id INT,
    track_id INT,
    CONSTRAINT PRIMARY KEY (member_id , track_id),
    FOREIGN KEY (member_id)
    REFERENCES members (member_id),
    FOREIGN KEY (track_id)
    REFERENCES tracks (track_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.favSongs (member_id, track_id)
VALUES
  (1, 3),
  (1, 6),
  (1, 10),
  (2, 4),
  (3, 1),
  (3, 3),
  (4, 7),
  (4, 4),
  (5, 10),
  (5, 2),
  (8, 4),
  (9, 7),
  (10, 3);
