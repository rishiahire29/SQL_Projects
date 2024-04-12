-- Total Matches
select count(Match_no) as 'Total Matches'
from match_schedule_results;
-- Total Runs
select sum(Runs) as 'total runs'
from batting_summary;
-- Total sixes
select sum(6s) as 'Total Sixes'
from batting_summary;
-- Total Fours
select sum(4s) as 'Total Fours'
from batting_summary;
-- total overs
select sum(Overs) as 'Total Overs'
from bowling_summary;
-- Total Wickets
select sum(Wickets) as 'Total Wickets'
from bowling_summary;
-- Total Maidens
select sum(Maidens) as 'Total Maidens'
from bowling_summary;