-- Inner Join--Only returns bookings that are linked to existing users
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM
    bookings b
INNER JOIN
    users u ON b.user_id = u.user_id;

-- Left Join - get all properties and their reviews(if any). propertiers with no reviews will still appear
SELECT
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at
FROM
    properties p
LEFT JOIN
    reviews r ON p.property_id = r.property_id;

-- Full outer join: Get a complete view of all users and all bookings
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM
    users u
FULL OUTER JOIN
    bookings b ON u.user_id = b.user_id