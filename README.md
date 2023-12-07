# NIDC Template Wranglingng

This git repository reads NIDC (National Imagine Data Collection) templates, cleanses them and combines them into a sandpit table.

## Instructions
Use NIDC_datareading.R to browse for NIDC files. The script will read in the excel file, cleanse and format it, and cut off trailing and unused rows.

It will then create a global temporary table in the sandpit with the name #ABCD where ABCD are the first 4 characters of the read excel file.

Run the script once for each provider. This will generate a temporary table for each provider.

Use union_tem_tables.sql to append the providers' NIDC forms together, and load them to a permanent sandpit table with a name of your choosing.

## Next Steps
- Allow multiple files/providers to be read at once rather than having to run the script once for each provider.
- Eliminate the need for a secondary SQL script by writing SQL in R to append and write the files to a permanent sandpit table.

This repository is dual licensed under the [Open Government v3]([https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) & MIT. All code can outputs are subject to Crown Copyright.
