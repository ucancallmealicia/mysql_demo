#Retrieves all resources created after 6/30/2017

select CONCAT('http://localhost:8080/repositories/', resource.repo_id, '/resources/', resource.id) as url
	, title
	, identifier
	, create_time 
	, created_by
	, last_modified_by
	, user_mtime
	, repo_id
from resource
where create_time > '2017-06-30 00:00:00'
order by create_time desc