CREATE TABLE TRAIN (
  train_number INT PRIMARY KEY,
  train_name TEXT UNIQUE,
  premium_fare INT,
  general_fare INT,
  source_station TEXT,
  destination_station TEXT,
  weekdays TEXT
);

CREATE TABLE TRAIN_STATUS (
  train_date TEXT,
  train_name TEXT,
  premium_seats_available INT,
  gen_seats_available INT,
  premium_seats_occupied INT,
  gen_seats_occupied INT,
  PRIMARY KEY (train_date, train_name),
  FOREIGN KEY (train_name) REFERENCES train(train_name)
);

CREATE TABLE PASSENGER (
  first_name TEXT,
  last_name TEXT,
  address TEXT,
  city TEXT,
  county TEXT,
  phone TEXT,
  ssn INT PRIMARY KEY,
  bdate TEXT
);

CREATE TABLE BOOKED (
  passenger_ssn INT,
  train_number INT,
  ticket_type TEXT,
  status TEXT,
  PRIMARY KEY (passenger_ssn, train_number),
  FOREIGN KEY (passenger_ssn) REFERENCES passenger(ssn),
  FOREIGN KEY (train_number) REFERENCES train(train_number)
);
