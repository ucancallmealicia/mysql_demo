select CONCAT('http://localhost:8080/subjects/', subject.id) as uri
	, subject.title
	, subject.authority_id
	, ev.value as source
	, resource.repo_id
	, resource.title
from subject
left join enumeration_value ev on ev.id = subject.source_id
left join subject_rlshp on subject.id = subject_rlshp.subject_id
join resource on resource.id = subject_rlshp.resource_id