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
     query = "SELECT SUM(6s) AS Total_Sixes FROM `Batting Statistics`"
     cur.execute(query)
     table = cur.fetchall()
     print('Total sixes of the tournament')
     print()
     print(tabulate(table, headers="keys", tablefmt='psql'))

def cba_squad():
    while(True):
        sn = input('Enter squad name: ')
        if(len(sn)):
            query = "SELECT SUM(`Batting average`)/COUNT(*) AS Batting_Average FROM `Batting Statistics` WHERE `Squad ID` = (SELECT `Squad ID` FROM Squads WHERE `Squad Name` = %s) GROUP BY `Squad ID`;"
            cur.execute(query,(sn))
            res = cur.fetchall()
            break
        else:
            print("No name entered!")
    
    if not res:
        print("No such squad!")
        return
    print(tabulate(res, headers="keys", tablefmt='psql'))

def compare_cba():
    try:
        print("Enter x value for top x teams: ", end = "")
        x = input();
        tid = int(x)
        print("Enter y value for bottom y teams: ", end = "")
        y = input();
        bid = int(y)
        if(tid<0 or tid > 8 or bid<0 or bid>8):
            print("Invalid value of x")
            return
        tip = (y,x)
        query = "SELECT (SUM(`Batting average`)/COUNT(*))/(SELECT SUM(`Batting average`)/COUNT(*) FROM `Batting Statistics` WHERE `Squad ID` IN (SELECT `Squad ID` FROM `Points Table` WHERE Position >=(9-%s))) AS Ratio FROM `Batting Statistics` WHERE `Squad ID` IN (SELECT `Squad ID` FROM `Points Table` WHERE Position <= %s)"
        cur.execute(query,tip)
        table = cur.fetchall()
        print("The ratio of cumulative batting average of top x teams to bottom y teams")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except Exception as e:
        print("Invalid input")
        return
    
def searchPlayer():
    try:
        name = input("Enter player name you want to search(leave empty for all players): ")
        if(len(name)):
            query = """SELECT `Squad_Members`.`Squad ID`, `Squads`.`Squad Name`, `Squad_Members`.`Name` FROM `Squad_Members` INNER JOIN `Squads` ON `Squad_Members`.`Squad ID` = `Squads`.`Squad ID` WHERE Name = %s;"""
            cur.execute(query,(name))
            res = cur.fetchall()
            if not res:
                print("No such player in the database")
                return
        else:
            query = """SELECT `Squad_Members`.`Squad ID`, `Squads`.`Squad Name`, `Squad_Members`.`Name` FROM `Squad_Members` INNER JOIN `Squads` ON `Squad_Members`.`Squad ID` = `Squads`.`Squad ID`"""
            cur.execute(query)
            res = cur.fetchall()
        print("Player(s):")
        print()
        print(tabulate(res, headers="keys", tablefmt='psql'))
        return
    except Exception as e:
        print("Invalid input")
        return

def most_runs():
    query = "SELECT Name FROM `Squad_Members` WHERE `Player ID` = (SELECT `Player ID` FROM `Batting Statistics` ORDER BY `Runs scored` DESC LIMIT 1)"
    cur.execute(query)
    table = cur.fetchall()
    print('Player with most runs')
    print()
    print(tabulate(table, headers="keys", tablefmt='psql'))

def most_wickets():
    query = "SELECT Name FROM `Squad_Members` WHERE `Player ID` = (SELECT `Player ID` FROM `Bowling Statistics` ORDER BY `Wickets` DESC LIMIT 1)"
    cur.execute(query)
    table = cur.fetchall()
    print('Player with most wickets')
    print()
    print(tabulate(table, headers="keys", tablefmt='psql'))

