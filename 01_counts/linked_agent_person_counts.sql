SELECT resource.title
    , count(resource.title) as agent_person_count
FROM agent_person ap
LEFT JOIN linked_agents_rlshp lar on lar.agent_person_id = ap.id
LEFT JOIN resource on resource.id = lar.resource_id
LEFT JOIN user_defined ud on ud.resource_id = resource.id
WHERE lar.resource_id is not null
AND ud.string_2 is not null
GROUP BY resource.title
ORDER BY agent_person_count desc