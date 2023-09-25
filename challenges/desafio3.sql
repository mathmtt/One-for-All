SELECT 
    m.member_name AS pessoa_usuaria,
    CASE 
        WHEN MAX(ph.play_date) >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM 
    SpotifyClone.members m
LEFT JOIN 
    SpotifyClone.play_history ph ON m.member_id = ph.member_id
GROUP BY 
    m.member_name
ORDER BY 
    m.member_name;