def insert_player():
    try:
        print("Enter the player's name: ", end = "")
        name = input()
        print("Enter his Squad ID (1-10): ", end = "")
        sqid = (int)input()
        print("Enter his role (1 or 2 or 3):")
        print("1. Batsemen\n2. Bowler\n3. Wicket-Keeper)
        role = (int) input()
        if(sqid < 1 or sqid > 10 or role < 1 or role > 3):
            print("Invalid input")
            return
        tid = (sqid,name)
        query1 = "INSERT INTO Squad_Members(`Squad ID`,`Name`) VALUES (%s, %s);"
        cur.execute(query1,tid)
        if(role == 1):
           query2a = "INSERT INTO Squad_Member_Role(`Player ID`,`Squad ID`,`Role`) VALUES ((SELECT `Player ID` FROM Squad_Members WHERE `Squad ID` = %s),%s,'Batsmen');"
           cur.execute(query2a,(sqid,sqid))
        elif(role == 2):
            query2b = "INSERT INTO Squad_Member_Role(`Player ID`,`Squad ID`,`Role`) VALUES ((SELECT `Player ID` FROM Squad_Members WHERE `Squad ID` = %s),%s,'Bowler');"
            cur.execute(query2b,(sqid,sqid))
        elif(role == 3):
            query2c = "INSERT INTO Squad_Member_Role(`Player ID`,`Squad ID`,`Role`) VALUES ((SELECT `Player ID` FROM Squad_Members WHERE `Squad ID` = %s),%s,'Wicket-Keeper');"
            cur.execute(query2c,(sqid,sqid))
    except Exception as e:
        print("Invalid input")
        return

def update_statistics():
    try:
        print("Enter 1 or 2 to update batting or bowling statistics respectively: ", end = "")
        ch = (int)input()
        if ch < 1 or ch > 2:
            print("Invalid input")
            return
        if ch == 1:
            print("Enter the Player ID:", end = "")
            pid = (int)input()
            print("Enter what to update(1 or 2 or 3):")
            print("1. Runs scored\n2. Highest Score\n3. 100s")
            bch = (int) input()
            if bch == 1:
                print("Enter runs scored: ", end = "")
                rs = (int)input()
                query_b1 = "UPDATE `Batting Statistics` SET `Runs scored` = %s WHERE `Player ID` = %s;"
                cur.execute(query_b1,(rs,pid))
            elif bch == 2:
                print("Enter highest score: ", end = "")
                hs = (int)input()
                query_b2 = "UPDATE `Batting Statistics` SET `Highest Score` = %s WHERE `Player ID` = %s;"
                cur.execute(query_b2,(hs,pid))
            elif bch == 3:
                print("Enter number of 100s: ", end = "")
                hrs = (int)input()
                query_b3 = "UPDATE `Batting Statistics` SET `100s` = %s WHERE `Player ID` = %s;"
                cur.execute(query_b3,(hrs,pid))
        elif ch == 2:
            print("Enter the Player ID:", end = "")
            pid = (int)input()
            print("Enter what to update(1 or 2 or 3):")
            print("1. Maidens\n2. Wickets\n3. 5-wicket hauls")
            bch = (int) input()
            if bch == 1:
                print("Enter number of maidens: ", end = "")
                rs = (int)input()
                query_b1 = "UPDATE `Bowling Statistics` SET `Maidens` = %s WHERE `Player ID` = %s;"
                cur.execute(query_b1,(rs,pid))
            elif bch == 2:
                print("Enter number of wickets: ", end = "")
                hs = (int)input()
                query_b2 = "UPDATE `Bowling Statistics` SET `Wickets` = %s WHERE `Player ID` = %s;"
                cur.execute(query_b2,(hs,pid))
            elif bch == 3:
                print("Enter number of 5-wicket hauls: ", end = "")
                hrs = (int)input()
                query_b3 = "UPDATE `Bowling Statistics` SET `5 wicket hauls` = %s WHERE `Player ID` = %s;"
                cur.execute(query_b3,(hrs,pid))
    except Exception as e:
        print("Invalid input")
        return
       
        
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
        compare_cba()
    elif ch == 10:
        searchPlayer()
    elif ch == 11:
        most_runs()
    elif ch == 12:
        most_wickets()
    elif ch == 13:
        insert_player()
    elif ch == 14:
        update_statistics()

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
                print("8. Cumulative batting average of a squad")
                print("9. Compare Cumulative Batting average of top x teams on the Points Table with Cumulative Batting average of bottom y teams on the Points Table")
                print("10. Search player")
                print("11. Player with most runs")
                print("12. Player with most wickets")
                print("13. Insert player details in a squad")
                print("14. Update statistics)
                print("15. Logout")
                ch = 100
                while ch > 15:
                    try:
                        ch = int(input("Enter choice > "))
                        if ch > 15:
                            continue
                        elif ch < 1:
                            ch = 100
                            continue
                    except ValueError:
                        continue
                tmp = sp.call('clear', shell=True)
                if ch == 15:
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

    