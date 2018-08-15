SELECT DISTINCT resource.title as title
    , CONCAT('/repositories/', resource.repo_id, '/resources/', resource.id) as URI
    , rr.restriction_note_type
    , rr.begin
    , rr.end
FROM note_persistent_id npi
JOIN note on note.id = npi.note_id
JOIN resource on resource.id = note.resource_id
JOIN rights_restriction rr on rr.resource_id = resource.id
WHERE rr.end > '2016-01-01'
AND rr.restriction_note_type LIKE 'accessrestrict'