-- Cross-check alibis with actual logs
SELECT 
   a.employee_id AS suspect_id,
   e.name AS suspect_name,
   a.claim_time,
   a.claimed_location,
   COALESCE(k.room,'No log recorded') AS actual_location
FROM alibis a
LEFT JOIN keycard_logs k 
ON a.employee_id = k.employee_id
AND a.claim_time BETWEEN k.entry_time AND k.exit_time
JOIN employees e
ON a.employee_id = e.employee_id
WHERE k.room != a.claimed_location 
   OR k.room IS NULL; 





