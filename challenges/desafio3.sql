SELECT 
    m.member_name AS pessoa_usuaria,
    COUNT(ph.track_id) AS musicas_ouvidas,
    ROUND(SUM(t.duration_in_seconds) / 60, 2) AS total_minutos
FROM 
    SpotifyClone.members m
LEFT JOIN 
    SpotifyClone.play_history ph ON m.member_id = ph.member_id
LEFT JOIN 
    SpotifyClone.tracks t ON ph.track_id = t.track_id
GROUP BY 
    m.member_name
ORDER BY 
    m.member_name;
