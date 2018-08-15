import pymysql, csv, time

#Open a CSV in reader mode
def opencsv():
    input_csv = input('Please enter path to CSV: ')
    file = open(input_csv, 'r', encoding='utf-8')
    csvin = csv.reader(file)
    next(csvin, None)
    return csvin

#Open a CSV file in writer moder
def opencsvout():
    output_csv = input('Please enter path to output CSV: ')
    file = open(output_csv, 'a', encoding='utf-8', newline='')
    csvout = csv.writer(file)
    return csvout

print('Connecting to database...')

connection = pymysql.connect(host='127.0.0.1',
                             port=3306 ,
                             user='amd243',
                             password='FFmIjc5xLw',
                             db='archivesspace')

print('Connected!')

cursor = connection.cursor()

csvfile = opencsv()
csvoutfile = opencsvout()

headers = ['barcode_og', 'barcode', 'collection_identifier', 'collection_title', 'container_profile', 'container_number']
csvoutfile.writerow(headers)

#is there any way to easily add the accession number?
for row in csvfile:
    barcode = row[0]
    print('querying ' + str(barcode))
    cursor.execute("""
    SELECT DISTINCT tc.barcode AS barcode
        , resource.identifier as collection_identifier
        , resource.title AS collection_title
        , cp.name AS container_profile
        , tc.indicator AS container_number
    FROM sub_container sc
    left join enumeration_value on enumeration_value.id = sc.type_2_id
    left join top_container_link_rlshp tclr on tclr.sub_container_id = sc.id
    left join top_container tc on tclr.top_container_id = tc.id
    left join top_container_profile_rlshp tcpr on tcpr.top_container_id = tc.id
    left join container_profile cp on cp.id = tcpr.container_profile_id
    left join instance on sc.instance_id = instance.id
    left join archival_object ao on instance.archival_object_id = ao.id
    left join resource on ao.root_record_id = resource.id
    WHERE tc.barcode LIKE """ + str(barcode))
    columns = cursor.description
    result = cursor.fetchall()
    if not cursor.rowcount:
        newlist = row + ['NO RESULTS']
    	#print('No results found for: ' + str(barcode))
        csvoutfile.writerow(newlist)
    else:
        for r in result:
            newlist = row + list(r)
            print(newlist)
            csvoutfile.writerow(newlist)

cursor.close()

time.sleep(5)
print('All Done! Check outfile for details')
