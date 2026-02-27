import sqlite3
import csv

con = sqlite3.connect("railway.db")
cur = con.cursor()

with open("Train.csv", "r") as file:
    reader = csv.DictReader(file, skipinitialspace=True)
    for row in reader:
        cur.execute("INSERT INTO train VALUES (?, ?, ?, ?, ?, ?, ?)",
            (row["trainnumber"], row["trainname"], row["premiumfair"],
             row["generalfair"], row["sourcestation"], row["destinationstation"],
             row["weekdays"]))

with open("Train_status.csv", "r") as file:
    reader = csv.DictReader(file, skipinitialspace=True)
    for row in reader:
        cur.execute("INSERT INTO train_status VALUES (?, ?, ?, ?, ?, ?)",
            (row["TrainDate"], row["TrainName"], row["PremiumSeatsAvailable"],
             row["GenSeatsAvailable"], row["PremiumSeatsOccupied"],
             row["GenSeatsOccupied"]))

with open("Passenger-1.csv", "r", encoding="utf-8-sig") as file:
    reader = csv.DictReader(file, skipinitialspace=True)
    for row in reader:
        cur.execute("INSERT INTO passenger VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
            (row["first_name"], row["last_name"], row["address"],
             row["city"], row["county"], row["phone2"],
             row["SSN"], row["bdate"]))

with open("booked-1.csv", "r", encoding="utf-8-sig") as file:
    reader = csv.DictReader(file, skipinitialspace=True)
    for row in reader:
        cur.execute("INSERT INTO booked VALUES (?, ?, ?, ?)",
            (row["Passanger_ssn"], row["Train_Number"],
             row["Ticket_Type"], row["Staus"]))

con.commit()
con.close()
