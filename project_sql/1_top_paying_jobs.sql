/*Question : What are the top paying data analyst jobs ?
- Identify the top 10 highest -paying data analyst roles that are availabes remotely.
-Focuses on job postings with specified salaries (remove nulls ).
-why ? Highlight the top-paying opportunities for data analysts,offering insights into
 employment opportunities */

 
select 
       job_id,
       job_title,
       job_location,
       job_schedule_type,
       salary_year_avg,
       job_posted_date,
       name as company_name
from 
       job_postings_fact
LEFT JOIN
       company_dim ON job_postings_fact.company_id = company_dim.company_id

where 
     job_title_short = 'Data Analyst' and job_location = 'Anywhere'
    and salary_year_avg is not null
order by
      salary_year_avg desc
limit 10



-- do for bussiness analyst 
SELECT
     job_id,
            job_title,
       job_location,
       job_schedule_type,
       salary_year_avg,
       job_posted_date,
       name as company_name
from 
       job_postings_fact
LEFT JOIN
       company_dim ON job_postings_fact.company_id = company_dim.company_id

where 
     job_title_short = 'Business Analyst' and job_location = 'Anywhere'
    and salary_year_avg is not null
order by
      salary_year_avg desc
limit 10






-- for data anayst isights
/*
Breakdown of Highest-Paying Data Analyst Roles
Leadership roles command the highest salaries: Director-level positions such as Director of Analytics ($336.5K) and Director, Data Analyst ($189.3K) appear among the top-paying roles.
Senior/principal roles are highly compensated: Principal Data Analyst positions range from $186K–$205K, showing a strong salary increase with seniority and responsibility.
Specialized analyst roles can also pay exceptionally well: Marketing, AV Performance, Data Insights, and ERM analyst roles in this dataset reach $184K–$232K+, indicating that domain specialization can contribute to higher compensation.



[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20 15:13:33",
    "company_name": "Mantys"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0",
    "job_posted_date": "2023-08-23 12:04:42",
    "company_name": "Meta"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "company_name": "Uclahealthcareers"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "company_name": "Motional"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09 08:01:04",
    "company_name": "Get It Recruit - Information Technology"
  }
]
*/