# Data and Applications Project

## Cricket World Cup, 2019
Database for all the details of the World Cup held in 2019, including fixtures, results, players, their statistics, venues the games were held at, etc. 

## Functionalities that our code can provide:

**1.View Points Table:**
Displays the points table at the end of the group stages, sorted by the number of points of each team.

**2. View Results:**
Can display the result according to the Match ID provided in the command line, or all results at once. Empty entries correspond to matches that were abandoned due to rain. Error message shown if the Match ID entered is incorrect.

**3. Total Sixes of the tournament:**
Prints the total number of sixes hit in the tournament by the batsmen present in our database.

**4. View all fixtures:**
Displays the fixture schedule of the tournament in a table.

**5. View all the squads:**
Displays all the 10 teams that qualified for the World Cup after going through the qualification process.

**6. Get Venue:**
Returns the venue where the match was held according to the Match ID provided in the command line. Error message shown if the Match ID entered is incorrect.

**7. Delete Photos:**
In case you want to delete the pictures of a particular game, this functionality may be used. Error message shown if the Match ID entered is incorrect.

**8. Cumulative batting average of a squad:**
Displays the cumulative batting average of all the batsmen of a squad in our database. Error message shown if the Squad entered is incorrect.

**9. Compare Cumulative Batting average of top x teams on the Points Table with Cumulative Batting average of bottom y teams on the Points Table:**
This function return the ration between the cumulative average of top x (say 2) teams to bottom y (say 3) teams. The ranking is done according to the position on which the team finished in the points table.

**10. Search Player:**
This functionality tests the existence of a player in the database. If the player exists, the function returns the squad to which the player belongs, else an error message is displayed.

**11. Player with most runs:**
Displays the player with the most runs in the tournament according to our database.

**12. Player with most wickets:**
Displays the player with the most wickets in the tournament according to our database.

**13. Insert player details in a squad:**
To insert a new player in the database that took part in the World Cup, this function may be used. Player Name, Squad ID, and the Role of the player will be required.

**14. Update Statistics:**
To update the batting or bowling statistics of a player in the database, the update_statistics() function is used. For batting statistics, you are allowed to update the runs scored, the player's highest score or the number of 100s by a player. For bowling statistics, you are allowed to update the number of maidens bowled by the player, number of wickets taken, or the number of 5 wicket hauls picked up in the tournament.

**Note:** *Delete Photos*, *insert player details in a squad*, and *update statistics* are the 3 update queries while the rest are retrievals. 

