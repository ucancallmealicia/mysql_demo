SELECT CONCAT('/agents/people/', ap.id) as agent_uri
	, CONCAT('/repositories/', resource.repo_id, '/resources/', resource.id) as resource_uri
    , resource.title
#    , ud.string_2 as bib_id
FROM agent_person ap
LEFT JOIN linked_agents_rlshp lar on lar.agent_person_id = ap.id
LEFT JOIN resource on resource.id = lar.resource_id
#LEFT JOIN user_defined ud on ud.resource_id = resource.id
WHERE lar.resource_id is not null
#AND ud.string_2 is not null
UNION ALL
SELECT CONCAT('/agents/families/', af.id) as agent_uri
	, CONCAT('/repositories/', resource.repo_id, '/resources/', resource.id) as resource_uri
    , resource.title
#    , ud.string_2 as bib_id
FROM agent_family af
LEFT JOIN linked_agents_rlshp lar on lar.agent_family_id = af.id
LEFT JOIN resource on resource.id = lar.resource_id
#LEFT JOIN user_defined ud on ud.resource_id = resource.id
WHERE lar.resource_id is not null
#AND ud.string_2 is not null
UNION ALL
SELECT CONCAT('/agents/corporate_entities/', ace.id) as agent_uri
	, CONCAT('/repositories/', resource.repo_id, '/resources/', resource.id) as resource_uri
    , resource.title
#    , ud.string_2 as bib_id
FROM agent_corporate_entity ace
LEFT JOIN linked_agents_rlshp lar on lar.agent_corporate_entity_id = ace.id
LEFT JOIN resource on resource.id = lar.resource_id
#LEFT JOIN user_defined ud on ud.resource_id = resource.id
WHERE lar.resource_id is not null
#AND ud.string_2 is not null
UNION ALL
SELECT CONCAT('/agents/software/', asw.id) as agent_uri
	, CONCAT('/repositories/', resource.repo_id, '/resources/', resource.id) as resource_uri
    , resource.title
#    , ud.string_2 as bib_id
FROM agent_software asw
LEFT JOIN linked_agents_rlshp lar on lar.agent_software_id = asw.id
LEFT JOIN resource on resource.id = lar.resource_id
#LEFT JOIN user_defined ud on ud.resource_id = resource.id
WHERE lar.resource_id is not null
#AND ud.string_2 is not null