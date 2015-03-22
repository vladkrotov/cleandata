##Clean Data Code Book

###Data Download

###Data Manipulation

####Merging the training and the test sets to create one data set

Intializing file locations for the training set:
                                 
                                  X_train_location <- "X_train.txt"
                                  y_train_location <- "y_train.txt"
                                  subject_train_location <- "subject_train.txt"

Intializing file locations for the test set:

                                  X_test_location <- "X_test.txt"
                                  y_test_location <- "y_test.txt"
                                  subject_test_location <- "subject_test.txt"

Reading train data sets into vectors:

                                 train_column1 <- read.table(X_train_location, header = FALSE)
                                 train_column2 <- read.table(y_train_location, header = FALSE)
                                 train_column3 <- read.table(subject_train_location, header = FALSE)

Reading test data sets into vectors:

                                 test_column1 <- read.table(X_test_location, header = FALSE)
                                 test_column2 <- read.table(y_test_location, header = FALSE)
                                 test_column3 <- read.table(subject_test_location, header = FALSE)

Creating a data frame for training data:

                                 train_data_frame <- data.frame(train_column1,train_column2,train_column3)

Creating a data frame for test data:
                                 
                                 test_data_frame <- data.frame(test_column1,test_column2,test_column3) 

Joining train and test data frames into one single data frame

                                 merged_data_frame <- rbind(train_data_frame,test_data_frame)

####Labeling the data set with descriptive variable names. The variables are later renamed with simpler names to create the final tiday data set required in step 5

Naming columns in the merged data frame using the features.txt file

                                 features_location <- "features.txt"
                                 features_vector <- read.table(features_location, header = FALSE)
                                 new_names <- features_vector[,2]
                                 names(merged_data_frame) <- new_names
                                 names(merged_data_frame) [562] <- "Activity" 
                                 names(merged_data_frame) [563] <- "Subject"
                                 ordered_data_frame$Subject <- merged_data_frame[,merged_data_frame$Subject]

Using descriptive activity names to name the activities in the data set

First, we get the locations of specific values:
                                
                                 act1 <- which(merged_data_frame$Activity == "1")
                                 act2 <- which(merged_data_frame$Activity == "2")
                                 act3 <- which(merged_data_frame$Activity == "3")
                                 act4 <- which(merged_data_frame$Activity == "4")
                                 act5 <- which(merged_data_frame$Activity == "5")
                                 act6 <- which(merged_data_frame$Activity == "6")

Second, we change the numbers at those locations to text labels:

                                 merged_data_frame$Activity[act1]<- "WALKING"
                                 merged_data_frame$Activity[act2]<- "WALKING_UPSTAIRS"
                                 merged_data_frame$Activity[act3]<- "WALKING_DOWNSTAIRS"
                                 merged_data_frame$Activity[act4]<- "SITTING"
                                 merged_data_frame$Activity[act5]<- "STANDING"
                                 merged_data_frame$Activity[act6]<- "LAYING"

Converting categorial variables to factors:

                                 merged_data_frame$Activity <- sapply(merged_data_frame$Activity,as.factor)
                                 merged_data_frame$Subject <- sapply(merged_data_frame$Subject,as.factor)


####Extracting only the measurements on the mean and standard deviation for each measurement.
Logic: Since each variable requires human interpretation, each variable is included manually after inspecting all 561 variables one-by-one

