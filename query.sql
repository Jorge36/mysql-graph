WITH RECURSIVE blue(id, camino) AS (
		SELECT id, CAST(id AS CHAR(200)) FROM nodes WHERE color = "yellow"
		UNION ALL
		SELECT e.node_to, concat(b.camino, ',', e.node_to)
		FROM blue b INNER JOIN edges e
		  ON e.node_from = b.id
		WHERE find_in_set(e.node_to, b.camino)=0
)
SELECT SUBSTRING(b.camino, 1, 1) yellow, b.id blue FROM blue b INNER JOIN nodes n
ON b.id = n.id 
WHERE n.color = "blue" 
GROUP BY yellow, blue
ORDER BY yellow, blue;

-- Or

WITH RECURSIVE blue(id, camino) AS (
		SELECT id, CAST(id AS CHAR(200)) FROM nodes WHERE color = "yellow"
		UNION ALL
		SELECT e.node_to, concat(b.camino, ',', e.node_to)
		FROM blue b INNER JOIN edges e
		  ON e.node_from = b.id
		WHERE find_in_set(e.node_to, b.camino)=0
)
SELECT SUBSTRING(b.camino, 1, 1) yellow, b.id blue, COUNT(SUBSTRING(b.camino, 1, 1)) paths FROM blue b INNER JOIN nodes n
ON b.id = n.id 
WHERE n.color = "blue" 
GROUP BY yellow, blue
ORDER BY yellow, blue;