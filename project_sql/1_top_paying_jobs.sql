SELECT 
j.job_id,
c.name as company_name,
j.job_title,
j.job_location,
j.job_schedule_type,
j.salary_year_avg,
j.job_posted_date
FROM job_postings_fact j
LEFT JOIN
company_dim c
ON
j.company_id = c.company_id
WHERE
job_title_short = 'Data Analyst'
AND
job_location = 'Anywhere'
AND
salary_year_avg IS NOT NULL
ORDER BY
salary_year_avg DESC
LIMIT 10
