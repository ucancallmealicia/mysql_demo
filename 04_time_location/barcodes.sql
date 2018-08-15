    SELECT DISTINCT tc.barcode AS barcode
        , resource.identifier as collection_identifier
        , resource.title AS collection_title
        , cp.name AS container_profile
        , tc.indicator AS container_number
    FROM sub_container sc
    left join enumeration_value on enumeration_value.id = sc.type_2_id
    join top_container_link_rlshp tclr on tclr.sub_container_id = sc.id
    join top_container tc on tclr.top_container_id = tc.id
    left join top_container_profile_rlshp tcpr on tcpr.top_container_id = tc.id
    left join container_profile cp on cp.id = tcpr.container_profile_id
    left join instance on sc.instance_id = instance.id
    left join archival_object ao on instance.archival_object_id = ao.id
    left join resource on ao.root_record_id = resource.id
    WHERE tc.barcode in ('39002104891859','39002104891867','39002104891875','39002104891883')