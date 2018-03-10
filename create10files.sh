#/bin/bash
#This script creates 10 empty files with names such as file, file2 etc.
for i in {1..10};
do touch file${i};
done
