use tournament;
delimiter //
create procedure points_update()
begin
declare v_finished int default 0;
declare id int;
declare win int;
declare c1 cursor for select team_id,total_win from Team;
declare continue handler for not found set v_finished=1;
open c1;
a: loop
fetch c1 into id,win;
if v_finished=1 then 
leave a;
end if;
update Team
set team_points = win * 2
where team_id = id;
end loop a;
close c1;
end;
//
create trigger after_update
after update 
on Matches for each row
begin 
update Team
set total_win = total_win + 1
where team_name = new.winner;
update Team
set total_lose = total_lose + 1
where team_name = new.looser;
call points_update();
end;
//
