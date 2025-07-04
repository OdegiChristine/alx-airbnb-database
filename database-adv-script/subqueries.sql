-- Non-correalated subquery: Runs independently of the outer query
SELECT *
FROM properties
WHERE property_id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Correlated Subquery: Uses a value from the outer query. It runs once for each row in the outer query
SELECT u.user_id, u.first_name, u.last_name
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;
