use tournament;
create table User(
user_id int(10) primary key,
user_name varchar(20),
user_password varchar(20),
user_email varchar(20));
create table Team(
team_id int primary key,
team_name varchar(40),
total_win int,
total_lose int,
team_points int);
create table Matches(
match_id int primary key,
team_id1 int,
team_id2 int,
date date,
time time,
stadium varchar(20),
winner varchar(40),
looser varchar(40),
foreign key (team_id1) references Team(team_id) on delete cascade on update cascade,
foreign key (team_id2) references Team(team_id) on delete cascade on update cascade);
create table Ticket_Book(
ticket_id int(10) primary key,
match_id int,
user_id int,
no_of_tickets int,
foreign key (match_id) references Matches(match_id) on delete cascade on update cascade,
foreign key (user_id) references User(user_id) on delete cascade on update cascade);
create table Player(
player_id int(10) primary key,
player_name varchar(20),
team_id int,
no_of_matches int,
role varchar(20),
foreign key (team_id) references Team(team_id) on delete cascade on update cascade);
create table Batsman(
player_id int,
role varchar(20),
bat_avg float(3),
total_runs int,
foreign key (player_id) references Player(player_id) on delete cascade on update cascade);
create table Bowler(
player_id int,
role varchar(20),
economy float(3),
total_wickets int,
foreign key (player_id) references Player(player_id) on delete cascade on update cascade);
create table Wicketkeeper(
player_id int,
role varchar(20),
total_catches int,
foreign key (player_id) references Player(player_id) on delete cascade on update cascade);
create table Coach(
coach_id int primary key,
team_id int,
coach_name varchar(20),
foreign key (team_id) references Team(team_id) on delete cascade on update cascade);
create table Captain(
captain_id int primary key,
player_id int,
team_id int,
player_name varchar(20),
total_win_captain int,
last_captaincy_year int(5),
foreign key (team_id) references Team(team_id) on delete cascade on update cascade,
foreign key (player_id) references Player(player_id) on delete cascade on update cascade);
create table User_log(
user_id int,
ticket_id int,
no_of_tickets int,
action varchar(20),
foreign key (user_id) references User(user_id));
