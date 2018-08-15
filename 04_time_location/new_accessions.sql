select CONCAT('http://localhost:8080/repositories/', accession.repo_id, '/accessions/', accession.id) as uri
	, accession.title
	, accession.accession_date
	, identifier
	, accession.create_time 
	, accession.created_by
	, accession.last_modified_by
	, accession.user_mtime
	, repository.name
from accession
join repository on repository.id = accession.repo_id
where accession.accession_date between '2016-01-01 00:00:00' and '2016-12-31 00:00:00'
order by accession.accession_date desc 