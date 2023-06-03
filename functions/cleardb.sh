#!/bin/bash
# This script restores the local database public schema
read -p "Please enter psql database name that should be cleared (this will restore public schema): " database

echo "Clearing database '${database}'..."

echo "-Dropping Schema 'public'"
psql -d $database -c "DROP SCHEMA public CASCADE;"

if [ $? -ne 0 ]; then
    exit 1;
fi

echo "-Creating Schema 'public'"
psql -d $database -c "CREATE SCHEMA public;"

echo "-Assigning Schema roles"
psql -d $database -c "GRANT ALL ON SCHEMA public TO postgres;"
psql -d $database -c "GRANT ALL ON SCHEMA public TO public;"

echo "Database successfully cleared!"
