DROP DATABASE IF EXISTS test;  #change database name

CREATE DATABASE IF NOT EXISTS test;  #change as well

USE test; 

CREATE TABLE IF NOT EXISTS test.Members(
	MemberID 	INT PRIMARY KEY	AUTO_INCREMENT	NOT NULL ,
	FirstName 	VARCHAR(15) 					NOT NULL,
	LastName 	VARCHAR(15) 					NOT NULL,
	Phone 		VARCHAR(10) 					NULL,
	Email 		VARCHAR(45) 					NULL
);


#please fix number of members if needed
INSERT INTO Members(FirstName, LastName, Phone, Email)
VALUES
	('Christa', 'Extence', '8185646160', 'cextence0@shinystat.com'),
	('Chalmers', 'Littlefield', '5694738959', 'clittlefield1@stumbleupon.com'),
	('Mirabelle', 'Bedding', '4407423933', 'mbedding2@cdc.gov'),
	('Sheeree', 'Sach', '2793684816', 'ssach3@ocn.ne.jp'),
	('Conni', 'Kilborn', '1111359407', 'ckilborn4@twitpic.com'),
	('Pete', 'Boomes', '2996794851', 'pboomes5@fotki.com'),
	('Frieda', 'Kernocke', '1193437512', 'fkernocke6@reuters.com'),
	('Winna', 'McMyler', '2919031460', 'wmcmyler7@google.de'),
	('Chen', 'Brockhurst', '3547323502', 'cbrockhurst8@earthlink.net'),
	('Markos', 'Dando', '6011157005', 'mdando9@nyu.edu'),  -- 10 Members including this line
	('Bamby', 'Sicha', '4529344634', 'bsichaa@wikimedia.org'),
	('Bradney', 'Piolli', '4597324254', 'bpiollib@ovh.net'),
	('Isabel', 'Lanfear', '2664867212', 'ilanfearc@dion.ne.jp'),
	('Thomasine', 'Greep', '2183223304', 'tgreepd@exblog.jp'),
	('Fairlie', 'Borlease', '4843620378', 'fborleasee@list-manage.com'),
	('Yance', 'Judkins', '3795071958', 'yjudkinsf@discuz.net'),
	('Ruthe', 'Sliney', '8013502005', 'rslineyg@reverbnation.com'),
	('Lynnea', 'Spadelli', '2451536691', 'lspadellih@usgs.gov'),
	('Arlyn', 'Samuel', '9391989453', 'asamueli@wunderground.com'),
	('Shae', 'Auger', '5079652882', 'saugerj@nature.com'),  -- 20 Members including this line
	('Hieronymus', 'Mogie', '6479957366', 'hmogiek@friendfeed.com'),
	('Bjorn', 'Proudman', '1157922546', 'bproudmanl@accuweather.com'),
	('Stephanus', 'Cordel', '7214770092', 'scordelm@qq.com'),
	('Oby', 'Darragh', '9892019198', 'odarraghn@discuz.net'),
	('Almeda', 'Birdsey', '4192875128', 'abirdseyo@yahoo.com'),
	('Benny', 'Winfrey', '2917712526', 'bwinfreyp@webmd.com'),
	('Marve', 'Mandrier', '3434949042', 'mmandrierq@opensource.org'),
	('Nester', 'MacRitchie', '9358253734', 'nmacritchier@squarespace.com'),
	('Jeramie', 'Manicom', '1531858777', 'jmanicoms@google.pl'),
	('Valma', 'Poveleye', '3367947963', 'vpoveleye2r@reference.com'); -- 30 Members