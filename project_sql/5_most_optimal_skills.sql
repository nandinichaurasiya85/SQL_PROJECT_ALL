/* question: what are the most optimal skills for data analyst(high demand and high skills?
-indentify skills in high demand and associated with hight avarage salaries for data analyst roles
-concentrates on remote positions with specified salaries 
-why? targets skills that offer job security (high demand) and financial benefits(high salaries),
offering strategic insights for career development in data analysis */




with skill_demand as(  
     select 
     skills_dim.skill_id,skills_dim.skills,
      count(skills_job_dim.job_id) as demand_count
     from job_postings_fact 
     INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
     INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
     where
     job_postings_fact.job_title_short = 'Data Analyst' and
       job_postings_fact.job_location = 'Anywhere' 
       and salary_year_avg is not null 
     group by  skills_dim.skill_id
), avarage_salary as(
     select   skills_job_dim.skill_id, 
       round(avg(salary_year_avg), 0) as avg_salary
    from 
       job_postings_fact
    inner JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
     inner JOIN  skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
      where 
     job_title_short = 'Data Analyst' 
    and salary_year_avg is not null 
     and job_work_from_home = 'True'
     group by   skills_job_dim.skill_id
)

select 
    skill_demand.skill_id,skill_demand.skills,skill_demand.demand_count,avarage_salary.avg_salary
from skill_demand
INNER JOIN avarage_salary ON skill_demand.skill_id = avarage_salary.skill_id
 where demand_count >10 
order by 
  avarage_salary.avg_salary desc,
   skill_demand.skills desc
limit 25

/*Most Optimal Skills — Demand + Salary
Python — 236 demand, $101,397 average salary → strongest balance of high demand and good pay.
Tableau — 230 demand, $99,288 average salary → high demand with solid compensation.
R — 148 demand, $100,499 average salary → strong demand and competitive salary.


[
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "avg_salary": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "avg_salary": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "avg_salary": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "101414"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "16",
    "avg_salary": "99936"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "13",
    "avg_salary": "99631"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "14",
    "avg_salary": "99171"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "13",
    "avg_salary": "99077"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "11",
    "avg_salary": "98958"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587"
  }
]  */