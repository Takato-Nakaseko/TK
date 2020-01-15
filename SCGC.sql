DROP DATABASE IF EXISTS SCGC;

CREATE DATABASE IF NOT EXISTS SCGC;

USE SCGC;

CREATE TABLE Members (
  MemberID  INT PRIMARY KEY AUTO_INCREMENT  NOT NULL,
  FirstName VARCHAR(15)                     NOT NULL,
  LastName  VARCHAR(20)                     NOT NULL,
  Phone     CHAR(10)                        NOT NULL,
  Email     VARCHAR(45)                     NOT NULL
);

CREATE TABLE Genres (
  GenreID   INT PRIMARY KEY AUTO_INCREMENT  NOT NULL,
  GenreType VARCHAR(20)                     NOT NULL,
  GenreDesc VARCHAR(200)                      NULL
);

CREATE TABLE Systems (
  SystemID      INT PRIMARY KEY AUTO_INCREMENT  NOT NULL,
  SystemName    VARCHAR(20)                     NOT NULL,
  Manufactorer  VARCHAR(20)                     NOT NULL
);

CREATE TABLE Schools (
  SchoolID    INT PRIMARY KEY AUTO_INCREMENT  NOT NULL,
  SchoolName  VARCHAR(45)                     NOT NULL
);

CREATE TABLE Games (
  GameID      INT PRIMARY KEY AUTO_INCREMENT  NOT NULL,
  GameTitle   VARCHAR(100)                     NOT NULL,
  Multiplayer TINYINT(1)                      NOT NULL,
  GenreID     INT                             NOT NULL,
  GameDesc    VARCHAR(400)                      NULL,

  CONSTRAINT  Games_GenreID_FK
    FOREIGN KEY (GenreID) REFERENCES Genres (GenreID)
);

CREATE TABLE GamesOnSystems (
  ReleaseID   INT PRIMARY KEY AUTO_INCREMENT  NOT NULL,
  GameID      INT                             NOT NULL,
  SystemID    INT                             NOT NULL,

  CONSTRAINT  GamesOnSystems_GameID_SystemID_FK
    FOREIGN KEY (GameID)    REFERENCES  Games   (GameID),
    FOREIGN KEY (SystemID)  REFERENCES  Systems (SystemID)
);

CREATE TABLE MembersGames (
  MemberID  INT NOT NULL,
  ReleaseID INT NOT NULL,

  CONSTRAINT  MembersGames_MemberID_ReleaseID_PK
    PRIMARY KEY (MemberID, ReleaseID),
  CONSTRAINT  MembersGames_MemberID_ReleaseID_FK
    FOREIGN KEY (MemberID)  REFERENCES Members        (MemberID),
    FOREIGN KEY (ReleaseID) REFERENCES GamesOnSystems (ReleaseID)
);

CREATE TABLE MeetingRooms (
  RoomID    INT PRIMARY KEY AUTO_INCREMENT  NOT NULL,
  RoomName  VARCHAR(20)                     NOT NULL,
  SchoolID  INT                             NOT NULL,

  CONSTRAINT MeetingRooms_SchoolID_FK
    FOREIGN KEY (SchoolID) REFERENCES Schools (SchoolID)
);

CREATE TABLE Clubs (
  ClubID       INT PRIMARY KEY AUTO_INCREMENT  NOT NULL,
  MeetingDay    ENUM('M', 'T', 'W', 'Th', 'F', 'Sa', 'Su'),
  SchoolID      INT                             NOT NULL,
  MeetingRoom   INT                             NOT NULL,
  PrimaryGame   INT                             NULL,
  PrimaryGenre  INT                             NULL,

  CONSTRAINT  Clubs_SchoolID_MeetingRoom_PrimaryGame_PrimaryGenre_FK
    FOREIGN KEY (SchoolID) REFERENCES Schools (SchoolID),
    FOREIGN KEY (MeetingRoom) REFERENCES MeetingRooms (RoomID),
    FOREIGN KEY (PrimaryGame) REFERENCES Games (GameID),
    FOREIGN KEY (PrimaryGenre) REFERENCES Genres (GenreID)
);

CREATE TABLE MemberInClub (
  MCID      INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  MemberID  INT NOT NULL,
  ClubID   INT NOT NULL,

  CONSTRAINT  MemberInClub_MemberID_ClubID_FK
    FOREIGN KEY (MemberID) REFERENCES Members (MemberID),
    FOREIGN KEY (ClubID)  REFERENCES Clubs  (ClubID)
);

