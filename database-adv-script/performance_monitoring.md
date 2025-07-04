# Continuous Performance Monitoring

To maintain optimal performance, we routinely analyze frequently executed queries using PostgreSQL's **EXPLAIN ANALYZE** command. This helps us detect slow operations like sequential scans, expensive joins, or row over-fetching.

## Example:

```
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 'some-uuid' AND status = 'confirmed';
```

## Bottlenecks Identified:

- Sequential scans on large tables (e.g., `bookings`, `properties`)
- High cost nested loop joins on unindexed foreign keys
- Full scans on `status` and `start_date` in filters

## Changes Implemented:

- Added indexes on `bookings(user_id, status)` and `bookings(start_date)`
- Partitioned the `bookings` table by `start_date`
- Replaced `LEFT JOIN` with `INNER JOIN` where relationships are required

## Observed Improvements:

- Query execution times reduced by over 70% for date-based filters
- Index scans replaced full table scans in most cases
- Reduced memory and CPU usage for analytical queries
