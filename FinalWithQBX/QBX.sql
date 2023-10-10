--QB1--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--1.) Shows Behavioral merit above 3
select * from BehvioralMerit
where Merit >3;

--2.) Shows if merit are lower than 3
select * from BehvioralMerit
where Merit <3;

--.3) Searching for Carrie
select * from Players 
where firstname = 'Carrie';

--4.) looking for scores in between 60 and 30
select * from rankingpeople
where score <= 80 and score >= 30;

--5.) looking for teamnames
select * from teamname
where teamnames = 'GG' ;

--6.) Looking for roomNum
select * from RoomNum
where roomid = '1';


 --QB2--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
select * from behvioralmerit;

--1.) Showing their scores and what team they are in
Select r.score Score, t.firstname, t.teamnames
from teamname as t, rankingpeople as r
where t.id = r.id;

--.2) Displaying what team that they players are in and all their info
select * 
from Players as p, Teamname as t
where p.id = t.id;

--3.)Displaying Players aand room number they are assigned to
select m.lastname, m.roomid
from MatchStarting as m, roomnum as r
where m.roomid = r.roomid and m.lastname = r.lastname;

--4.) Displaying Score/Merits at the same table
select b.firstname, b.lastname, r.score, b.merit, b.reason
from BehvioralMerit as b, rankingpeople as r
where r.id = b.id;

--5.) Display Last name with score and merit=
select b.lastname, r.score, b.merit
from BehvioralMerit as b, rankingpeople as r
where r.id = b.id;

--6.) what time does each team memeber start
select t.teamnames,t.firstname, m.MatchStarts
from teamname as t, matchstarting as m
where t.id = m.id;




--3 Basic Aggregates QB3||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--1.)How many Players are attending 
Select count(Merit) As NumberOfPlayer
from BehvioralMerit;


--2.)How many Players are attending 
Select SUM(merit) As AddingMerits
from BehvioralMerit;

--3.)Average amount of Merits
Select AVG (merit) as AvgMerits
from BehvioralMerit;

--3 Aggregates with condtions QB4||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

--1.) Adding Total score amount
SELECT sum(r.Score) As ScoreCount, t.teamnames
FROM Rankingpeople as r, teamname as t 
where r.score >= 0 and t.id = r.id
GROUP BY t.teamnames;

--2.)Average Amount Of Score
SELECT avg(r.Score) As ScoreCount, t.teamnames
FROM Rankingpeople as r, teamname as t 
where r.score >= 0 and t.id = r.id
GROUP BY t.teamnames;


--3.) Will display if Score is higher than the Average amount
select * from rankingpeople
where score > (select avg(score) from rankingpeople)

--QB5 batch ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

--1.)Will combine 2 players of the same team, and see if they have more than  or equal to 70 points
Select avg(r.score) as Score, t.teamnames
from teamname as t, rankingpeople as r
where t.id = r.id
group by t.teamnames
having avg(r.score) >= 70;


--2.) Same thing as Above but this time if its between 80 and 70
Select avg(r.score) as Score, t.teamnames
from teamname as t, rankingpeople as r
where t.id = r.id
group by t.teamnames
having avg(r.score) <= 80 and avg(r.score) >= 70;

--3.) Showing How many people attended the last event
Select Count(ID), LastEvents
From Players
Group By LastEvents
Order By Count(ID) Desc;


--4.)Adding up the score amount and seeing which team has the highest score
Select sum(r.score) as Sums, t.teamnames
from teamname as t, rankingpeople as r
where t.id = r.id
group by t.teamnames
having sum(r.score) > 0;