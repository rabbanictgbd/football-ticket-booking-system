-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.
-- Sample Output:

-- match_id	fixture	base_ticket_price
-- 101	Real Madrid vs Barcelona	150
-- 103	Bayern Munich vs PSG	130

select match_id, fixture, base_ticket_price
  from matches
  where match_status = 'Available' 
  and tournament_category = 'Champions League';

  