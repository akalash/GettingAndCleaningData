run_analysis.R - script than make 2 data file commonDataSet and groupActivitySubject from input data

script need launch from directory with input data

commonDataSet:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 

groupActivitySubject:
* data set with the average of each variable for each activity and each subject

run_analysis.R work:
* load required data
* merge data
* set labels data
* extract mean and std "-std\(|-mean\(";
* add column subject and activity
* create commonDataSet.txt
* group by activity and subject
* create groupActivitySubject.txt
