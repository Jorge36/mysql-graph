WITH RECURSIVE blue(id, paths) AS (
		SELECT id, CAST(id AS CHAR(200)) FROM nodes WHERE color = "yellow"
		UNION ALL
		SELECT e.node_to, concat(b.paths, ',', e.node_to)
		FROM blue b INNER JOIN edges e
		  ON e.node_from = b.id
		WHERE find_in_set(e.node_to, b.paths)=0
)
SELECT SUBSTRING(b.paths, 1, 1) yellow, b.id blue FROM blue b INNER JOIN nodes n
ON b.id = n.id 
WHERE n.color = "blue" 
GROUP BY yellow, blue
ORDER BY yellow, blue;

-- Or

WITH RECURSIVE blue(id, paths) AS (
		SELECT id, CAST(id AS CHAR(200)) FROM nodes WHERE color = "yellow"
		UNION ALL
		SELECT e.node_to, concat(b.paths, ',', e.node_to)
		FROM blue b INNER JOIN edges e
		  ON e.node_from = b.id
		WHERE find_in_set(e.node_to, b.paths)=0
)
SELECT SUBSTRING(b.paths, 1, 1) yellow, b.id blue, COUNT(SUBSTRING(b.paths, 1, 1)) "Number of paths" FROM blue b INNER JOIN nodes n
ON b.id = n.id 
WHERE n.color = "blue" 
GROUP BY yellow, blue
ORDER BY yellow, blue;
