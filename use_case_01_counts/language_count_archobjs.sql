#Get language counts for archival_object records

SELECT ev.value as language
	, COUNT(ev.value) as count
FROM archival_object ao
LEFT JOIN enumeration_value ev on ev.id = ao.language_id
GROUP BY ev.value
ORDER BY count DESC