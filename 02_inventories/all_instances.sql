#Gets a list of all instances - if there is more than one instance then the archival object info will
#be duplicated. Can easily add location data to this query

SELECT resource.identifier AS resource_identifier
	, resource.title AS resource_title
    , ao.display_string AS ao_title
    , ev2.value AS level
    , tc.barcode AS barcode
	, cp.name AS container_profile
	, tc.indicator AS container_num
    , ev.value AS sc_type
    , sc.indicator_2 AS sc_num
from sub_container sc
LEFT JOIN enumeration_value ev on ev.id = sc.type_2_id
JOIN top_container_link_rlshp tclr on tclr.sub_container_id = sc.id
JOIN top_container tc on tclr.top_container_id = tc.id
JOIN top_container_profile_rlshp tcpr on tcpr.top_container_id = tc.id
JOIN container_profile cp on cp.id = tcpr.container_profile_id
JOIN top_container_housed_at_rlshp tchar on tchar.top_container_id = tc.id
JOIN instance on sc.instance_id = instance.id
JOIN archival_object ao on instance.archival_object_id = ao.id
JOIN resource on ao.root_record_id = resource.id
LEFT JOIN enumeration_value ev2 on ev2.id = ao.level_id
WHERE resource.id = 4223