-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.
-- Sample Output:

-- match_id	fixture	base_ticket_price
-- 101	Real Madrid vs Barcelona	150
-- 103	Bayern Munich vs PSG	130

select match_id, fixture, base_ticket_price
  from matches
  where match_status = 'Available' 
  and tournament_category = 'Champions League';


-- Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).
-- Concepts used: LIKE, ILIKE
-- Sample Output:

-- user_id	full_name	email
-- 1	Tanvir Rahman	tanvir@mail.com
-- 2	Asif Haque	asif@mail.com

select user_id, full_name, email
  from users 
  where full_name ILIKE 'Tanvir%'
  or full_name ILIKE '%Haque%';


--   Query 3: Retrieve all booking records where the payment status is missing (NULL), replacing the empty result with 'Action Required'.
-- Concepts used: IS NULL, COALESCE
-- Sample Output:

-- booking_id	user_id	match_id	systematic_status
-- 504	2	101	Action Required

select booking_id, user_id, match_id,
  coalesce(payment_status, 'Action Required')
  as systematic_status
  from bookings 
  where payment_status is null;


--   uery 4: Retrieve match booking details along with the User's full name and the scheduled Match fixture teams.
-- Concepts used: INNER JOIN
-- Sample Output:

-- booking_id	full_name	fixture	total_cost
-- 501	Tanvir Rahman	Real Madrid vs Barcelona	150
-- 502	Tanvir Rahman	Man City vs Liverpool	120
-- 503	Asif Haque	Real Madrid vs Barcelona	150
-- 504	Asif Haque	Real Madrid vs Barcelona	150
-- 505	Sajjad Rahman	Man City vs Liverpool	120

select bookings.booking_id, users.full_name, matches.fixture, bookings.total_cost
  from bookings 
inner join users
on bookings.user_id = users.user_id
inner join matches
on bookings.match_id = matches.match_id;


-- Query 5: Display a comprehensive list of all users and their booking IDs, ensuring that fans who have never bought a ticket are still listed.
-- Concepts used: LEFT JOIN / Full JOIN
-- Sample Output:

-- user_id	full_name	booking_id
-- 1	Tanvir Rahman	501
-- 1	Tanvir Rahman	502
-- 2	Asif Haque	503
-- 2	Asif Haque	504
-- 3	Sajjad Rahman	505
-- 4	Jannat Ara	NULL

select users.user_id, users.full_name, bookings.booking_id
from users
left join bookings
on users.user_id = bookings.user_id;


-- Query 6: Find all ticket bookings where the total cost is strictly higher than the average cost of all ticket bookings.
-- Sample Output:

-- booking_id	match_id	total_cost
-- 501	101	150
-- 503	101	150
-- 504	101	150

select booking_id, match_id, total_cost 
from bookings
where total_cost > (select avg(total_cost) from bookings);

-- Query 7: Retrieve the top 2 most expensive matches sorted by base ticket price, skipping the absolute highest premium match.
-- Sample Output:

-- (Skips Real Madrid vs Barcelona at 150)

-- match_id	fixture	base_ticket_price
-- 103	Bayern Munich vs PSG	130
-- 102	Man City vs Liverpool	120

select match_id, fixture, base_ticket_price
from matches
  order by base_ticket_price desc
  limit 2 offset 1;






