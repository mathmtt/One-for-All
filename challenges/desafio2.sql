SELECT 
    (SELECT COUNT(*) FROM SpotifyClone.tracks) AS cancoes,
    (SELECT COUNT(*) FROM SpotifyClone.performers) AS artistas,
    (SELECT COUNT(*) FROM SpotifyClone.recordings) AS albuns;
