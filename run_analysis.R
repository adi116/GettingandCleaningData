# This R script merges the Human Activity Recognition Using Smartphones Dataset train and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.

# ==========
# Initialise
# ==========
library(dplyr)

# Initialise variables
courseProjectFilePath <- "/UCI HAR Dataset/"
step4FilePath <- file.path(getwd(), "step_4.txt")
step5FilePath <- file.path(getwd(), "step_5.txt")
zipFilePath <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download and unzip file if 'UCI HAR Dataset' set doesn't exist in the working directory
if (!file.exists(file.path(getwd(), courseProjectFilePath))){
    temp <- tempfile()
    download.file(zipFilePath, temp)
    unzip(temp, exdir = file.path(getwd()))
    unlink(temp) # Remove the temp file  
}

# ==========
# Create all the required functions for this analysis:
# ==========

# This function converts a flat file to a data frame
convertTextFileToDataFrame <- function(sourceFolder, fileName, sep = "", header = F){
    flatFileLocation <- file.path(getwd(), courseProjectFilePath, sourceFolder, fileName)
    mydf <- read.table(flatFileLocation, sep = sep, header = header)
    return(mydf)
}

# This function reads all the flat files from a specified location and outputs each file as a list of data frame
convertAllFilestoDataFrame <- function(sourceFolder, fileExtension=".txt"){
    listOfFile <- list.files(file.path(getwd(), courseProjectFilePath, sourceFolder), pattern = fileExtension)
    flatFileLocation <- file.path(getwd(), courseProjectFilePath, sourceFolder)
    dfList<- sapply(listOfFile, function(x) {fileToRead <- x
                                             convertTextFileToDataFrame(sourceFolder, fileToRead)
    })
    return(dfList)
}

# This function merges the subject, x, and y data set from a source folder into a single dplyr data frame
# The output is Subject, Activity Name, and the mean and standard deviation for each measurement
mergeFilesIntoDataFrame <- function(sourceFolder){
    
    # First we want to read all data files from the sourceFolder (test or train) and convert it into a data frame
    DFList <- convertAllFilestoDataFrame(sourceFolder)
    subject_df <- as.data.frame(DFList[eval(paste0("subject_", sourceFolder, ".txt"))])
    y_df <- as.data.frame(DFList[eval(paste0("y_", sourceFolder, ".txt"))])
    X_df <- as.data.frame(DFList[eval(paste0("X_", sourceFolder, ".txt"))])
    
    # Assign proper column names
    colnames(subject_df) <- "Subject"
    colnames(y_df) <- "Activity"
    
    # For the X_df, we want to get the column names from features.txt
    # use make.names to convert column names to a proper variable name
    # make column names unique by concatenating the names from columns 1 and 2
    X_colnames <- as.character(
        paste(
            sapply(convertTextFileToDataFrame("", "features.txt")[1], make.names),
            sapply(convertTextFileToDataFrame("", "features.txt")[2], make.names),
            sep = "_")
    )
    colnames(X_df)  <- X_colnames
    
    # Convert data frames to dplyr data frames
    subject_df <- tbl_df(subject_df)
    y_df <- tbl_df(y_df)
    X_df <- tbl_df(X_df)
    
    # Combine x, y, and subject dplyr data frames to a single data frame
    combinedDF <- bind_cols(subject_df, y_df, X_df)
    
    # Assign the proper activity label
    combinedDFActivityLabel <- merge(combinedDF, activityLabels)
    
    # Extract only the mean and standard deviation columns
    outputDF <- select(combinedDFActivityLabel, Subject, Activity.Name, contains("mean"), contains("std"), -contains("angle"), -contains("meanFreq"))
    # rename columns to remve concatenation of number and proper column name. At this stage there is no more duplicate column names
    names(outputDF) <- gsub(".*_", "", names(outputDF))
    # rename *BodyBody* columns  with Body
    names(outputDF) <- gsub("BodyBody", "Body", names(outputDF))
    return(outputDF)
}

# The activity label is common to test and train data set. To save a little bit of processing time we want to create the data frame here
# Convert the text file to a data frame and add the proper column name.
activityLabels <- convertTextFileToDataFrame("", "activity_labels.txt")
colnames(activityLabels)  <- c("Activity", "Activity.Name")


############################################################################################################
# THIS IS THE MAIN SCRIPT THAT EXTRACTS AND PROCESS THE Human Activity Recognition Using Smartphones Dataset
############################################################################################################

# The mergeFilesIntoDataFrame merges the subject, x, and y data set from a source folder into a single dplyr data frame.
# The output is Subject, Activity Name, and the mean and standard deviation for each measurement with the proper column names
finalDF <- bind_rows(mergeFilesIntoDataFrame("test"), mergeFilesIntoDataFrame("train"))

# Use the chaining function to group the output by Activity Name and Subject, then summarize by getting the mean
summarizedDF <- finalDF %>% group_by(Activity.Name, Subject) %>% summarise_each(funs(mean))

# Create Step 4 and Step 5 output files.
write.table(finalDF, step4FilePath, row.name = F)
write.table(summarizedDF, step5FilePath, row.names = F)

# Finish up
msg <- paste("All done! The following files are created:", step4FilePath, "and", step5FilePath, sep = " ")
print(msg)
