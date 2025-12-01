-- Step 6: Combine all findings to identify the killer
SELECT e.name AS killer
FROM employees e
JOIN keycard_logs k ON e.employee_id = k.employee_id
JOIN alibis a ON e.employee_id = a.employee_id
JOIN calls c ON e.employee_id = c.caller_id
WHERE k.room = 'CEO Office'
  AND k.entry_time <= '2025-10-15 21:05:00'
  AND k.exit_time >= '2025-10-15 20:50:00'
  AND a.claim_time BETWEEN k.entry_time AND k.exit_time
  AND a.claimed_location != k.room
  AND c.call_time BETWEEN '2025-10-15 20:50:00'
                       AND '2025-10-15 21:05:00';



      