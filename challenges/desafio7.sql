SELECT 
    p.performer_name AS artista,
    r.recording_title AS album,
    COUNT(f.member_id) AS pessoas_seguidoras
FROM 
    SpotifyClone.performers p
JOIN 
    SpotifyClone.recordings r ON p.performer_id = r.performer_id
LEFT JOIN 
    SpotifyClone.fan_follows f ON p.performer_id = f.performer_id
GROUP BY 
    p.performer_name, r.recording_title
ORDER BY 
    pessoas_seguidoras DESC, 
    p.performer_name ASC, 
    r.recording_title ASC;
