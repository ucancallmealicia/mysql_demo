#How many top containers are in each location?

SELECT location.title
	, COUNT(location.title) as count
FROM top_container tc
LEFT JOIN top_container_housed_at_rlshp tchar on tchar.top_container_id = tc.id
LEFT JOIN location on tchar.location_id = location.id
GROUP BY location.title
ORDER BY count DESC