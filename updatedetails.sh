#!/usr/bin/env bash
#updating student details using the student ID

#FIRST PART OF THE CODE
#checking if student id exist
echo "Please choose the field to update: age or email? (Type 'age', 'email', or 'quit' to exit updating)"
read -r UPDATE

#checking if variable update is quit
if [ "$UPDATE" = "quit" ];
then
	echo "exiting application..."
        exit 1

fi

#continue to collect student id if update is not exit
echo "give me student ID"
read -r STUDENTID


#LAST PART OF THE CODE
#update details function if student id is present

update_details() {
        if [ "$UPDATE" = "age" ];
        then
                
		grep -Eiw "$STUDENTID" students-list_0333.txt
		echo "Enter your previous Age"
                read -r OLDAGE
                echo "Enter your new Age"
                read -r NEWAGE
                awk -v ID="$STUDENTID" -v oldage="$OLDAGE" -v newage="$NEWAGE" '/ID/ {sub(oldage, newage, $0)} 1' students-list_0333.txt > tempfile && mv tempfile students-list_0333.txt
                echo "Age successfully updated!"
        elif [ "$UPDATE" = "email" ];
        then
		grep -Eiw "$STUDENTID" students-list_0333.txt
                echo "Enter previous Email"
                read -r PREVEMAIL
                echo "Enter new Email"
                read -r NEWEMAIL
                awk -v ID="$STUDENTID" -v prevemail="$PREVEMAIL" -v newemail="$NEWEMAIL" '/ID/ {sub(prevemail, newemail, $0)} 1' students-list_0333.txt > tempfile && mv tempfile students-list_0333.txt
                echo "Email sucessfully updated!"
        fi
}

#SECOND PART OF THE CODE
#checking if studentid is present inorder to update details or absent inorder to request for correct student id or quit
while true;
do
	if [ "$UPDATE" = "quit" ];
	then
		echo "exiting application..."
        	exit 1

	fi

	CHECKID=$(grep -Eio "$STUDENTID" students-list_0333.txt)
	if [ -z "$CHECKID" ];
	then
		echo "Invalid student id $STUDENTID"
		sleep 1
	else
		update_details
		exit 1
	fi
        echo "change your update to quit to exit the program, or rewrite what you want to update again"
	read -r UPDATE
	sleep 2
	echo "give me the correct id"
	read -r STUDENTID
done
