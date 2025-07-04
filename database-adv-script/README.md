# Directory Overview

This directory contains a series of structured SQL files that demonstrate schema design, performance tuning, and advanced query techniques for an Airbnb-style relational database. Each file targets a specific database engineering concept and includes both implementation and optimization steps.

## Files and Descriptions

| File Name                | Description                                                                                                       |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------- |
| `schema.sql`             | Defines the normalized database schema with tables, constraints, and keys.                                        |
| `seed.sql`               | Populates the database with realistic sample data for testing and demos.                                          |
| `indexes.sql`            | Creates indexes on high-usage columns to improve query performance.                                               |
| `performance.sql`        | Contains an initial complex query and its optimized version using indexing and join improvements.                 |
| `optimization_report.md` | A report analyzing the performance improvements made to a complex query.                                          |
| `partitioning.sql`       | Implements table partitioning on the `bookings` table by `start_date` to improve performance on large datasets.   |
| `monitoring_report.md`   | Documents the use of `EXPLAIN ANALYZE` for monitoring and outlines adjustments based on observed bottlenecks.     |
| `joins.sql`              | Demonstrates the use of different types of SQL joins (INNER, LEFT, FULL OUTER).                                   |
| `subqueries.sql`         | Contains both correlated and non-correlated subqueries for analyzing user and property activity.                  |
| `analytics.sql`          | Uses aggregation and window functions for advanced analytics, like ranking properties and counting user bookings. |

## Tools Used

- PostgreSQL (SQL dialect)
- `EXPLAIN ANALYZE` for query plan inspection
- Partitioning, indexing, normalization, and window functions for performance
