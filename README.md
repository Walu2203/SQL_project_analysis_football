# International Football Match Results (1872–2025)

## Overview

This dataset contains a comprehensive dataset of **47,917 men's international football matches** spanning from the first official match in **1872** up to **2025**. It includes a wide range of competitions: from the FIFA World Cup and continental tournaments to friendlies and lesser-known events like the FIFI Wild Cup.  

> ⚠️ Note: This dataset **excludes** Olympic matches and any games where at least one team was a B-team, U-23, or a league select team.

---

## Dataset Description

The core dataset is stored in `results.csv` and includes the following columns:

| Column         | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| `date`         | Date of the match                                                           |
| `home_team`    | Name of the home team                                                       |
| `away_team`    | Name of the away team                                                       |
| `home_score`   | Full-time score of the home team (including extra time, excluding penalties)|
| `away_score`   | Full-time score of the away team (including extra time, excluding penalties)|
| `tournament`   | Name of the tournament                                                      |
| `city`         | City or administrative area where the match took place                     |
| `country`      | Country where the match took place                                          |
| `neutral`      | Indicates if the match was on neutral ground (`1` for yes, `0` for no)      |


---

## Project Goal: Analyzing Home Advantage in International Football

### Research Question

**Does playing at home significantly influence match outcomes in international football?**

We aim to investigate whether home teams tend to win more often, score more goals, and whether this advantage has evolved over time.

---

## Key Research Questions

1. **What is the overall performance of home teams?**
   - Win/draw/loss percentages
   - Average goals scored by home vs away teams

2. **How has home advantage changed over time?**
   - Comparing performance by decade

3. **Are there tournaments where home advantage is stronger?**
   - Comparing friendlies, qualifiers, and major tournaments (e.g., World Cup)

4. **Which teams perform best at home?**
   - Top 10 countries with the highest home win rate

---

## Files Required for Analysis

- `results.csv` – Primary dataset with match outcomes, venue info, and tournament types

---

## Data source 

Data is from https://www.kaggle.com/ from user Mart Jürisoo
