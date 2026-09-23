/*SELECT 
count(job_id),
EXTRACT(MONTH from job_posted_date at time zone 'UTC' AT TIME ZONE 'America/New_york') as MONTH

from job_postings_fact
--WHERE EXTRACT(YEAR from job_posted_date at time zone 'UTC' AT TIME ZONE 'America/New_york') = 2023

GROUP BY MONTH
ORDER BY MONTH



CREATE table january_jobs as
SELECT *
from job_postings_fact
WHERE EXTRACT(MONTH from job_posted_date)= 1 

CREATE table february_table as
SELECT job_posted_date
from job_postings_fact
WHERE EXTRACT(MONTH from job_posted_date)= 2;

CREATE table March_table as
SELECT job_posted_date
from job_postings_fact
WHERE EXTRACT(MONTH from job_posted_date)= 3 ;

CREATE table april_table as
SELECT job_posted_date
from job_postings_fact
WHERE EXTRACT(MONTH from job_posted_date)= 4 ;

select job_posted_date
from march_table*/


/*WITH company_job_count AS (
    SELECT 
         company_id,
        count(*) AS total_jobs
        FROM job_postings_fact
        GROUP BY company_id
)
select *from job_postings_fact
SELECT name AS company_name
FROM company_dim
LEFT JOIN company_job_count 
ON company_job_count.company_id= company_dim.company_id
ORDER BY company_job_count.company_id DESC*/

/*SELECT  skills as skill_names,
     top_skills.skill_count
FROM (
     SELECT 
         skill_id,
         count(*) skill_count
     FROM skills_job_dim
     GROUP BY skill_id
     order by skill_count desc
     limit 5
) as top_skills
INNER JOIN  skills_dim ON 
top_skills.skill_id =skills_dim.skill_id


SELECT 
    company_id,
    total_jobs,
    CASE 
        WHEN total_jobs < 10 THEN 'Small'
        WHEN total_jobs BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS size_category
FROM (
    -- Subquery to aggregate job counts per company
    SELECT 
        company_id, 
    FROM 
        job_postings_fact -- Replace with your exact table name if different
    GROUP BY 
        company_id
) AS company_job_counts;


*/
-- find the count of number of remote job postings per skill 
  -- display the top 5 skills by their deman is remot job include
   -- skill id ,name ,count of skill 

--with remote_job_skills as (
    --  SELECT
     --      skill_id ,
     --      count(*)  as skill_count
     -- FROM skills_job_dim AS skills_to_job
     -- INNER JOIN  job_postings_fact as job_postings
      -- ON job_postings.job_id=skills_to_job.job_id
      -- WHERE job_postings.job_work_from_home =TRUE
      --GROUP BY skill_id
     -- order by skill_count DESC
     -- limit 5
--)
 --select skills.skill_id,
 --skills.skills as skill_name,
 --skill_count
 --FROM remote_job_skills 
 --INNER JOIN skills_dim as skills ON skills.skill_id=remote_job_skills.skill_id

-- another way is possible from subquery


