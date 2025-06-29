# Airbnb Database Schema (PostgreSQL)

This project defines a normalized PostgreSQL database schema for an Airbnb-like platform, supporting core features such as user roles, property listings, bookings, payments, reviews, and messaging.

The schema includes:

- **Users**: Guests, hosts, and admins with unique identities and roles.
- **Properties**: Listings created by hosts with details and pricing.
- **Bookings**: Reservations linking guests to properties over specific dates.
- **Payments**: Transactions tied to bookings with multiple payment methods.
- **Reviews**: Guest feedback on properties with ratings and comments.
- **Messages**: Direct communication between users.

The schema is fully normalized up to **Third Normal Form (3NF)** and optimized with appropriate foreign keys, constraints, and indexes for performance and data integrity.
