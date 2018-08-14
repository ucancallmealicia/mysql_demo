#Gets all components of a collection, without physical control data

SELECT resource.id 
	, resource.identifier
	, resource.title as resource_title
	, ao.id as ao_id
	, ao.display_string as ao_title
	, ev.value as level
FROM archival_object ao
JOIN resource on ao.root_record_id = resource.id
LEFT JOIN enumeration_value ev on ev.id = ao.level_id
WHERE resource.id = 4223
#WHERE resource.id = 4556
ORDER BY ao.id