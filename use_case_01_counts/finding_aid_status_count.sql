#Get finding aid status for all resources

SELECT ev.value as finding_aid_status
	, COUNT(ev.value) as count
FROM resource
LEFT JOIN enumeration_value ev on ev.id = resource.finding_aid_status_id
GROUP BY ev.value