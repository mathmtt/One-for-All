SELECT 
    (SELECT COUNT(*) FROM MusicApp.tracks) AS cancoes,
    (SELECT COUNT(*) FROM MusicApp.performers) AS artistas,
    (SELECT COUNT(*) FROM MusicApp.recordings) AS albuns;
