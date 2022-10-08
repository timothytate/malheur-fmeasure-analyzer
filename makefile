classify:
	malheur -c config.mlw -o training.txt -vv cluster training/
	malheur -c config.mlw -o testing.txt -vv classify testing/
	malheur -c config.mlw -o classify.txt -vv classify subjects/
	echo 'TRAINING'
	cat training.txt | grep -e 'Precision' -e 'Recall' -e 'F-measure'
	echo 'TESTING'
	cat testing.txt | grep -e 'Precision' -e 'Recall' -e 'F-measure'
	echo 'CLASSIFY'
	cat classify.txt | grep -e 'Precision' -e 'Recall' -e 'F-measure'
