SELECT CONCAT('/repositories/', resource.repo_id, '/resources/', resource.id) AS uri
	, ev2.value as extent_type
    , e.container_summary
	, ev.value as portion
	, e.number
    , e.physical_details
    , e.dimensions
    , resource.title as title
FROM resource
JOIN extent e on resource.id = e.resource_id
LEFT JOIN enumeration_value ev on ev.id = e.portion_id
LEFT JOIN enumeration_value ev2 on ev2.id = e.extent_type_id
WHERE resource.repo_id = 6
UNION ALL
SELECT CONCAT('/repositories/', accession.repo_id, '/accessions/', accession.id) AS uri
	, ev2.value as extent_type
    , e.container_summary
	, ev.value as portion
	, e.number
    , e.physical_details
    , e.dimensions
    , accession.title as title
FROM accession
JOIN extent e on accession.id = e.accession_id
LEFT JOIN enumeration_value ev on ev.id = e.portion_id
LEFT JOIN enumeration_value ev2 on ev2.id = e.extent_type_id
WHERE accession.repo_id = 6
UNION ALL
SELECT CONCAT('/repositories/', ao.repo_id, '/archival_objects/', ao.id) AS uri
	, ev2.value as extent_type
    , e.container_summary
	, ev.value as portion
	, e.number
    , e.physical_details
    , e.dimensions
    , ao.title as title
FROM archival_object ao
JOIN extent e on ao.id = e.archival_object_id
LEFT JOIN enumeration_value ev on ev.id = e.portion_id
LEFT JOIN enumeration_value ev2 on ev2.id = e.extent_type_id
WHERE ao.repo_id = 6
UNION ALL
SELECT CONCAT('/repositories/', do.repo_id, '/digital_objects/', do.id) AS uri
	, ev2.value as extent_type
    , e.container_summary
	, ev.value as portion
	, e.number
    , e.physical_details
    , e.dimensions
    , do.title as title
FROM digital_object do
JOIN extent e on do.id = e.digital_object_id
LEFT JOIN enumeration_value ev on ev.id = e.portion_id
LEFT JOIN enumeration_value ev2 on ev2.id = e.extent_type_id
WHERE do.repo_id = 6
UNION ALL
SELECT CONCAT('/repositories/', doc.repo_id, '/digital_object_components/', doc.id) AS uri
	, ev2.value as extent_type
    , e.container_summary
	, ev.value as portion
	, e.number
    , e.physical_details
    , e.dimensions
    , doc.title as title
FROM digital_object_component doc
JOIN extent e on doc.id = e.digital_object_component_id
LEFT JOIN enumeration_value ev on ev.id = e.portion_id
LEFT JOIN enumeration_value ev2 on ev2.id = e.extent_type_id
WHERE doc.repo_id = 6
-- UNION ALL
-- SELECT ev.value as portion
-- 	, e.number
-- 	, ev2.value as extent_type
--     , e.container_summary
--     , e.physical_details
--     , e.dimensions
--     , deaccession.id as title
--     , NULL as uri
-- FROM deaccession
-- JOIN extent e on deaccession.id = e.deaccession_id
-- LEFT JOIN enumeration_value ev on ev.id = e.portion_id
-- LEFT JOIN enumeration_value ev2 on ev2.id = e.extent_type_id