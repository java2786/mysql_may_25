
# Null-Handling Expressions

In MySQL, IFNULL, COALESCE, and similar functions are null-handling expressions used to deal with NULL values. Here’s a clear breakdown of each, along with other related constructs:

### IFNULL(expression, alt_value)
* **Purpose**: Returns alt_value if expression is NULL, otherwise returns expression.
* **Use case**: Simplest way to replace NULL with a default value.

#### Example
```sql
SELECT IFNULL(NULL, 'N/A');  -- Returns 'N/A'
SELECT IFNULL('OpenAI', 'N/A');  -- Returns 'OpenAI'
```

### COALESCE(expr1, expr2, ..., exprN)
* **Purpose**: Returns the first non-NULL value from the list of expressions.
* **Use case**: Useful when you want to check multiple fields and use the first one that’s not null.

#### Example:
```sql
SELECT COALESCE(NULL, NULL, 'Python', 'Java');  -- Returns 'Python'
```
More flexible than IFNULL, which only accepts 2 arguments.


### NULLIF(expr1, expr2)
* **Purpose**: Returns NULL if expr1 = expr2, otherwise returns expr1.
* **Use case**: Handy for avoiding divide-by-zero errors or ignoring certain values.

#### Example:
```sql
SELECT NULLIF(10, 10);  -- Returns NULL
SELECT NULLIF(10, 5);   -- Returns 10
```

### CASE Statement (for conditional logic)
* **Purpose**: SQL equivalent of if...else if...else.

#### Example:
```sql
SELECT
  CASE
    WHEN marks >= 90 THEN 'A'
    WHEN marks >= 75 THEN 'B'
    ELSE 'C'
  END AS grade
FROM students;
```


## Summary Table
| Function     | Description                                 | # of Args | Example                               |
| ------------ | ------------------------------------------- | --------- | ------------------------------------- |
| `IFNULL()`   | Replaces `NULL` with specified value        | 2         | `IFNULL(score, 0)`                    |
| `COALESCE()` | Returns first non-NULL from a list          | 2+        | `COALESCE(col1, col2, 'default')`     |
| `NULLIF()`   | Returns `NULL` if two expressions are equal | 2         | `NULLIF(salary, 0)`                   |
| `CASE`       | Multi-conditional branching logic           | N/A       | `CASE WHEN ... THEN ... ELSE ... END` |
