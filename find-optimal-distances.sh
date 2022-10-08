#!/bin/bash

#Arguments
while getopts o: flag
do
    case "${flag}" in
        o) output=${OPTARG};;
    esac
done

#Analysis Header for CSV
echo "Prototype MAX_DIST, Cluster MIN_DIST, Training Precision, Training Recall, Training F-measure, Testing Precision, Testing Recall, Testing F-measure, Classification Precision, Testing Recall, Classification F-measure" > $output

#loop through commands change prototype max distance and cluster minimum
#distance for values from 0.1 to 1.4 in 0.1 increments.
for i in $(seq 0.1 0.1 1.4);
do
	for j in $(seq 0.1 0.1 1.4);
	do	
		python modify-distances.py $i $j
		malheur -c config.mlw -o training.txt -vv cluster training/
		malheur -c config.mlw -o testing.txt -vv classify testing/
		malheur -c config.mlw -o classify.txt -vv classify subjects/
		
		#Build Analysis File
		PRECISION_TRAINING=$(cat training.txt | grep 'Precision' | awk '{print $5}')
		PRECISION_TESTING=$(cat testing.txt | grep 'Precision' | awk '{print $5}')
		PRECISION_CLASSIFY=$(cat classify.txt | grep 'Precision' | awk '{print $5}')
		RECALL_TRAINING=$(cat training.txt | grep 'Recall' | awk '{print $5}')
		RECALL_TESTING=$(cat testing.txt | grep 'Recall' | awk '{print $5}')
		RECALL_CLASSIFY=$(cat classify.txt | grep 'Recall' | awk '{print $5}')
		FMEASURE_TRAINING=$(cat training.txt | grep 'F-measure' | awk '{print $5}')
		FMEASURE_TESTING=$(cat testing.txt | grep 'F-measure' | awk '{print $5}')
		FMEASURE_CLASSIFY=$(cat classify.txt | grep 'F-measure' | awk '{print $5}')
		echo "$i, $j, $PRECISION_TRAINING, $RECALL_TRAINING, $FMEASURE_TRAINING, $PRECISION_TESTING, $RECALL_TESTING, $FMEASURE_TESTING, $PRECISION_CLASSIFY, $RECALL_CLASSIFY, $FMEASURE_CLASSIFY" >> $output
	done
done
