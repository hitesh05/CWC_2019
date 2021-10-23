-- INSERT INTO Squad_Member_Role(`Player ID`,`Squad ID`,`Role`) VALUES ((SELECT `Player ID` FROM Squad_Members WHERE `Squad ID` = 1),1,'Batsmen');
-- INSERT INTO Squad_Members(`Squad ID`,`Name`) VALUES (1, "Jadeja");

INSERT INTO Squad_Members(`Player ID`, `Squad ID`,`Name`) VALUES ((SELECT `Player ID` FROM Squad_Members ORDER BY `Player ID` DESC LIMIT 1),%s,%s);

SELECT `Player ID` FROM Squad_Members ORDER BY `Player ID` DESC LIMIT 1

INSERT INTO Squad_Members(`Player ID`, `Squad ID`,`Name`) VALUES (((SELECT `Player ID` FROM Statistics ORDER BY `Player ID` DESC LIMIT 1)+1),1,"Kuldeep");

delete from Squad_Members where `Player ID` = 59 or `Player ID` = 60;

UPDATE `Batting Statistics`
SET `Runs scored`=304
WHERE `Player ID`=24;

"UPDATE `Batting Statistics` SET SUPERVISOR_ID='%s' WHERE Hotel_ID=%s" % (row["Sup_ID"], row["Hotel_ID"])