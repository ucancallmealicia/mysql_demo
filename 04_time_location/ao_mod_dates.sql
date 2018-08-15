select resource.identifier
	, resource.title as resource_title
	, resource.last_modified_by as resource_mod_by
	, resource.user_mtime as resource_mod_date
	, ao.last_modified_by as ao_mod_by
	, ao.user_mtime as ao_mod_date
	, ev.value as ao_level
	, CONCAT('http://localhost:8080/repositories/', resource.repo_id, '/resources/', resource.id) as resource_url
	, CONCAT('http://localhost:8080/repositories/', ao.repo_id, '/archival_objects/', ao.id) as ao_url
from archival_object ao
join resource on ao.root_record_id = resource.id
left join enumeration_value ev on ev.id = ao.level_id
order by ao_mod_date desc
LIMIT 10000