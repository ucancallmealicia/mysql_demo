#Get a distinct box list for a collection

SELECT DISTINCT resource.id
	, resource.identifier
	, resource.title
	, tc.barcode as barcode
	, tc.indicator as box_num
FROM sub_container sc
JOIN top_container_link_rlshp tclr on tclr.sub_container_id = sc.id
JOIN top_container tc on tclr.top_container_id = tc.id
JOIN instance on sc.instance_id = instance.id
JOIN archival_object ao on instance.archival_object_id = ao.id
JOIN resource on ao.root_record_id = resource.id
#add container profile, other data
WHERE resource.id = 4556