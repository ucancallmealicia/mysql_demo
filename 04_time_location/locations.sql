SELECT DISTINCT resource.identifier AS resource_identifier
    , resource.title AS resource
 	, cp.name AS container_profile
    , tc.indicator AS container_num
	, tc.barcode AS barcode
    , location.title as location
    , repository.name as repository
from sub_container sc
join top_container_link_rlshp tclr on tclr.sub_container_id = sc.id
join top_container tc on tclr.top_container_id = tc.id
join top_container_housed_at_rlshp tchar on tchar.top_container_id = tc.id
join location on tchar.location_id = location.id
left join top_container_profile_rlshp tcpr on tcpr.top_container_id = tc.id
left join container_profile cp on cp.id = tcpr.container_profile_id
left join instance on sc.instance_id = instance.id
left join archival_object ao on instance.archival_object_id = ao.id
left join resource on ao.root_record_id = resource.id
left join repository on repository.id = resource.repo_id
WHERE location.title LIKE '%B57-A%'
AND ao.id is not null
ORDER BY resource.title