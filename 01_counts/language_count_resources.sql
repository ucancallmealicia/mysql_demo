#Get language counts for resource records

SELECT ev.value as language
	, COUNT(ev.value) as count
FROM resource
LEFT JOIN enumeration_value ev on ev.id = resource.language_id
GROUP BY ev.value
ORDER BY count DESC