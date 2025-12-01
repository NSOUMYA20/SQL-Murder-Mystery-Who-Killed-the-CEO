-- Identify where and when the crime happened. 
SELECT 
   room AS evidence_room, 
   description AS evidence_found,
   found_time AS evidence_found_time
FROM evidence
WHERE room = 'CEO Office'; 

