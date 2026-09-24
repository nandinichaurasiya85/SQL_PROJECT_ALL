/* find the count of the number of remote job postings per skill 
-display the top 5 skills by their demand in remote jobs 
- include the skill_id, name ,count of postings requiring the skill*?
*/


select 
      remote_jobs_skills.skill_id,
      skills_dim.skills as skill_name,
     remote_jobs_skills.skill_count 
from(
     SELECT 
         skill_id,
          count(*) as skill_count
     FROM skills_job_dim
     INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
     where  
      job_postings_fact.job_title_short ='Data Analyst'
      and job_postings_fact.job_location = 'Anywhere'and 
      job_postings_fact.job_work_from_home = 'True'
     GROUP BY skill_id
    
 ) as remote_jobs_skills
 INNER JOIN
 skills_dim ON skills_dim.skill_id = remote_jobs_skills.skill_id
 ORDER BY remote_jobs_skills.skill_count DESC
  LIMIT 5


  /*
  quetions : what are the most in demand skills for data analysts?
  -join job postings to inner jobs table similar to query 2
  -identify the top 5 in demand skills fordat analyst.
  focus on all jobs posting .
  -why ? retrieves the top 5skills with highest demand in the job market ,
  providing insights into the most valuable skills for job seekers.
*/


select 
     skills, count(skills_job_dim.job_id) as demand_count
from job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where
     job_postings_fact.job_title_short = 'Data Analyst' and
       job_postings_fact.job_location = 'Anywhere'
group by skills
order by demand_count desc
limit 5



/*Breakdown of Most In-Demand Data Analyst Skills
SQL dominates demand with 7,291 job postings, making it the most frequently requested skill.
Excel and Python follow with 4,611 and 4,330 postings, showing strong demand for both spreadsheet and programming skills.
Tableau and Power BI appear in 3,745 and 2,609 postings, highlighting the importance of data visualization and BI tools.

[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]

*/