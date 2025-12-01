-- Match evidence with movements and claims
SELECT 
    emp.name AS suspect_name,
    k.room AS actual_location,
    a.claimed_location,
    a.claim_time,
    ev.description AS evidence_found,
    ev.found_time AS evidence_found_time
FROM evidence ev
JOIN keycard_logs k
    ON ev.room = k.room
JOIN employees emp
    ON k.employee_id = emp.employee_id
LEFT JOIN alibis a
    ON k.employee_id = a.employee_id
WHERE ev.room = 'CEO Office'
  AND k.entry_time <= ev.found_time
  AND k.exit_time >= '2025-10-15 20:50:00';  


