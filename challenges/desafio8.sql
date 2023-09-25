SELECT 
    p.performer_name AS artista,
    r.recording_title AS album
FROM 
    SpotifyClone.performers p
JOIN 
    SpotifyClone.recordings r ON p.performer_id = r.performer_id
WHERE 
    p.performer_name = 'Elis Regina'
ORDER BY 
    r.recording_title ASC;
