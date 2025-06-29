-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Clear existing data (respecting foreign key constraints)
TRUNCATE messages, reviews, payments, bookings, properties, users RESTART IDENTITY CASCADE;

-- Insert Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  (uuid_generate_v4(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_alice', '0712345678', 'host'),
  (uuid_generate_v4(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_bob', NULL, 'guest'),
  (uuid_generate_v4(), 'Carol', 'Otieno', 'carol@example.com', 'hashed_pw_carol', '0723456789', 'guest'),
  (uuid_generate_v4(), 'Admin', 'User', 'admin@example.com', 'hashed_pw_admin', NULL, 'admin');

-- Insert Properties (owned by Alice)
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES 
  (
    '11111111-1111-1111-1111-111111111111',
    (SELECT user_id FROM users WHERE email = 'alice@example.com'),
    'Seaside Cottage',
    'A cozy cottage with ocean view.',
    'Diani Beach, Kenya',
    100.00
  ),
  (
    '22222222-2222-2222-2222-222222222222',
    (SELECT user_id FROM users WHERE email = 'alice@example.com'),
    'Nairobi Loft',
    'Stylish apartment in the heart of the city.',
    'Nairobi, Kenya',
    80.00
  );

-- Insert Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (
    '33333333-3333-3333-3333-333333333333',
    '11111111-1111-1111-1111-111111111111',
    (SELECT user_id FROM users WHERE email = 'bob@example.com'),
    '2025-07-01', '2025-07-04',
    300.00, 'confirmed'
  ),
  (
    '44444444-4444-4444-4444-444444444444',
    '22222222-2222-2222-2222-222222222222',
    (SELECT user_id FROM users WHERE email = 'carol@example.com'),
    '2025-08-10', '2025-08-12',
    160.00, 'pending'
  );

-- Insert Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES 
  (
    '55555555-5555-5555-5555-555555555555',
    '33333333-3333-3333-3333-333333333333',
    300.00,
    'credit_card'
  );

-- Insert Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES 
  (
    '66666666-6666-6666-6666-666666666666',
    '11111111-1111-1111-1111-111111111111',
    (SELECT user_id FROM users WHERE email = 'bob@example.com'),
    5,
    'Amazing location! Very peaceful and clean.'
  ),
  (
    '77777777-7777-7777-7777-777777777777',
    '22222222-2222-2222-2222-222222222222',
    (SELECT user_id FROM users WHERE email = 'carol@example.com'),
    4,
    'Nice place with great access to amenities.'
  );

-- Insert Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES 
  (
    '88888888-8888-8888-8888-888888888888',
    (SELECT user_id FROM users WHERE email = 'carol@example.com'),
    (SELECT user_id FROM users WHERE email = 'alice@example.com'),
    'Hi Alice, is early check-in available for the Nairobi Loft?'
  ),
  (
    '99999999-9999-9999-9999-999999999999',
    (SELECT user_id FROM users WHERE email = 'alice@example.com'),
    (SELECT user_id FROM users WHERE email = 'carol@example.com'),
    'Hi Carol, yes — you can check in anytime after 10am.'
  );
