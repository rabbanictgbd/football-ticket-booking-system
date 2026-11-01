CREATE TABLE Matches (
    match_id int primary key,
    fixture varchar(50) not null,
    tournament_category varchar(50) not null,
    base_ticket_price numeric(10,2) not null check (base_ticket_price >= 0),
    match_status varchar(50) not null CHECK (match_status IN (
            'Available',
            'Selling Fast',
            'Sold Out',
            'Postponed'
        ))
    
    -- Write your constraint to make 'match_id' the Primary Key
    -- Write your check constraint to prevent negative ticket prices
    -- Write your check constraint to restrict 'match_status' values
);