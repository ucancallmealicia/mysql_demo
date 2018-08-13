# ArchivesSpace Member Forum Demo: Reporting and MySQL

## Getting Started

### Logging in

Need read access to ArchivesSpace or other database - hostname, port, password, username, database name

### SELECT statements

The most basic SQL command. Selects - retrieves records from - one or more columns in one or more tables in a relational database.

### JOINS

Links two related tables using a foreign key as a match point.

### Conditions, filters, etc.

WHERE, LIKE, and other commands allow users to filter data and add conditions to SQL statements.

## Use Case 1: Column Counts

**accession_processing_status_count.sql**

Retrieves a count of each processing status in use in the database.

**container_profile_count.sql**

Retrieves a count of each container profile attached to a top container record. Use this to find out how many of each container type is in use.

**extent_type_count.sql**

Retrieves a count of each extent type. Use this to find out how many of each extent type is in use.

**finding_aid_status_count.sql**

Retrieves a count of each finding aid status.

**language_count_archobjs.sql**

Retrieves a count of languages associated with archival object records.

**language_count_resources.sql**

Retrieves a count of languages associated with resource records.

**location_count.sql**

Retrieves a count of each location attached to a top container record. Use this to find out how many containers are stored in each location.

**linked_agent_count.sql**

Retrieves a count of the number of agents linked to each resource record.

## Use Case 2: Inventories

**all_components.sql**

Retrieves a list of all archival object records associated with a given resource record. Will include records without archival object instances.

**all_instances.sql**

Retrieves a listing of archival objects with top container instances. Will not include records which do not have instances attached.

**box_list.sql**

Retrieves a distinct box list for a given collection.

## Use Case 3: Items of a Given Type/Subrecords

Queries to assist in auditing and/or updating data. Can make changes to the results of these queries and then push changes to ArchivesSpace via the API.

**all_ao_dates.sql**

Retrieves a list of all dates and their associated descriptive records. Can modify this to find dates with or without structured date fields.

**all_extents.sql**

Retrieves a list of all extents and their associated descriptive records.

**paige_boxes.sql**

Retrieves descriptive information for all materials which are housed in Paige boxes.

## Use Case 4: Time- or Location-Based Reporting

**restriction_review.sql**

Retrieves a list of resource records for which restrictions will expire within the next year.

**new_accessions.sql**

Retrieves a list of accession records for materials which were acquired within the last year.

**new_resources.sql**

Retrieves a list of resource records created after a given time period.

**ao_mod_dates.sql**

Retrieves a list of archival object records created or modified after a given date.

**locations.sql**

Retrieves a list of materials housed in a given location.

**barcodes.sql**

Retrieves descriptive information for materials housed in a box with a given barcode(s)

**barcodes.py**

Retrieves descriptive information for a user-supplied list of barcodes by running the same query over a spreadsheet containing barcodes.

## Use Case 5: Linked Records

**linked_subjects_resources.sql**

Retrieves a list of subject records linked to resource records.

**linked_agents_resources.sql**

Retrieves a list of agent records linked to resource records.