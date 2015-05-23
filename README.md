# run_analysis.R


The run_analysis.R script produces the following data sets from the original experiment data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip):
- a tidy data set that contains the mean and standard deviation for each of the measurement described above
- a tidy data set based on the first data set with the average of each variable for each activity and each subject.


The run_analysis.R will do the following upon execution:
- Downloads and unzips the original experiment data if the 'UCI HAR Dataset' folder doesn't exist in the current working directory.
- Combines the subject, X, and Y data sets from a folder (test or train within the 'UCI HAR Dataset') into one data set and assigns a descriptive activity label from activity_labels.txt. During this step:
  - creates an acceptable column name for the X data set and removes the duplicates before combining with subject, Y, and activity labels data set.
  - extracts only the mean and standard deviation for each of the measurement described above
- Merges the processed data set from train and test folders to create one data set and writes into a file (step_4.txt)
-  Summarizes the data set created above (step_4.txt) with the average of each variable for each activity and each subject, and writes into a file (step_5.txt)

