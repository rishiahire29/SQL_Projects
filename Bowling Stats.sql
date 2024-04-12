-- Most wickets 
select Bowler_Name,Bowling_Team,sum(Wickets) as Wickets
from bowling_summary
group by Bowler_Name,Bowling_Team
order by sum(Wickets) desc;
-- Most Maidens
select Bowler_Name,Bowling_Team,sum(Maidens) as Maidens
from bowling_summary
group by Bowler_Name,Bowling_Team
order by sum(Maidens) desc;
-- least runs
select Bowler_Name,Bowling_Team,sum(Runs) as Runs
from bowling_summary
group by Bowler_Name,Bowling_Team having sum(Overs) >=20
order by sum(Runs) ;
-- Most overs
select Bowler_Name,Bowling_Team,sum(Overs) as overs
from bowling_summary
group by Bowler_Name,Bowling_Team
order by sum(Overs) desc;
-- Best Economy
select Bowler_Name,Bowling_Team,format(avg(Economy),2) as Economy
from bowling_summary
group by Bowler_Name,Bowling_Team having sum(Overs)>= 30
order by avg(Economy) ;
-- Most 4 wickets 
select Bowler_Name,Bowling_Team,count(*) as 4Wickets
from bowling_summary
where Wickets >= 4
group by Bowler_Name,Bowling_Team 
order by count(*) desc;
-- Most 4 wickets 
select Bowler_Name,Bowling_Team,count(*) as 5Wickets
from bowling_summary
where Wickets >= 5
group by Bowler_Name,Bowling_Team 
order by count(*) desc;
-- most wickets taken at venue
select match_schedule_results.Venue,sum(bowling_summary.Wickets) as Wickets
from match_schedule_results
inner join bowling_summary on match_schedule_results.Match_no=bowling_summary.Match_no
group by match_schedule_results.venue order by sum(bowling_summary.Wickets) desc;