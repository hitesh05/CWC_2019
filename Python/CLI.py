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
    try:
        id = input("Enter Match ID for result(leave empty for all results): ")
        id1 = int(id)
        if(id1<1 or id1>48):
            print("Invalid Match ID")
            return
        if(len(id)):
            query = """SELECT * FROM Results WHERE `Match ID` = %s;"""
            cur.execute(query,(id))
            table = cur.fetchall()
        else: 
            query = "SELECT * FROM Results ORDER BY `Match ID` ASC"
            cur.execute(query)
            table = cur.fetchall()
        print("Result(s):")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except Exception as e:
        print("Invalid input")
        return
    
def showFixtures():
    query = "SELECT * FROM Fixtures ORDER BY `Match ID` ASC"
    cur.execute(query)
    table = cur.fetchall()
    print("Fixtures")
    print()
    print(tabulate(table, headers="keys", tablefmt='psql'))
    
def viewSquads():
    query = "SELECT * FROM Squads ORDER BY `Squad ID` ASC"
    cur.execute(query)
    table = cur.fetchall()
    print("Squads")
    print()
    print(tabulate(table, headers="keys", tablefmt='psql'))
    
def getVenue():
    try:
        id = input("Enter Match ID: ")
        id1 = int(id)
        if(id1<1 or id1>48 or len(id)==0):
            print("Invalid Match ID")
            return
        if(len(id)):
            query = """SELECT `Ground Name` FROM `Ground_Matches` WHERE `Match ID` = %s;"""
            cur.execute(query,(id))
            res = cur.fetchall()
        print(tabulate(res, headers="keys", tablefmt='psql'))
        return
    except Exception as e:
        print("Invalid input")
        return 

def deletePhotos():
    try:
        id = input("Enter Match ID: ")
        id1 = int(id)
        if(id1<1 or id1>48 or len(id)==0):
            print("Invalid Match ID")
            return
        if(len(id)):
            query = """UPDATE Gallery SET Photos = NULL WHERE `Match ID` = %s;"""
            cur.execute(query,(id))
            print("Photos deleted!")
    except Exception as e:
        print("Invalid input")
        return
    
def total_sixes():
     query = "SELECT SUM(6s) FROM `Batting Statistics`"
     cur.execute(query)
     table = cur.fetchall()
     print('Total sixes of the tournament')
     print()
     print(tabulate(table, headers="keys", tablefmt='psql'))

def cba_squad():
    while(True):
        sn = input('Enter squad name:')
        if(len(sn)):
            query = "SELECT SUM(`Batting average`)/COUNT(*) FROM `Batting Statistics` WHERE `Squad ID` = (SELECT `Squad ID` FROM Squads WHERE `Squad Name` = %s) GROUP BY `Squad ID`;"
            cur.execute(query,(sn))
            res = cur.fetchall()
            break
        else:
            print("No name entered!")
    
    if not res:
        print("No such squad!")
        return
    print(tabulate(res, headers="keys", tablefmt='psql'))

# def compare_cba():


def dispatch(ch):
    if ch == 1:
        showPointsTable()
    elif ch == 2:
        matchResults()
    elif ch == 3:
        total_sixes()
    elif ch == 4:
        showFixtures()
    elif ch == 5:
        viewSquads()
    elif ch == 6:
        getVenue()
    elif ch == 7:
        deletePhotos()
    elif ch == 8:
        cba_squad()
    elif ch == 9:
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
                print("Cricket World Cup 2019")
                print("----------Queries----------")
                print("1. View Points Table")
                print("2. View Results")
                print("3. Total sixes of the tournament")
                print("4. View all fixtures")
                print("5. View all the squads")
                print("6. Get Venue")
                print("7. Delete Photos")
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

    