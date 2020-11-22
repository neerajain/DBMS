use tournament;
insert into Team values(101,"Mumbai Indians",0,0,0),(102,"Royal Chalengers Banglore",0,0,0),(103,"Delhi Capitals",0,0,0),(104,"Rajasthan Royals",0,0,0);
insert into Matches(match_id,team_id1,team_id2,date,time,stadium) values(1000,101,102,"2020-10-20","19:30:00","Wankhede,Mum");
select * from Team;
select * from Matches;
update Matches
set winner="Royal Chalengers Banglore",looser="Mumbai Indians"
where match_id=1000;
