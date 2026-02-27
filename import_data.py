import sqlite3
import csv

con = sqlite3.connect("railway.db")
cur = con.cursor()

with open("Train.csv", "r") as file:
    reader = csv.DictReader(file)
    for row in reader:
        cur.execute("INSERT INTO train VALUES (?, ?, ?, ?, ?, ?, ?)",
            (row["TrainNumber"], row["TrainName"], row["PremiumFare"],
             row["GeneralFare"], row["SourceStation"], row["DestinationStation"],
             row["Weekdays"]))

with open("Train_status.csv", "r") as file:
    reader = csv.DictReader(file)
    for row in reader:
        cur.execute("INSERT INTO train_status VALUES (?, ?, ?, ?, ?, ?)",
            (row["TrainDate"], row["TrainName"], row["PremiumSeatsAvailable"],
             row["GenSeatsAvailable"], row["PremiumSeatsOccupied"],
             row["GenSeatsOccupied"]))

with open("Passenger-1.csv", "r", encoding="utf-8-sig") as file:
    reader = csv.DictReader(file)
    for row in reader:
        cur.execute("INSERT INTO passenger VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
            (row["first_name"], row["last_name"], row["address"],
             row["city"], row["county"], row["phone2"],
             row["SSN"], row["bdate"]))

with open("booked-1.csv", "r", encoding="utf-8-sig") as file:
    reader = csv.DictReader(file)
    for row in reader:
        cur.execute("INSERT INTO booked VALUES (?, ?, ?, ?)",
            (row["Passenger_ssn"], row["Train_Number"],
             row["Ticket_Type"], row["Status"]))

con.commit()
con.close()
