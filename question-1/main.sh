#!/usr/bin/env bash

while true; do
    echo "================================"
    echo "Bachelor of Software Engineering Cohort List"
    echo "================================"
    echo "1. Create student record"
    echo "2. Delete student"
    echo "3. Update student record"
    echo "4. View all students"
    echo "5. Exit"
    echo "================================"
    read -r -p "Enter your choice: " CHOICE

    case "$CHOICE" in
        "1")
            echo "Creating a new record..."
            ../createrecord.sh
            ;;
        "4")
            echo "Listing saved students..."
           ../liststudents.sh
            ;;
        "2")
            echo "Deleting saved student details..."
           ../deletestudent.sh
            ;;
        "3")
            echo "Updating student details..."
           ../updatedetails.sh
            ;;
        "5")
            echo "Exiting application..."
            exit 2
            ;;
        *)
            echo "Invalid option"
            echo "Options are from 1 to 5"
            ;;
    esac
done
