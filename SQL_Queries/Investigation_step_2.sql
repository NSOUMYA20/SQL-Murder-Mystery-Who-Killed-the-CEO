-- Analyze who accessed critical areas at the time
SELECT 
   k.employee_id AS suspect_id,
   e.name AS suspect_name,
   k.room,
   k.entry_time,
   k.exit_time
FROM keycard_logs k
JOIN employees e
ON k.employee_id = e.employee_id
WHERE k.room = 'CEO Office'
AND k.entry_time <= '2025-10-15 21:05:00'
AND k.exit_time >= '2025-10-15 20:50:00'; 
