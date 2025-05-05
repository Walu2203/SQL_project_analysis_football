/*
What is the overall performance of home teams?
- Win/draw/loss percentages
*/

with 
winners_team as
	(
	select
		DATE
		,home_team
		,away_team
		,home_score
		,away_score
		,case 
			when home_score = away_score then "draw"
			when home_score > away_score then "home"
			when home_score < away_score then "away"
		end 											                                    as winners
	from results r
	where neutral = 0
	),
winners_game as 
	(
	select 
		winners
		,count(*)										                                    as game
		,(select count(*) from winners_team)			                      as total_games
	from winners_team wt
	group by 1
	)	
select
	winners
	,game
	,round((game * 100)/total_games,1)					                      as percentage_of_winning
from winners_game 
order by 3 desc
	
-- Average goals scored by home vs away teams
select 
	round(avg(home_score),2)							                            as avg_home_score
	,round(avg(away_score),2)						                            	as avg_away_score
from results r 
where neutral = 0


/*
How has home advantage changed over time?
- Comparing performance by decade
 */

with
decade_wins as 
	(
	select
	FLOOR(YEAR(date) / 10) * 10 								as decade
	,SUM(CASE WHEN home_score > away_score THEN 1 ELSE 0 END) 	        as home_wins
	,count(*)													as total_matches
	FROM results
	where neutral = 0
	group by 1
	)
select
	decade
	,home_wins
	,total_matches
	,ROUND(home_wins * 100 / total_matches,1)					                  as home_win_rate
from decade_wins
	

/* 
Are there tournaments where home advantage is stronger?**
- Comparing friendlies, qualifiers, and major tournaments (e.g., FIFA World Cup).
 */

with 
tournament_matches as 
	(
	select 
		tournament
		,count(*)																                        	as total_matches
		,SUM(CASE WHEN home_score > away_score THEN 1 ELSE 0 END) 				as home_wins
	from results r
	where neutral = 0
	group by 1
	),
type as 
	(
	select 
		tournament
		,total_matches
		,home_wins
		,case 
			when tournament like '%qualification' THEN  "Qualification"
			when tournament = 'FIFA World Cup' then "FIFA World Cup"
			when tournament = 'Friendly' then "Friendly"
			ELSE "rest" end 														                  as type_match
	from tournament_matches tm
	)
select 
	type_match
	,sum(total_matches)																                as total_matches
	,sum(home_wins)																	                  as home_wins
	,round(sum(home_wins) * 100 / sum(total_matches),1)								as home_win_rate
from type ty
group by 1
having type_match != "rest"
order by 4 Desc


	
/*
Which teams perform best at home?**
- Top 10 countries with the highest home win rate after more than 100 matches played as hosts.
 */

with
home_team_matches as 
	(
	select 
		home_team
		,count(home_team) 												                      as total_home_team
		,SUM(CASE WHEN home_score > away_score THEN 1 ELSE 0 END) 		  as home_team_win
	from results r 
	where neutral = 0
	group by 1
	)
select 
	home_team
	,total_home_team
	,home_team_win
	,ROUND(home_team_win * 100 / total_home_team,2)						        as home_win_rate
from home_team_matches
where total_home_team > 100
order by 4 desc
limit 10;


-- 
