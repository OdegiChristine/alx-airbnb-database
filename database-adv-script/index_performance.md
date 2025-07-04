# Query Performance Analysis: Using EXPLAIN ANALYZE and Indexing

## What is EXPLAIN and ANALYZE?

PostgreSQL provides the `EXPLAIN` and `EXPLAIN ANALYZE` commands to help developers understand how queries are executed, and how they can be optimized.

- `EXPLAIN` shows the query execution plan — what PostgreSQL plans to do.

- `EXPLAIN ANALYZE` runs the query and shows the actual performance including execution time, rows processed, and whether indexes are being used.

## Example:

```
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 'd553e871-c1bb-49e0-8e6c-b0d3ab3cc573' AND status = 'confirmed'
```

## Why It Matters

Without indexes, PostgreSQL may perform a sequential scan, which checks every row, and is slow for large tables.
With proper indexing, it can do an index scan, which jumps directly to relevant rows, thus much faster.

## Performance Obersvation: Before vs After Indexing

**Before Indexing**
![Before indexing](/assets/Before_indexing.png)

- Higher execution time.

**After Indexing**
![After indexing](/assets/After_indexing.png)

- PostgreSQL uses the index.
- Fewer rows scanned, much lower cost.
- Faster execution time.
