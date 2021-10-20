import subprocess as sp
import pymysql
import pymysql.cursors
from tabulate import tabulate
import os

from dotenv import load_dotenv
load_dotenv()

MYSQL_USERNAME = os.getenv("MYSQL_USERNAME")
MYSQL_PASSWORD = os.getenv("MYSQL_PASSWORD")
DB_NAME = os.getenv("DB_NAME")
MYSQL_HOST = os.getenv("MYSQL_HOST")


def showPointsTable():
    query = "SELECT * FROM `Points Table` ORDER BY Position ASC"
    cur.execute(query)
    table = cur.fetchall()
    print("Points Table")
    print()
    print(tabulate(table, headers="keys", tablefmt='psql'))
    
def matchResults():
    query = "SELECT * FROM Results ORDER BY `Match ID` ASC"
    cur.execute(query)
    table = cur.fetchall()
    print("Results")
    print()
    print(tabulate(table, headers="keys", tablefmt='psql'))
    
def showFixtures():
    query = "SELECT * FROM Fixtures ORDER BY `Match ID` ASC"
    cur.execute(query)
    table = cur.fetchall()
    print("Results")
    print()
    print(tabulate(table, headers="keys", tablefmt='psql'))
    
def viewSquads():
    query = "SELECT * FROM Squads ORDER BY `Squad ID` ASC"
    cur.execute(query)
    table = cur.fetchall()
    print("Squads")
    print()
    print(tabulate(table, headers="keys", tablefmt='psql'))
    
def playerStats():
    return 
    
def dispatch(ch):
    if ch == 1:
        showPointsTable()
    elif ch == 2:
        matchResults()
    elif ch == 3:
        playerStats()
    elif ch == 4:
        showFixtures()
    elif ch == 5:
        viewSquads()
    elif ch == 6:
        print("To do")
    elif ch == 7:
        print("To do")
    elif ch == 8:
        print("To do")

while True:
    tmp = sp.call('clear', shell=True)

    try:
        con = pymysql.connect(host=MYSQL_HOST, user=MYSQL_USERNAME,
                              password=MYSQL_PASSWORD, db=DB_NAME, cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if con.open:
            print("Successfully Connected to the Database")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE > ")

        with con.cursor() as cur:
            while True:
                tmp = sp.call('clear', shell=True)
                print("Premier League CLI")
                print("----------Queries----------")
                print("1. View Points Table")
                print("2. View all the Results")
                print("3. Player Stats")
                print("4. View all fixtures")
                print("5. View all the squads")
                print("6.")
                print("7.")
                print("8.")
                print("9. Logout")
                ch = 100
                while ch > 9:
                    try:
                        ch = int(input("Enter choice > "))
                        if ch > 9:
                            continue
                        elif ch < 1:
                            ch = 100
                            continue
                    except ValueError:
                        continue
                tmp = sp.call('clear', shell=True)
                if ch == 9:
                    exit(0)
                else:
                    back = dispatch(ch)
                    if not back:
                        tmp = input("Enter any key to CONTINUE > ")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print("Connection Refused: Either username or password is incorrect or you don't have the permissions to access the database")
        tmp = input("Enter any key to Retry or type 'quit' to exit: ")
        if tmp == "quit":
            break

    