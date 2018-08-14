SELECT date.id
	, date.expression 
	, CONCAT('/repositories/', archival_object.repo_id, '/archival_objects/', archival_object.id) AS URI 
	, archival_object.title AS component_title 
	, resource.title AS resource_title
	, resource.ead_id
	, resource.identifier
	, archival_object.repo_id
	, date.begin
	, date.end 
FROM archival_object 
LEFT JOIN date on archival_object.id=date.archival_object_id
LEFT JOIN resource on archival_object.root_record_id=resource.id
#WHERE date.begin LIKE '1950%'
#AND date.end LIKE '1955%'
#WHERE date.expression IS NOT NULL
#AND date.begin IS NULL
#AND date.end IS NULL