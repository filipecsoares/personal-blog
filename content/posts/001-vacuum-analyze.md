+++
title = 'Vacuum Analyze in PostgreSQL: An Essential Tool for Performance Optimization'
date = 2024-09-25T16:39:51-03:00
description = 'Learn why PostgreSQL VACUUM ANALYZE exists, what problems it solves, how to use it, and practical best practices.'
summary = 'Why VACUUM ANALYZE exists, what problems it solves, how to use it, and practical best practices.'
tags = ['postgresql', 'database']
autonumber = true
draft = false
+++

`VACUUM ANALYZE` combines two PostgreSQL maintenance commands (`VACUUM` and `ANALYZE`) into one. It is the quickest way to keep table storage clean and query plans fast after heavy writes.

## Why It Exists

PostgreSQL uses **MVCC (Multi-Version Concurrency Control)** so readers and writers do not block each other. Because of MVCC, an `UPDATE` or `DELETE` does not immediately erase the old row from disk—it marks the old version as dead and writes a new version.

Over time, two things drift:

1. Dead row versions (**dead tuples**) accumulate on disk.
2. Column data distribution changes, making the query planner's statistics outdated.

PostgreSQL created `VACUUM` to reclaim space from dead tuples and `ANALYZE` to refresh planner statistics.

## The Problem It Solves

Without regular `VACUUM ANALYZE`:

- **Table bloat & slower scans:** Queries must read through pages full of dead tuples, increasing I/O and disk usage.
- **Bad query plans:** With stale statistics, the planner can pick a sequential scan instead of an index scan (or vice versa), causing sudden query slowdowns.
- **Transaction ID wraparound risk:** `VACUUM` freezes old transaction IDs so PostgreSQL does not hit wraparound limits.

## How It Is Used

Basic syntax:

```sql
VACUUM ANALYZE [table_name];
```

- **Specific table:** runs on one table (most common after a batch job).
- **No table name:** runs across all tables you have permission to vacuum in the current database.
- **Verbose output:** add `VERBOSE` to see how many dead tuples were removed and pages scanned.

```sql
VACUUM (VERBOSE, ANALYZE) orders;
```

**Permissions:** You must be a superuser, the table owner, or (in PostgreSQL 16+) a member of `pg_maintain`.

## Practical Examples

### 1. Check if a table needs vacuuming

Inspect dead tuples and the last vacuum/analyze timestamps in `pg_stat_user_tables`:

```sql
SELECT
  relname AS table_name,
  n_live_tup AS live_rows,
  n_dead_tup AS dead_rows,
  last_vacuum,
  last_autovacuum,
  last_analyze,
  last_autoanalyze
FROM pg_stat_user_tables
ORDER BY n_dead_tup DESC;
```

### 2. Clean up after a large delete or bulk import

After deleting millions of old rows or loading a bulk CSV, run `VACUUM ANALYZE` on that table immediately so the planner sees the new data shape:

```sql
DELETE FROM audit_logs WHERE created_at < NOW() - INTERVAL '90 days';

VACUUM (VERBOSE, ANALYZE) audit_logs;
```

### 3. Run across the whole database

```sql
VACUUM ANALYZE;
```

## Best Practices

- **Let `autovacuum` handle daily traffic:** PostgreSQL runs `autovacuum` automatically in the background. Keep it enabled and tune thresholds per large table if needed.
- **Run manually after bulk operations:** Trigger `VACUUM ANALYZE` right after large `INSERT`, `UPDATE`, `DELETE`, or `COPY` jobs instead of waiting for `autovacuum`.
- **Avoid `VACUUM FULL` in production:** Standard `VACUUM` does not block reads or normal writes. `VACUUM FULL` rewrites the whole table and takes an `ACCESS EXCLUSIVE` lock, blocking all traffic.
- **Monitor dead tuples:** Track `n_dead_tup` in `pg_stat_user_tables` to spot tables where `autovacuum` is falling behind.

## References

- [PostgreSQL Documentation — VACUUM](https://www.postgresql.org/docs/current/sql-vacuum.html)
- [PostgreSQL Documentation — ANALYZE](https://www.postgresql.org/docs/current/sql-analyze.html)
- [PostgreSQL Documentation — Routine Vacuuming](https://www.postgresql.org/docs/current/routine-vacuuming.html)
