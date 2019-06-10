<strong>Common Table Expressions</strong>

A common table expression (CTE) is a named temporary result set that exists within the scope of a single statement and that can be referred to later within that statement, possibly multiple times. 

<strong>Recursive Common Table Expressions</strong>
A recursive common table expression is one having a subquery that refers to its own name

[More information about this...](https://dev.mysql.com/doc/refman/8.0/en/with.html)

<strong>Example of CTE Recursive</strong>

We have the following directed cyclic graph and we want to represent it in Mysql. We create 2 tables (nodes and edges). We can see the structure in graphblue.sql. 

![alt text](/graph.png)

Now we want to know the blue nodes that we can get from a yellow node. For example, node 1: 3, 9, 11 and node 2: 9, 11, 12, 13.

To do this we can get the <i>Depth-first ordering</i> which means we want to see children nodes grouped immediately under their parent. For that we build a “path” column and sort by it:

```
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
```

