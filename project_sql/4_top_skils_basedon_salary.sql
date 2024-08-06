SELECT 
      s.skills,
      ROUND(avg(salary_year_avg),0) AS yrly_avg_salary  
FROM
       job_postings_fact j
JOIN   skills_job_dim sjd ON j.job_id = sjd.job_id
JOIN
       skills_dim s ON sjd.skill_id = s.skill_id
WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL
GROUP BY
       s.skills
ORDER BY 
       yrly_avg_salary  DESC
LIMIT 25