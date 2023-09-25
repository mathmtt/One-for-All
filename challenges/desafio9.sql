SELECT 
    COUNT(ph.track_id) AS musicas_no_historico
FROM 
    SpotifyClone.members m
JOIN 
    SpotifyClone.play_history ph ON m.member_id = ph.member_id
WHERE 
    m.member_name = 'Barbara Liskov';
