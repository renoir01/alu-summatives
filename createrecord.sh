#!/usr/bin/env bash

create_student_record() {
    echo "Please input your student email:"
    read -r STUDENTEMAIL
    echo "Please input your age:"
    read -r AGE
    echo "Please input your student ID:"
    read -r STUDENTID

    while true; do
        EXISTS=$(grep -Eiw "$STUDENTID|$STUDENTEMAIL" students-list_0333.txt)

        if [[ -n "$EXISTS" ]]; then
            echo "This email or ID already exists:"
            echo "$EXISTS"
            sleep 2
        else
            echo "{STUDENTEMAIL:$STUDENTEMAIL, AGE:$AGE, STUDENTID:$STUDENTID}" >> "students-list_0333.txt"
            echo "Created successfully..."
            return
        fi

        echo "Please provide a different email or ID:"
        echo "Please input the student ID:"
        read -r STUDENTID
        echo "Please input the student email:"
        read -r STUDENTEMAIL
    done
}

create_student_record
