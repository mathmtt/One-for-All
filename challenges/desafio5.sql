SELECT
    t.track_title AS cancao,
    COUNT(ph.track_id) AS reproducoes
FROM
    SpotifyClone.play_history ph
JOIN
    SpotifyClone.tracks t ON ph.track_id = t.track_id
GROUP BY
    t.track_title
ORDER BY
    reproducoes DESC,
    t.track_title ASC
LIMIT 2;
