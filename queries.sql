-- qlite3 -header -table railway.db < queries.sql

-- 2. Given a passenger's last name and first name and retrieve all trains they are booked on.
SELECT P.first_name, P.last_name, T.train_name
FROM PASSENGER P
JOIN BOOKED B ON P.ssn = B.passenger_ssn
JOIN TRAIN T ON B.train_number = T.train_number
WHERE P.first_name = 'David' AND P.last_name = 'Willson';

-- 3. Given a day, list the passengers traveling on that day with confirmed tickets.
SELECT TS.train_date, P.first_name, P.last_name
FROM PASSENGER P
JOIN BOOKED B ON P.ssn = B.passenger_ssn
JOIN TRAIN T ON B.train_number = T.train_number
JOIN TRAIN_STATUS TS ON T.train_name = TS.train_name
WHERE TS.train_date = 'Sunday' AND B.status = 'Booked';

-- 4. Display train and passenger information for passengers between ages 50 to 60.
SELECT
  T.train_number,
  T.train_name,
  T.source_station,
  T.destination_station,
  P.first_name,
  P.last_name,
  P.address,
  B.ticket_type,
  B.status
FROM PASSENGER P
JOIN BOOKED B ON P.ssn = B.passenger_ssn
JOIN TRAIN T ON B.train_number = T.train_number
WHERE (strftime('%Y', 'now') - strftime('%Y', P.bdate)) BETWEEN 50 AND 60;

-- 5. List train name, day and number of passengers on that train.
SELECT
  T.train_name,
  TS.train_date,
  TS.premium_seats_occupied + TS.gen_seats_occupied AS total_passengers
FROM TRAIN T
JOIN TRAIN_STATUS TS ON T.train_name = TS.train_name;

-- 6. Enter a train name and retrieve all passengers with confirmed status traveling on that train.
SELECT T.train_name, P.first_name, P.last_name
FROM TRAIN T
JOIN BOOKED B ON T.train_number = B.train_number
JOIN PASSENGER P ON B.passenger_ssn = P.ssn
WHERE T.train_name = 'Flying Scotsman' AND B.status = 'Booked';

-- 7. List passengers that are waitlisted including the name of the train.
SELECT P.first_name, P.last_name, T.train_name
FROM PASSENGER P
JOIN BOOKED B ON P.ssn = B.passenger_ssn
JOIN TRAIN T ON B.train_number = T.train_number
WHERE B.status = 'WaitL';

-- 8. List passenger names in descending order that have '605' phone area code.
SELECT P.first_name, P.last_name
FROM PASSENGER P
WHERE P.phone LIKE '605%'
ORDER BY P.last_name DESC;

-- 9. List name of passengers that are traveling on Thursdays in ascending order.
SELECT P.first_name, P.last_name
FROM PASSENGER P
JOIN BOOKED B ON P.ssn = B.passenger_ssn
JOIN TRAIN T ON B.train_number = T.train_number
JOIN TRAIN_STATUS TS ON T.train_name = TS.train_name
WHERE TS.train_date = 'Tuesday'
ORDER BY P.first_name ASC;
