# Football Ticket Booking System

A simple relational database project built with **PostgreSQL** to manage football matches, users, and ticket bookings. This project demonstrates database design, table relationships, constraints, and SQL queries using sample data.

## Project Overview

The Football Ticket Booking System stores information about users, football matches, and ticket bookings. It uses primary keys and foreign keys to maintain relationships and data integrity across the tables.

## Technologies Used

- PostgreSQL
- SQL
- Beekeeper Studio

## Database Schema

The database consists of three tables:

### 1. Users

Stores information about users of the system.

| Column         | Description                    |
| -------------- | ------------------------------ |
| `user_id`      | Primary key                    |
| `full_name`    | User's full name               |
| `email`        | Unique email address           |
| `role`         | Ticket Manager or Football Fan |
| `phone_number` | User's phone number            |

### 2. Matches

Stores information about football matches.

| Column                | Description                  |
| --------------------- | ---------------------------- |
| `match_id`            | Primary key                  |
| `fixture`             | Names of the competing teams |
| `tournament_category` | Tournament or league name    |
| `base_ticket_price`   | Base ticket price            |
| `match_status`        | Current match ticket status  |

### 3. Bookings

Stores ticket booking information and connects users with matches.

| Column           | Description                       |
| ---------------- | --------------------------------- |
| `booking_id`     | Primary key                       |
| `user_id`        | Foreign key referencing `Users`   |
| `match_id`       | Foreign key referencing `Matches` |
| `seat_number`    | Assigned seat number              |
| `payment_status` | Payment status                    |
| `total_cost`     | Total booking cost                |

## Entity Relationships

- One user can have multiple bookings.
- One match can have multiple bookings.
- Each booking references one user and one match.
- Foreign key constraints maintain referential integrity.

## SQL Queries Implemented

This project includes seven SQL queries:

1. Retrieve available Champions League matches.
2. Search for users by name using case-insensitive pattern matching with `ILIKE`.
3. Find bookings with missing payment status using `IS NULL` and `COALESCE`.
4. Retrieve booking details using `INNER JOIN`.
5. List all users, including those without bookings, using `LEFT JOIN`.
6. Find bookings whose total cost is greater than the average booking cost using a subquery.
7. Retrieve the two most expensive matches after skipping the most expensive match using `ORDER BY`, `OFFSET`, and `LIMIT`.

## Project Files

```text
football-ticket-booking-system/
├── schema.sql
├── insert_data.sql
├── QUERY.sql
├── README.md
└── ERD.png
```

- `schema.sql` — Creates the database tables and constraints.
- `insert_data.sql` — Inserts sample users, matches, and bookings.
- `QUERY.sql` — Contains the seven required SQL queries.
- `README.md` — Documents the project.
- `ERD.png` — Optional entity relationship diagram.

## How to Run the Project

1. Install PostgreSQL and open Beekeeper Studio.
2. Connect to your PostgreSQL server.
3. Create a database named `football_ticket_booking`.
4. Open and execute `schema.sql` to create the tables.
5. Execute `insert_data.sql` to insert the sample data.
6. Execute the queries in `QUERY.sql` individually to view their results.

**Note:** Run the schema script before inserting sample data. If the tables already exist and contain data, check before rerunning scripts that drop or recreate them.

## Key Concepts Demonstrated

- Database design and relational modeling
- Primary keys and foreign keys
- `NOT NULL`, `UNIQUE`, and `CHECK` constraints
- `SELECT`, `WHERE`, and `ORDER BY`
- `LIKE` and `ILIKE`
- `IS NULL` and `COALESCE`
- `INNER JOIN` and `LEFT JOIN`
- Aggregate functions such as `AVG()`
- Subqueries
- `LIMIT` and `OFFSET`


## Assignment Deliverables

- ER diagram link: https://drive.google.com/file/d/1h2HLyQGLVrJ91QtctzSXW5KvR9g_gbkS/view?usp=drive_link
- GitHub repository: https://github.com/rabbanictgbd/football-ticket-booking-system
- Video demonstration: https://drive.google.com/file/d/1XCAqMwjbdc7oep-FuEZg9gmg0rDyWRi6/view?usp=drive_link

## Author

**Abdul Kader Rabbani**

---

This project was created for SQL practice and demonstrates fundamental PostgreSQL database design and querying concepts.
