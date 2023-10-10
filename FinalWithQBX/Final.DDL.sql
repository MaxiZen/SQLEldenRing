--Ricardo Juarez CSC315 Projects
CREATE TABLE Players(ID Varchar(30) Primary key,
FirstName varchar(30)  ,
LastName varchar(30) ,
Address varchar(30)NOT NULL , 
LastEvents Varchar(40)NOT NULL );
Create Table MatchStarting (ID Varchar(30)NOT NULL REFERENCES Players(ID) ,
RoomID varchar(30) NOT NULL , 
FirstName varchar(30), 
LastName varchar(30) ,
MatchStarts time NOT NULL);
Create Table RoomNum (RoomID varchar(30)NOT NULL,
FirstName varchar(30),
LastName varchar(30));
Create Table BehvioralMerit (Merit int NOT NULL,
ID varchar(30) NOT NULL REFERENCES Players(ID), 
FirstName varchar(30),
LastName varchar(30), 
Reason varchar (40) );
Create table RankingPeople(FirstName varchar(30),
LastName varchar(30),
ID varchar(30)NOT NULL REFERENCES Players(ID),
Score int );
Create table Teamname (FirstName varchar(30),
LastName varchar(30),
ID Varchar(30) NOT NULL REFERENCES Players(ID),
teamnames varchar(40) not null);


--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
drop table BehvioralMerit;
drop table RoomNum;
drop table matchstarting;
drop table players;
drop table rankingpeople;
drop table teamname;

--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
select * from teamname;

select * from rankingpeople;

select * from RoomNum;

select * from matchstarting;

select * from players;