INSERT INTO Schools (SchoolName)
VALUES      ('North Seattle'),
            ('South Seattle'),
            ('Seattle Central');

INSERT INTO Genres (GenreType, GenreDesc)
VALUES
  ('Action','Fast, fun, exciting!'),
  ('Adventure','Basically just Uncharted'),
  ('ARPG','Action Role Playing Game, Diablo and clones'),
  ('SRPG','Strategy Role Playing Game, often involves using a party and turn-based combat'),
  ('CRPG','Computer Role Playing Game, isometric RPG often using Dungeons and Dragons ruleset'),
  ('JRPG','Japanese Role Playing Game, don\'t tell my dad how many of these I play'),
  ('SoulsLike','Games similar to Dark Souls: slow, deliberate combat with stamina management'),
  ('RogueLike','RPG often involving tiles-based movement taken in turns delving into random dungeons'),
  ('Strategy','Games invloving tactical thinking, and play on a grander scale. Or board games'),
  ('Puzzle','You are presented with a problem and must find the solution using what you are given'),
  ('Card Game','Building a deck of cards and using it to fight against other players/AI. Think MTG'),
  ('MMO','Massively Multiplayer Online. Global-ish servers where you play with everyone at once'),
  ('MMORPG','MMO role playing game, take quests and get into your character along with everyone else'),
  ('Horror','Scary shit'),
  ('Shooting','Guns, action, grisled dudes with short brown hair. Pew pew'),
  ('FPS','Shooting but you see through the dudes\' eyeballs'),
  ('Platformer','Precision jumping to go from the left to the right'),
  ('Fighting','Two players battle it out with flashy characters and precision button presses'),
  ('Party Game','Fun for the whole family, often even those not as familiar with video games'),
  ('Sportsball','Games involving real life (mostly) sports'),
  ('RTS','Real Time Strategy, strategy games where all players go at the same time and are not limited in actions they can take in a given timeframe');

  INSERT INTO Games (GameTitle, Multiplayer, GenreID, GameDesc)
  VALUES
    ('Warframe',1,13,'Massively Multiplayer Space Ninjas with Space Magic'),
    ('Path of Exile',1,3,'Massively Multiplayer Diablo-like ARPG with rich economy and crafting/currency systems'),
    ('Devil May Cry 5',1,1,'5th installment in the mainline Devil May Cry series. Featuring Dante from Devil May Cry'),
    ('Arcanum: Of Steamworks and Magic Obscura',0,4,'Troika game in the vein of the original Fallouts absolutely dripping in Steampunk themes. Pretty old at this point, had multiplayer don\'t believe it still works good'),
    ('GOD EATER 3',1,6,'The world has been overrun with Aragami and you are part of the enslaved child military capable of actually fighting back. Hunt them down and drive them off.'),
    ('Monster Hunter World',1,6,'Explore the new world and, well, hunt monsters. Strong resource gathering to crafting upgrade loop'),
    ('Return of the Obra Dinn',0,10,'Out at sea the 100 crew and passengers of the Obra Dinn have all perished. Using detective skills and a special pocketwatch piece together what happened to the ship.'),
    ('One Finger Death Punch 2',0,1,'Sequal to OFDP that improves on it greately. Using just two buttons fight off hundreds of enemy combatants. Simplicity to perfection. To be played in bursts. By design there is no story, only crazy kung-fu. Do not button mash!'),
    ('RimWorld',0,9,'A group of colonists/prisoners/savages has crashed down on an extremely hostile planet far away from anything notable. Survive.'),
    ('Slay the Spire',0,11,'Mixing Roguelike and deckbuilding elements run a dungeon using attacks and spells you build in your deck of cards. Compete on the daily challenge for high score!'),
    ('Eternal Card Game',1,11,'Do battle against an AI-controlled opponent or other players around the world as you collect cards in a variety of game modes.'),
    ('Risk of Rain',1,8,'You (and your friends) were piloting a cargo ship full of exotic and valuable items before crashing into a planet full of hostile fauna. Get back to your ship and escape.'),
    ('Enter the Gungeon',1,8,'Guns. Everything is guns.'),
    ('Cataclysm: Dark Days Ahead',0,8,'The planet was invaded by several alien species, fungus turned sentienet and man-eating, experimental bio-weapons broke out of the labratories. Oh, and there\'s zombies. I recommend the version with tiles instead of DOS'),
    ('Destiny',1,13,'Fight against three major alien races in a quest to save mankind (and robots and purple people) You will never get an exotic drop'),
    ('Destiny 2',1,13,'It\'s just more Destiny but you gotta pay $60 again'),
    ('EVE Online',1,12,'Spreadsheets in space. Come home from your paying job to pay to have another job.'),
    ('The Legend of Heroes: Trials of Cold Steel',0,6,'Schoolkids in a magic military academy. Super cliche, but is pretty much responsible for why it\'s so cliche.'),
    ('Atelier Sophie: The Alchemist of the Mysterious Book',0,6,'Super cute and fluffy story about a girl and her talking book as they try to make Sophie the best alchemist there ever was. There\'s also no time limit on this one!'),
    ('Sekiro: Shadows Die Twice',0,7,'A rogue shinobi has been separated from his master. Using his supernatural ability to die multiple times he must fight his way into the castle and stop his lord from being sacraficed.'),
    ('Dark Souls: Prepare to Die Edition',1,7,'A piece of beef jerky has gained sentience and now goes and kills the gods'),
    ('Dark Souls II',1,7,'A piece of beef jerky has gained sentience and now goes and kills a lot of dudes in armor'),
    ('Dark Souls III',1,7,'A regular guy who\'s slightly on fire keeps his sentience and now goes and kills some dragons and ice people'),
    ('The Wire',0,7,'Sci-fi Dark Souls with super bullshit bosses'),
    ('Skyrim',0,1,'Open world action game. Fighting dragons.'),
    ('Days gone',0,1,'Life in Oregon state with zonbies'),
    ('Catan',1,9,'Establishing colonies on the island of Catan'),
    ('Resident Evil 7',0,14,'Ecaping from insane family'),
    ('Legend of Zelda Breath of the WIld',0,2,'Exploring the kingdom of Hyrule'),
    ('Minecraft',1,2,'Building, mining, and destroying'),
    ('Assassin\'s Creed',1,1,'Assassinating people.'),
    ('Watch Dogs',1,1,'Exploring a city and fighting bad people with technology'),
    ('Brothers: a tale of two sons',0,2,'Two brothers take a journey to save his father.'),
    ('Call of Duty: Black Ops 4',1,15,'Future shooting game.'),
    ('Battle Field 4',1,15,'Modern shooting game'),
    ('Dead by Daylight',1,14,'Escape from a killer'),
    ('The Witcher III',0,3,'Open world RPG with intricate fighting and cinematic story'),
    ('Dead Cells',0,8,'Metroidvanialike roguelike sidescroller'),
    ('Overwatch',1,15,'TF2 style FPS'),
    ('Mega Man 11',0,17,'2d platformer where you kill enemies and collect weapons'),
    ('Super Mario Odyssey',0,17,'3d platformer where you collect coins, stars, and new hats'),
    ('Resident Evil 2',0,14,'Classic horror game about an outbreak in Racoon city'),
    ('Ashen',0,7,'Insanely hard soulslike game'),
    ('Apex Legends',1,15,'60 player battleroyal FPS'),
    ('Metro Last Light',0,15,'FPS style action game'),
    ('FIFA 19',1,20,'Pro soccer simulator'),
    ('Grand Theft Auto V',1,1,'Open world RPG with a seedy underworld'),
    ('MTG Arena',1,11,'Magic the gathering online'),
    ('Hearthstone',1,11,'WoW based card game'),
    ('Starcraft 2',1,21,'RTS about 3 alien species'),
    ('Diablo 3',1,3,'dungeon hack and slash'),
    ('Gin Rummy',1,11,'Each player uses their hand to form combinations of three or more cards, to get more than the 100 points required to win the game before their opponent does so when played over several hands'),
    ('Cockroach',1,11,'A game all about bluffing. Cockroaches are spades, lady bugs are hearts, dragon flys are clubs, and bettles are diamonds. Players pass the cards and state what kind of bug it is, the person receiving the card determines whether that player was telling the truth, and states True or False.  The goal of the game is to force another player to collect 4 of any type of critter. '),
    ('War',1,11,'Each player turns up a card at the same time and the player with the higher card takes both cards and puts them, face down, on the bottom of his stack. The goal is to get all of the cards.'),
    ('Solitare',0,11,'Columns of card piles need to be organized to eliminate the cards dealt'),
    ('Tetris',0,10,'Stack shapes to fit together to eliminate rows'),
    ('Candy Crush',0,10,'Score points by crushing candy and following the level objective'),
    ('Backgammon',1,9,'To win at backgammon, you have to move all of your checkers into your own home board'),
    ('Chess',1,9,'Objective of the game is to checkmate your opponents king'),
    ('Codenames',1,9,'A game of guessing which code names (words) in a set are related to a hint-word given by another player. One player of each team is selected as the team\'s spymaster; the others are field operatives.'),
    ('Mahjong ',0,10,'Match the stacks of tiles to illiminate tiles and clear the board'),
    ('Mario Party',1,2,'Complete the board earning stars, coins, and winning mini games to be the Star Player'),
    ('Super Smash Bros',1,1,'Fight other characters to be the last remaining player on the platform'),
    ('Mario 3D World',1,2,'Explore the vast new kingdome and work together with your friends to save the Sprixies'),
    ('Super Luigi U',1,2,'Luigi needs to save the day in this adventure. Master each coarse and prove that Luigi has what it takes!'),
    ('The Legend of Zelda',0,2,'Link\'s map is blank at the start, meant to be filled with icons as you decide which activities to pursue. If you see something in the distance, you can walk or fly straight to it.'),
    ('Donkey Kong Country',1,2,'A crazy quest across tropical islands'),
    ('Cribbage',1,11,'Play proceeds through a succession of "hands", each hand consisting of a "deal", "the play" and "the show". At any time during any of these stages, if a player reaches the target score (usually 121), play ends immediately with that player being the winner of the game. This can even happen during the deal, since the dealer scores if a jack is cut as the starter.'),
    ('Hearts',1,11,'Trick-taking playing card game for four players'),
    ('Mille Bornes',1,11,'A French card game to make it 1,000 km. Other player increase difficulty by playing hazards'),
    ('Super Mario Party',1,19,'boardgame like with tons of mini games'),
    ('Pummel Party',1,19,'boardgame like with tons of mini games'),
    ('Street Fighter V',1,18,''),
    ('Mortal Kombat 11',1,18,''),
    ('Marvel Vs Capcom 3',1,18,''),
    ('Marvel Vs Capcom 2',1,18,''),
    ('Tekken 7',1,18,''),
    ('Madden 19',1,20,'NFL Simulator'),
    ('NBA 2k19',1,20,'NBA Simulator');

