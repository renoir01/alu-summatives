#!/usr/bin/env bash

delete_student_by_id() {
    echo "Please provide the student ID:"
    read -r STUDENTID

    while true; do
        CHECKID=$(grep -Eio "$STUDENTID" students-list_0333.txt)

        if [ -z "$CHECKID" ]; then
            echo "This ID doesn't exist."
            echo "Please enter a correct ID:"
        else
            sed -i "/$STUDENTID/d" students-list_0333.txt
            echo "Deleted successfully..."
            exit
        fi

        read -r STUDENTID
    done
}

delete_student_by_id
