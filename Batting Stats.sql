-- Most wins
select winner,count(winner) as 'Most wins'
from match_schedule_results
group by Winner
order by count(winner) desc;
-- MOst MAtches played at a venue
select venue,count(match_no)
from match_schedule_results
group by venue
order by count(match_no) desc;
-- most Runs scored at a venue
select match_schedule_results.Venue,sum(batting_summary.Runs) as Runs
from match_schedule_results
inner join batting_summary on match_schedule_results.Match_no=batting_summary.Match_no
group by match_schedule_results.venue order by sum(batting_summary.Runs) desc;
-- Most Runs
select Batsman_Name ,Team_Innings as Country,sum(Runs) as Runs
from batting_summary
group by Batsman_Name,Team_Innings
order by sum(Runs) desc;
-- Most 6
select Batsman_Name ,Team_Innings as Country,sum(6s) as Sixes
from batting_summary
group by Batsman_Name,Team_Innings
order by sum(6s) desc;
-- Most 4
select Batsman_Name ,Team_Innings as Country,sum(4s) as Fours
from batting_summary
group by Batsman_Name,Team_Innings
order by sum(4s) desc;
-- best strike rate
select Batsman_Name,Team_Innings, ((sum(Runs)/sum(Balls))*100) as Srikerate
from batting_summary
group by Batsman_Name,Team_Innings having sum(Balls) >= 100
order by ((sum(Runs)/sum(Balls))*100) desc;
-- Most Centuries
SELECT Batsman_Name,Team_Innings,COUNT(*) AS centuries_count
FROM batting_summary
WHERE runs >= 100
group by Batsman_Name,Team_Innings
order by COUNT(*) desc;
-- Most Half centuries
SELECT Batsman_Name,Team_Innings,COUNT(*) AS halfcenturies_count
FROM batting_summary
WHERE runs between 50 and 99
group by Batsman_Name,Team_Innings
order by COUNT(*) desc;
-- Best Average
select Batsman_Name ,Team_Innings as Country,avg(Runs) as Runs
from batting_summary
group by Batsman_Name,Team_Innings 
order by avg(Runs) desc;
-- Most runs in a match
select distinct Match_Between,sum(Runs)
from batting_summary
group by Match_Between
order by sum(Runs) desc limit 3;
-- Highest Strike rate
select Batsman_Name,Team_Innings,(sum(Runs)/sum(Balls))*100 as StrikeRate
from batting_summary
group by Batsman_Name,Team_Innings
order by StrikeRate desc;