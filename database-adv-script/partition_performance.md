# Table Partitioning on bookings

## Goal:

Improve performance of queries on the large `bookings` table by partitioning it by `start_date`.

## Steps:

- Converted **bookings** into a partitioned table using range partitioning on **start_date**.

- Created partitions for:

-- `bookings_2023`
-- `bookings_2024`
-- `bookings_2025`

## Query Performance Test:

Example query:

```
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
```

## Observations:

- Before partitioning: Full table scan on bookings
- After partitioning: PostgreSQL scans only bookings_2024
- Result: ✅ Faster execution, especially as data grows

---

## Summary:

Partitioning improves performance for date-based queries by scanning only the relevant subset of data. It's most effective when:

- The table is large
- Queries filter by the partition key (e.g., start_date)
