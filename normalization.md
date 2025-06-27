# Airbnb Database Normalization

## 1. User Table

- 1NF: All fields are atomic.
- 2NF: Only one-column PK (user_id), all attributes depend fully on it.
- 3NF: No transitive dependencies (e.g., role is not dependent on email or name).

- **Conclusion**: Already in 3NF

## 2. Property Table

- All values are atomic.
- Every non-key field is dependent only on property_id.
- host_id is a foreign key to User.

- **Conclusion**: No violation, table already in 3NF.

## 3. Booking Table

- No repeating groups.
- No partial dependencies.
- total_price may be considered derived (from pricepernight × nights), but we assume it is stored for historical integrity.

- **Conclusion**: Already in 3NF.

## 4. Payment Table

- Atomic
- All fields depend solely on payment_id.

- **Conclusion**: Already in 3NF.

## 5. Review Table

- All fields are atomic.
- No partial or transitive dependecies.

- **Conclusion**: Already in 3NF.

## 6. Message Table

- All fields are atomic and dependent on the primary key.

- **Conclusion**: 3NF Compliant.
