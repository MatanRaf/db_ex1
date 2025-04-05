import csv
from io import TextIOWrapper
from zipfile import ZipFile

# opens file.
# enrollment_outfile = open("enrollment.csv", 'w' , encoding='UTF8')
# enrollment_outwriter = csv.writer(enrollment_outfile, delimiter=",", quoting=csv.QUOTE_MINIMAL)

country_entities_outfile = open("country_entity.csv", 'w' , encoding='UTF8')
country_entities_outwriter = csv.writer(country_entities_outfile, delimiter=",", quoting=csv.QUOTE_MINIMAL)
country_entities_column_indexes = [1, 0, 2, 3]
country_entities_dictionary = {}

university_outfile = open("university.csv", 'w' , encoding='UTF8')
university_outwriter = csv.writer(university_outfile, delimiter=",", quoting=csv.QUOTE_MINIMAL)
university_column_indexes = [4, 1, 5, 6, 7, 9, 10, 11, 12, 13, 14]
university_dictionary = {}

enrollment_year_outfile = open("enrollment_year.csv", 'w' , encoding='UTF8')
enrollment_year_outwriter = csv.writer(enrollment_year_outfile, delimiter=",", quoting=csv.QUOTE_MINIMAL)
enrollment_year_column_indexes = [15, 4, 16]

closed_university_outfile = open("closed_university.csv", 'w' , encoding='UTF8')
closed_university_outwriter = csv.writer(closed_university_outfile, delimiter=",", quoting=csv.QUOTE_MINIMAL)
closed_university_column_indexes = [4, 8]
closed_university_dictionary = {}

# process_file goes over all rows in original csv file, and sends each row to process_row()
def process_file():
    with ZipFile('enrollment.zip') as zf:
        with zf.open('enrollment.csv', 'r') as infile:
            reader = csv.reader(TextIOWrapper(infile, 'utf-8'))
            for row in reader:
                # TODO splits row into the different csv table files
                # enrollment_outwriter.writerow(row)
                country_entities_dictionary[row[1]] = [row[i] for i in country_entities_column_indexes]
                university_dictionary[row[4]] = [row[i] for i in university_column_indexes]
                enrollment_year_outwriter.writerow([row[i] for i in enrollment_year_column_indexes])
                if row[8] != '':
                    closed_university_dictionary[row[4]] = [row[i] for i in closed_university_column_indexes]
            for university_row in university_dictionary.values():
                university_outwriter.writerow(university_row)
            for country_entities_row in country_entities_dictionary.values():
                country_entities_outwriter.writerow(country_entities_row)
            for closed_university_row in closed_university_dictionary.values():
                closed_university_outwriter.writerow(closed_university_row)
    # enrollment_outfile.close()
    country_entities_outfile.close()
    university_outfile.close()
    enrollment_year_outfile.close()
    closed_university_outfile.close()

# return the list of all tables
def get_names():
    return ["country_entity", "university", "enrollment_year", "closed_university"]


if __name__ == "__main__":
    process_file()
