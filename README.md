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
function test() {
  console.log("notice the blank line before this function?");
}
```

