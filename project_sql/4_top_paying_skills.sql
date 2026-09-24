/*  question: what are the top skills based on salary?
- look at the avarage salary associated with each skill for data analyst postion
 -focuses on roles with specified salaries ,regardless of location
 why? it reveals how diffrent skills impact salary levels for data analyst
 and help indetify the most financially rewarding skills to acquire or improve
 */

select    skills,
       round(avg(salary_year_avg), 0) as avg_salary
from 
       job_postings_fact
inner JOIN
       skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
inner JOIN
       skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
      
where 
     job_title_short = 'Data Analyst' 
    and salary_year_avg is not null 
 and job_work_from_home = 'True'
 group by  skills
order BY  avg_salary desc
limit 25


/*
Breakdown of Top-Paying Data Analyst Skills
Data Engineering & Big Data: PySpark, Databricks, Airflow, PostgreSQL
Python & Machine Learning: Pandas, NumPy, Jupyter, Scikit-learn, DataRobot, Watson
Cloud & DevOps: GCP, Kubernetes, GitLab, Jenkins, Bitbucket

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]

*/