#!/usr/bin/env bash
#automatically move files to negpod_id-q1
LIST=$(ls /alu-summatives/question-1/)
mkdir "0323-RW-SOFEN-8120120-9_q1"
for FILE in $LIST;
do
	if [ -e "/alu-summatives/question-1/$FILE" ];
	then
		cp "/alu-summatives/question-1/$FILE" "0323-RW-SOFEN-8120120-9_q1"
	fi
done	
