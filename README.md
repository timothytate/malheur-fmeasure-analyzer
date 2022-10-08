This is a script that will create an analysis file with all possible values form Prototype Max Distance and Cluster Minimum Distance. The script uses a brute force algorithm to evaluate all possibilities from 0.1 to 1.4 in 0.1 increments.

The script will output a file that can be easily filtered to identify the combination that will yield the highest possible F-measure for any given Training, Testing, and Final Classification sets.

./find-optimal-distances.sh -o <output_file.csv>

Required Folders:
training/
testing/
classify/

Required Files:
Preprocessed Files Datasets from Cuckoo and AVClass
https://cuckoosandbox.org/
https://github.com/malicialab/avclass

References:
http://www.mlsec.org/malheur/manual.html
http://www.mlsec.org/malheur/docs/malheur-jcs.pdf
