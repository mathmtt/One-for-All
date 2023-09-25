SELECT
    ROUND(MIN(sp.cost), 2) AS faturamento_minimo,
    ROUND(MAX(sp.cost), 2) AS faturamento_maximo,
    ROUND(AVG(sp.cost), 2) AS faturamento_medio,
    ROUND(SUM(sp.cost), 2) AS faturamento_total
FROM
    SpotifyClone.members m
JOIN
    SpotifyClone.subscription_plans sp ON m.plan_id = sp.plan_id;
