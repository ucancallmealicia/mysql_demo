select DISTINCT tc.barcode
	, tc.indicator
    , cp.name
    , tc.create_time
    , tc.created_by
    , resource.title
#    , ao.title
FROM top_container tc
JOIN top_container_profile_rlshp tcpr on tcpr.top_container_id = tc.id
JOIN container_profile cp on cp.id = tcpr.container_profile_id
JOIN top_container_link_rlshp tclr on tclr.top_container_id = tc.id
JOIN sub_container sc on sc.id = tclr.sub_container_id
JOIN instance on instance.id = sc.instance_id
LEFT JOIN archival_object ao on instance.archival_object_id = ao.id
LEFT JOIN resource on resource.id = ao.root_record_id
WHERE tc.repo_id = 12
AND tc.create_time > '2017-06-30 11:59:00'
AND cp.id = 14