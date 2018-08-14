/* SELECT *
FROM archival_object ao
LIMIT 10000 */

/* SELECT id
	, title
FROM archival_object
LIMIT 10000 */

SELECT CONCAT('http://localhost:8080/repositories/', repo_id, '/archival_objects/', id) as uri
	, title
FROM archival_object
LIMIT 10000

/* SELECT ao.id
	, ao.title
	, ev.value as level
FROM archival_object ao
LEFT JOIN enumeration_value ev on ev.id = ao.level_id
LIMIT 10000 */

/* SELECT ao.id
	, ao.title
	, date.begin
	, date.end
	, date.expression
FROM archival_object ao
LEFT JOIN date on date.archival_object_id = ao.id */

/* SELECT ao.id
	, ao.title
	, date.begin
	, date.end
	, date.expression
FROM archival_object ao
JOIN date on date.archival_object_id = ao.id */

/* SELECT date.expression
	, date.begin
	, date.end
	, resource.title as resource_title
	, resource.id
	, ao.title as ao_title
FROM date
JOIN resource on date.resource_id = resource.id
JOIN archival_object ao on date.archival_object_id = ao.id */

/* SELECT date.expression
	, date.begin
	, date.end
	, resource.title as resource_title
	, resource.id
#	, ao.title as ao_title
FROM resource
JOIN date on date.resource_id = resource.id
#JOIN archival_object ao on date.archival_object_id = ao.id */

/* SELECT date.expression
	, date.begin
	, date.end
	, resource.title as resource_title
	, resource.id
#	, ao.title as ao_title
FROM resource
LEFT JOIN date on date.resource_id = resource.id
#JOIN archival_object ao on date.archival_object_id = ao.id */