INSERT INTO Members (FirstName, LastName, Phone, Email)
    VALUES
      ('Kevin', 'Pettinger', '2062223421', 'kevinp@nsc.edu'),
      ('Dylan', 'Riley', '2069434871', 'DylanR@nsc.edu'),
      ('Takato', 'Nakaseko', '2067775445', 'TakatoN@nsc.edu'),
      ('Alicia', 'Stephan', '2065558975', 'AliciaS@nsc.edu'),
    	('Christa', 'Extence', '8185646160', 'cextence0@shinystat.com'),
    	('Chalmers', 'Littlefield', '5694738959', 'clittlefield1@stumbleupon.com'),
    	('Mirabelle', 'Bedding', '4407423933', 'mbedding2@cdc.gov'),
    	('Sheeree', 'Sach', '2793684816', 'ssach3@ocn.ne.jp'),
    	('Conni', 'Kilborn', '1111359407', 'ckilborn4@twitpic.com'),
    	('Pete', 'Boomes', '2996794851', 'pboomes5@fotki.com');

INSERT INTO MeetingRooms (RoomName, SchoolID)
VALUES
  ('IB3405', 1),
  ('Grove', 1),
  ('IB3307', 1);

INSERT INTO Clubs (MeetingDay, SchoolID, MeetingRoom, PrimaryGame, PrimaryGenre)
VALUES
  ('F', 1, 2, 78, NULL),
  ('Th', 1, 3, NULL, 7),
  ('W', 1, 2, 44, 16),
  ('Sa', 1, 2, 13, NULL),
  ('Su', 1, 2, 29, NULL),
  ('M', 1, 1, NULL, 11),
  ('M', 1, 2, NULL, 14);

