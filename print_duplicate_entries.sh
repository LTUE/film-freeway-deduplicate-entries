# DESCRIPTION
# Produces a list for disqualifying duplicate film festival entries
# from the same or different seasons. Collates all entries from csv
# exports of film entries, sorts them, and writes any duplicate entries
# for the same year or different years to duplicate_entries.txt.

# DEPENDENCIES
# A nixy' environment with cat, gsort and guniq (sort and uniq versions
# that will accept the flags this script passes to them).

# USAGE
# - from filmfreeway, get csv exports of all films for all seasons
# - massage the data from those exports to have only the first and last name of
# the director and film title, e.g. in 2019_LTUE_FF_entries.csv, etc. -- but
# to also exclude entries that were disqualified (as that will exclude
# entries that were already disqualified via this very process, so that you
# don't have to duplicate work). Also, be sure that the only .csv files
# in the directory from which you run this script are those massaged ones
# (you can do that by e.g. opening the .csv files in LibreOffice calc
# or Microsoft Excel, then saving as .ods or .xlsx, then massage the data and
# save it again as a .csv over the original .csv).
# - run this script in the directory with the massaged .csv files. It will write
# any discovered duplicate entries to duplicate_entries.txt
# - search for discovered duplicates in all seasons at
# https://filmfreeway.com/submissions?season=all (after logging into the
# festival admin account), and disqualify or set to "not selected" any
# duplicates as policy dictates (with required and kind messages to the
# filmmakers for the reason).


# CODE
# Concatenate the csv files to one file:
cat *.csv > _alles.txt
# Sort them, overwriting the source file:
gsort _alles.txt -o _alles.txt
# Print all duplicate lines to duplicate_entries.txt :
guniq -D _alles.txt > duplicate_entries.txt
# Delete temp file:
rm ./_alles.txt

# FINIS