Creating a new data frame containing only means and standard deviations. The order of columns is changed to make the data frame easier to understand for humans:

                                 filtered_data_frame <- data.frame(
                                 
                                  "Subject"= merged_data_frame$Subject, 
                                  "Activity" = merged_data_frame$Activity,
                                  
                                  "tBodyAccMeanX" = merged_data_frame[,3],
                                  "tBodyAccMeanY" = merged_data_frame[,4],
                                  "tBodyAccMeanZ" = merged_data_frame[,5],
                                  
                                  "tBodyAccStdX" = merged_data_frame[,6],
                                  "tBodyAccStdY" = merged_data_frame[,7],
                                  "tBodyAccStdZ" = merged_data_frame[,8],
                                  
                                  "tGravityAccMeanX" = merged_data_frame[,43],
                                  "tGravityAccMeanY" = merged_data_frame[,44],
                                  "tGravityAccMeanZ" = merged_data_frame[,45],
                                  
                                  "tGravityAccStdX" = merged_data_frame[,46],
                                  "tGravityAccStdY" = merged_data_frame[,47],
                                  "tGravityAccStdZ" = merged_data_frame[,48],
                                  
                                  "tBodyAccJerkMeanX" = merged_data_frame[,83],
                                  "tBodyAccJerkMeanY" = merged_data_frame[,84],
                                  "tBodyAccJerkMeanZ" = merged_data_frame[,85],
                                  
                                  "tBodyAccJerkStdX" = merged_data_frame[,86],
                                  "tBodyAccJerkStdY" = merged_data_frame[,87],
                                  "tBodyAccJerkStdZ" = merged_data_frame[,88],
                                 
                                  "tBodyGyroMeanX"= merged_data_frame[,123],
                                  "tBodyGyroMeanY"= merged_data_frame[,124],
                                  "tBodyGyroMeanZ"= merged_data_frame[,125],
                                  
                                  "tBodyGyroStdX"= merged_data_frame[,126],
                                  "tBodyGyroStdY"= merged_data_frame[,127],
                                  "tBodyGyroStdZ"= merged_data_frame[,128],
                                  
                                  "tBodyGyroJerkMeanX"= merged_data_frame[,163],
                                  "tBodyGyroJerkMeanY"= merged_data_frame[,164],
                                  "tBodyGyroJerkMeanZ" = merged_data_frame[,165],
                                  
                                  "tBodyGyroJerkStdX"= merged_data_frame[,166],
                                  "tBodyGyroJerkStdY"= merged_data_frame[,167],
                                  "tBodyGyroJerkStdZ" = merged_data_frame[,168],
                                  
                                  "tBodyAccMean" = merged_data_frame[,203],
                                  "tBodyAccStd" = merged_data_frame[,204],
                                  
                                  "tGravityAccMagMean" = merged_data_frame[,216],
                                  "tGravityAccMagStd" = merged_data_frame[,217],
                                
                                  "tBodyAccJerkMagMean" = merged_data_frame[,229],
                                  "tBodyAccJerkMagStd" = merged_data_frame[,230],
                                  
                                  "tBodyGyroMagMean" = merged_data_frame[,242],
                                  "tBodyGyroMagStd" = merged_data_frame[,243],
                                  
                                  "tBodyGyroJerkMagMean" = merged_data_frame[,255],
                                  "tBodyGyroJerkMagStd" = merged_data_frame[,256],
                                  
                                  "fBodyAccMeanX" = merged_data_frame[,268],
                                  "fBodyAccMeanY" = merged_data_frame[,269],
                                  "fBodyAccMeanZ" = merged_data_frame[,270],
                                  
                                  "fBodyAccStdX" = merged_data_frame[,271],
                                  "fBodyAccStdY" = merged_data_frame[,272],
                                  "fBodyAccStdZ" = merged_data_frame[,273],
                                  
                                  "fBodyAccMeanFreqX" = merged_data_frame[,296],
                                  "fBodyAccMeanFreqY" = merged_data_frame[,297],
                                  "fBodyAccMeanFreqZ" = merged_data_frame[,298],
                                  
                                  "fBodyAccJerkMeanX" = merged_data_frame[,347],
                                  "fBodyAccJerkMeanY" = merged_data_frame[,348],
                                  "fBodyAccJerkMeanZ" = merged_data_frame[,349],
                                  
                                  "fBodyAccJerkStdX" = merged_data_frame[,350],
                                  "fBodyAccJerkStdY" = merged_data_frame[,351],
                                  "fBodyAccJerkStdZ" = merged_data_frame[,352],
                                  
                                  "fBodyAccJerkMeanFreqX" = merged_data_frame[,375],
                                  "fBodyAccJerkMeanFreqY" = merged_data_frame[,376],
                                  "fBodyAccJerkMeanFreqZ" = merged_data_frame[,377],
                                  
                                  "fBodyGyroMeanX" = merged_data_frame[,426],
                                  "fBodyGyroMeanY" = merged_data_frame[,427],
                                  "fBodyGyroMeanZ" = merged_data_frame[,428],
                                  
                                  
                                  "fBodyGyroStdX" = merged_data_frame[,429],
                                  "fBodyGyroStdY" = merged_data_frame[,430],
                                  "fBodyGyroStdZ" = merged_data_frame[,431],
                                  
                                  "fBodyAccMagMean" = merged_data_frame[,505],
                                  "fBodyAccMagStd" = merged_data_frame[,506],
                                  
                                  "fBodyAccJerkMagMean" = merged_data_frame[,518],
                                  "fBodyAccJerkMagStd" = merged_data_frame[,519],
                                  
                                  "fBodyGyroMagMean" = merged_data_frame[,531],
                                  "fBodyGyroMagStd" = merged_data_frame[,532],
                                  
                                  "fBodyGyroJerkMagMean" = merged_data_frame[,544],
                                  "fBodyGyroJerkMagStd" = merged_data_frame[,545]                                                                   
                                  )

####Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

Calculating means using the plyr package:

                                 require(plyr)
                                 averaged_data_frame <- ddply(filtered_data_frame, .(Subject, Activity), colwise(mean))
Writing to a file:
                                 write.table(averaged_data_frame, file = "MyTidyData.txt", row.name=FALSE)

The file MyTidyData.txt wil be created inside your working folder and contain the new, "averaged" data set