INSERT INTO Systems (SystemName, Manufactorer)
VALUES
  ('Windows', 'Microsoft'),
  ('XBOX ONE', 'Microsoft'),
  ('PS4', 'Sony'),
  ('Switch', 'Nintendo'),
  ('Gamecube', 'Nintendo'),
  ('Wii', 'Nintendo'),
  ('PS3', 'Sony'),
  ('PS2', 'Sony'),
  ('XBOX 360', 'Microsoft');

INSERT INTO GamesOnSystems (GameID, SystemID)
VALUES
  (1, 1),
  (2, 1),
  (3, 3),
  (4, 1),
  (5, 1),
  (6, 1),
  (6, 2),
  (6, 3),
  (7, 1),
  (8, 1),
  (9, 1),
  (10, 1),
  (11, 1),
  (12, 1),
  (13, 1),
  (13, 2),
  (13, 3),
  (13, 4),
  (14, 1),
  (15, 2),
  (15, 3),
  (16, 1),
  (16, 2),
  (16, 3),
  (17, 1),
  (18, 1),
  (19, 1),
  (20, 1),
  (21, 1),
  (22, 1),
  (23, 1),
  (24, 1),
  (25, 3),
  (26, 3),
  (27, 1),
  (28, 1),
  (29, 4),
  (30, 1),
  (31, 1),
  (32, 2),
  (33, 1),
  (34, 2),
  (35, 1),
  (36, 1),
  (37, 1),
  (38, 3),
  (38, 4),
  (39, 1),
  (40, 1),
  (40, 3),
  (41, 4),
  (42, 3),
  (43, 1),
  (44, 1),
  (44, 2),
  (44, 3),
  (45, 1),
  (46, 2),
  (47, 1),
  (48, 1),
  (49, 1),
  (50, 1),
  (51, 1),
  (52, 1),
  (53, 1),
  (54, 1),
  (55, 1),
  (56, 4),
  (57, 1),
  (58, 1),
  (59, 1),
  (60, 1),
  (61, 1),
  (62, 4),
  (63, 4),
  (64, 4),
  (65, 4),
  (66, 4),
  (67, 4),
  (68, 1),
  (69, 1),
  (70, 1),
  (71, 4),
  (72, 1),
  (73, 2),
  (74, 3),
  (75, 3),
  (76, 3),
  (77, 3),
  (78, 2),
  (79, 2);

