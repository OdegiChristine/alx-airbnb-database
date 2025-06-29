# Seed Script

The seed.sql file contains a complete set of SQL INSERT statements to populate the database with realistic sample data for development and testing.

It includes:

- ✅ Four users (host, guests, and admin)
- ✅ Two properties listed by the host
- ✅ Two bookings by guests (one confirmed, one pending)
- ✅ One payment linked to a confirmed booking
- ✅ Two reviews written by guests
- ✅ Two messages exchanged between a guest and a host

The script also:

- Uses uuid_generate_v4() to generate unique UUIDs
- Maintains referential integrity via subqueries for foreign keys
- Resets and truncates all tables for clean and repeatable seeding

To initialize the environment with meaningful data for demos, development or testing, run:

```
psql -U your_username -d your_database -f seed.sql
```

Enable uuid-ossp extension before running the script
