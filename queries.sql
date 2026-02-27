-- sqlite3 -header -table railway.db < queries.sql

-- TODO:
-- 2. Given a passenger’s last name and first name and retrieve all trains they are booked on.
SELECT T.train_name
FROM TRAIN T
JOIN BOOKED B ON T.train_number = B.train_number
JOIN PASSENGER P ON B.passenger_ssn = P.ssn
WHERE P.first_name = 'James' AND P.last_name = 'Butt';

-- TODO:
-- 3. Given a day, list the passengers traveling on that day with confirmed tickets.
SELECT P.first_name, P.last_name
FROM PASSENGER P
JOIN BOOKED B ON P.ssn = B.passenger_ssn
JOIN TRAIN T ON B.train_number = T.train_number
JOIN TRAIN_STATUS TS ON T.train_name = TS.train_name
WHERE TS.train_date = 'Friday' AND B.status = 'Booked';

-- TODO:
-- 4. Display the train information (Train Number, Train Name, Source and Destination) and passenger information (Name, Address, Category, ticket status) of passengers who are between the ages of 50 to 60. 


-- TODO:
-- 5. List train name, day and number of passenger on that train.


-- TODO:
-- 6. Enter a train name and retrieve all the passengers with confirmed status traveling on that train.


-- TODO:
-- 7. List passengers that are waitlisted including the name of the train.


-- TODO:
-- 8. List passenger names in descending order that have '605' phone area code.


-- TODO:
-- 9. List name of passengers that are traveling on Thursdays in ascending order.

