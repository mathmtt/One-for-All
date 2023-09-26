SELECT 
    r.recording_title AS album,
    COUNT(f.track_id) AS favoritadas
FROM 
    SpotifyClone.favSongs f
JOIN 
    SpotifyClone.tracks t ON f.track_id = t.track_id
JOIN 
    SpotifyClone.recordings r ON t.recording_id = r.recording_id
GROUP BY 
    r.recording_title
ORDER BY 
    favoritadas DESC, 
    r.recording_title ASC
LIMIT 3;
