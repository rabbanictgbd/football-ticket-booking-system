-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.
-- Sample Output:

-- match_id	fixture	base_ticket_price
-- 101	Real Madrid vs Barcelona	150
-- 103	Bayern Munich vs PSG	130

-- select match_id, fixture, base_ticket_price
--   from matches
--   where match_status = 'Available' 
--   and tournament_category = 'Champions League';

-- select user_id, full_name, email
--   from users 
--   where full_name ILIKE 'Tanvir%'
--   or full_name ILIKE '%Haque%';

-- select booking_id, user_id, match_id, payment_status,
--   coalesce(payment_status, 'Action Required')
--   as systematic_status
--   from bookings 
--   where payment_status is null;

-- select bookings.booking_id, users.full_name, matches.fixture, bookings.total_cost
--   from bookings 
-- inner join users
-- on bookings.user_id = users.user_id
-- inner join matches
-- on bookings.match_id = matches.match_id;

-- select users.user_id, users.full_name, bookings.booking_id
-- from users
-- left join bookings
-- on users.user_id = bookings.user_id

-- select booking_id, match_id, total_cost 
-- from bookings
-- where total_cost > (select avg(total_cost) from bookings)

-- Query 7: Retrieve the top 2 most expensive matches sorted by base ticket price, skipping the absolute highest premium match.
-- Sample Output:

-- (Skips Real Madrid vs Barcelona at 150)

-- match_id	fixture	base_ticket_price
-- 103	Bayern Munich vs PSG	130
-- 102	Man City vs Liverpool	120

select *
from matches
  where base_ticket_price > (select avg(base_ticket_price)from matches)
  order by base_ticket_price desc;








