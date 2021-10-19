CREATE TABLE `Squads` (
  `Squad ID` INT PRIMARY KEY,
  `Squad Name` VARCHAR(25) UNIQUE NOT NULL
);

CREATE TABLE `Fixtures` (
  `Match ID` INT PRIMARY KEY,
  `Team 1` VARCHAR(25) NOT NULL,
  `Team 2` VARCHAR(25) NOT NULL,
  `Venue` VARCHAR(50) NOT NULL,
  `Date & Time` VARCHAR(50) NOT NULL,
  `Ground Name` VARCHAR(50) NOT NULL
);

CREATE TABLE `Points Table` (
  `Team Name` VARCHAR(25) PRIMARY KEY,
  `Position`  INT UNIQUE NOT NULL,
  `Matches Played` INT NOT NULL,
  `Matches Won` INT NOT NULL,
  `Matches Lost` INT NOT NULL,
  `Matches Tied` INT NOT NULL,
  `Matches Abandoned` INT NOT NULL,
  `Net Run Rate` FLOAT NOT NULL,
  `Points` INT NOT NULL,
  `Squad ID` INT NOT NULL
);

CREATE TABLE `Grounds` (
  `Ground Name` VARCHAR(50) PRIMARY KEY,
  `Country` VARCHAR(25) NOT NULL,
  `City` VARCHAR(25) NOT NULL
);

CREATE TABLE `Results` (
  `Match ID` INT PRIMARY KEY,
  `Team 1 Score` VARCHAR(50),
  `Team 2 Score` VARCHAR(50),
  `Winner` VARCHAR(25),
  `Win margin` VARCHAR(50)
);

CREATE TABLE `Gallery` (
   `Match ID` INT PRIMARY KEY,
   `Photos` VARCHAR(30)
);

CREATE TABLE `Ground_Matches` (
  `Ground Name` VARCHAR(50),
  `Match ID` INT,
  PRIMARY KEY (`Ground Name`, `Match ID`)
);

CREATE TABLE `Squad_Members` (
  `Squad ID` INT NOT NULL,
  `Player ID` INT UNIQUE NOT NULL,
  `Name` VARCHAR(30) NOT NULL,
  PRIMARY KEY(`Squad ID`, `Player ID`)
);

CREATE TABLE `Squad_Member_Role` (
  `Squad ID` INT NOT NULL,
  `Player ID` INT NOT NULL,
  `Role` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Squad ID`, `Player ID`, `Role`)
);

CREATE TABLE `Statistics` (
  `Player ID` INT PRIMARY KEY,
  `Player Name` VARCHAR(30) NOT NULL,
  `Matches Played` INT NOT NULL
);

CREATE TABLE `Batting Statistics` (
   `Player ID` INT PRIMARY KEY,
   `Position` INT NOT NULL,
   `Runs scored` INT NOT NULL,
   `Highest Score` INT NOT NULL,
   `Batting average` INT NOT NULL,
   `100s` INT NOT NULL,
   `Strike rate` FLOAT NOT NULL,
   `4s` INT NOT NULL,
   `6s` INT NOT NULL,
   `Squad ID` INT NOT NULL
);

CREATE TABLE `Bowling Statistics` (
  `Player ID` INT PRIMARY KEY,
  `Position` INT NOT NULL,
  `Overs` FLOAT NOT NULL,
  `Maidens` INT NOT NULL,
  `Wickets` INT NOT NULL,
  `Economy` FLOAT NOT NULL,
  `Best performance` VARCHAR(30) NOT NULL,
  `Bowling average` FLOAT NOT NULL,
  `Strike rate` FLOAT NOT NULL,
  `5 wicket hauls` INT NOT NULL,
  `Squad ID` INT NOT NULL
);

CREATE TABLE `Squads_Statistics` (
  `Squad ID` INT,
  `Player ID` INT,
  PRIMARY KEY (`Squad ID`,`Player ID`)
);

CREATE TABLE `Matches` (
  `Match ID` INT,
  `Ground Name` VARCHAR(50),
  PRIMARY KEY (`Match ID`, `Ground Name`)
);

CREATE TABLE `Equal_Points` (
  `Team A` VARCHAR(25),
  `Team B` VARCHAR(25),
  `Points` INT NOT NULL,
  PRIMARY KEY (`Team A`, `Team B`)
);




ALTER TABLE `Fixtures`
ADD FOREIGN KEY (`Ground Name`) REFERENCES `Grounds` (`Ground Name`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Points Table`
ADD FOREIGN KEY (`Squad ID`) REFERENCES `Squads` (`Squad ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Results`
ADD FOREIGN KEY (`Match ID`) REFERENCES `Fixtures` (`Match ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Gallery`
ADD FOREIGN KEY (`Match ID`) REFERENCES `Fixtures` (`Match ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Ground_Matches`
ADD FOREIGN KEY (`Ground Name`) REFERENCES `Grounds` (`Ground Name`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Squad_Members`
ADD FOREIGN KEY (`Squad ID`) REFERENCES `Squads` (`Squad ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Squad_Member_Role`
ADD FOREIGN KEY (`Squad ID`) REFERENCES `Squad_Members` (`Squad ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Squad_Member_Role`
ADD FOREIGN KEY (`Player ID`) REFERENCES `Squad_Members` (`Player ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Batting Statistics`
ADD FOREIGN KEY (`Player ID`) REFERENCES `Statistics` (`Player ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Batting Statistics`
ADD FOREIGN KEY (`Squad ID`) REFERENCES `Squads` (`Squad ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Bowling Statistics`
ADD FOREIGN KEY (`Player ID`) REFERENCES `Statistics` (`Player ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Bowling Statistics`
ADD FOREIGN KEY (`Squad ID`) REFERENCES `Squads` (`Squad ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Squads_Statistics` 
ADD FOREIGN KEY (`Squad ID`) REFERENCES `Squads` (`Squad ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Squads_Statistics`
ADD FOREIGN KEY (`Player ID`) REFERENCES `Bowling Statistics` (`Player ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Squads_Statistics`
ADD FOREIGN KEY (`Player ID`) REFERENCES `Batting Statistics` (`Player ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Matches`
ADD FOREIGN KEY (`Ground Name`) REFERENCES `Grounds` (`Ground Name`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Matches`
ADD FOREIGN KEY (`Match ID`) REFERENCES `Fixtures` (`Match ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Matches`
ADD FOREIGN KEY (`Match ID`) REFERENCES `Results` (`Match ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Matches`
ADD FOREIGN KEY (`Match ID`) REFERENCES `Gallery` (`Match ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Equal_Points`
ADD FOREIGN KEY (`Team B`) REFERENCES `Points Table` (`Team Name`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Equal_Points` 
ADD FOREIGN KEY (`Team A`) REFERENCES `Points Table` (`Team Name`) ON DELETE CASCADE ON UPDATE CASCADE;
