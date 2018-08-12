#Get count of accession processing status

SELECT ev.value as processing_status
	, COUNT(ev.value) as count
FROM collection_management cm
JOIN accession on cm.accession_id = accession.id
LEFT JOIN enumeration_value ev on ev.id = cm.processing_status_id
GROUP BY ev.value