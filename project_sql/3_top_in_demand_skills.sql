
SELECT 
      s.skills,
      count(sjd.job_id) as count_of_job_postings  
FROM
       job_postings_fact j
JOIN   skills_job_dim sjd ON j.job_id = sjd.job_id
JOIN
       skills_dim s ON sjd.skill_id = s.skill_id
WHERE job_title_short = 'Data Analyst' AND
      job_work_from_home = 'True'
GROUP BY
       s.skills
ORDER BY 
       count(sjd.job_id) DESC
LIMIT 5