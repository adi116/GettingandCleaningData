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

## References:
Use of this dataset in publications must be acknowledged by referencing the following publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