INSERT INTO MembersGames (MemberID, ReleaseID)
VALUES
  (1, 47),
  (1, 51),
  (1, 37),
  (1, 75),
  (1, 54),
  (1, 90),
  (1, 91),
  (1, 60),
  (1, 63),
  (1, 45),
  (2, 45),
  (2, 31),
  (2, 3),
  (2, 54),
  (2, 15),
  (2, 58),
  (2, 37),
  (3, 37),
  (3, 15),
  (3, 8),
  (3, 58),
  (3, 36),
  (3, 52),
  (4, 37),
  (4, 64),
  (4, 65),
  (4, 67),
  (4, 80),
  (4, 81),
  (5, 81),
  (5, 37),
  (5, 45),
  (5, 3),
  (5, 85),
  (6, 81),
  (6, 85),
  (6, 89),
  (6, 87),
  (6, 7),
  (6, 60),
  (6, 61),
  (7, 36),
  (7, 44),
  (7, 52),
  (7, 25),
  (8, 49),
  (8, 51),
  (8, 68),
  (8, 48),
  (8, 15),
  (8, 54),
  (8, 31),
  (9, 70),
  (9, 71),
  (9, 72),
  (9, 35),
  (9, 90),
  (9, 91),
  (9, 54),
  (9, 37),
  (9, 47),
  (10, 68),
  (10, 7),
  (10, 28),
  (10, 3),
  (10, 43);

INSERT INTO MemberInClub (MemberID, ClubID)
VALUES
  (1, 1),
  (9, 1),
  (1, 5),
  (2, 5),
  (3, 5),
  (4, 5),
  (5, 5),
  (9, 5),
  (2, 2),
  (8, 2),
  (10, 2),
  (1, 3),
  (2, 3),
  (8, 3),
  (9, 3),
  (2, 4),
  (3, 4),
  (8, 4),
  (1, 6),
  (4, 6),
  (5, 6),
  (6, 6),
  (3, 7),
  (7, 7);

CREATE OR REPLACE VIEW GamesMembersOwn
  (MemberName, GameTitle, GameGenre)
AS
  SELECT  concat(FirstName, ' ', LastName), GameTitle, GenreType
  FROM    Members
    JOIN  MembersGames
      USING (MemberID)
    JOIN  GamesOnSystems
       USING (ReleaseID)
    JOIN  Games
       USING (GameID)
    JOIN  Genres
      USING (GenreID);

  CREATE OR REPLACE VIEW MembersAndClubs
    (MemberName, ClubGame, ClubGenre)
  AS
    SELECT concat(FirstName, ' ', LastName), GameTitle, GenreType
    FROM Members
      JOIN MemberInClub
        USING (MemberID)
      JOIN Clubs
        USING (ClubID)
      LEFT JOIN Games
        ON PrimaryGame = GameID
      LEFT JOIN Genres
        ON PrimaryGenre = Genres.GenreID;
