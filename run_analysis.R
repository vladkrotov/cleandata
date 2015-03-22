#Initializing file locations

#Intializing file locations for the training set
X_train_location <- "X_train.txt"
y_train_location <- "y_train.txt"
subject_train_location <- "subject_train.txt"

#Intializing file locations for the test set
X_test_location <- "X_test.txt"
y_test_location <- "y_test.txt"
subject_test_location <- "subject_test.txt"

#Reading train data sets into vectors
train_column1 <- read.table(X_train_location, header = FALSE)
train_column2 <- read.table(y_train_location, header = FALSE)
train_column3 <- read.table(subject_train_location, header = FALSE)


#Reading test data sets into vectors
test_column1 <- read.table(X_test_location, header = FALSE)
test_column2 <- read.table(y_test_location, header = FALSE)
test_column3 <- read.table(subject_test_location, header = FALSE)

#Creating a data frame for train data
train_data_frame <- data.frame(train_column1,train_column2,train_column3)

#Creating a data frame for test data
test_data_frame <- data.frame(test_column1,test_column2,test_column3) 

#Joining train and test data frames into one single data frame
merged_data_frame <- rbind(train_data_frame,test_data_frame)


#Naming columns in the merged data frame
features_location <- "features.txt"
features_vector <- read.table(features_location, header = FALSE)
new_names <- features_vector[,2]
names(merged_data_frame) <- new_names
names(merged_data_frame) [562] <- "Activity" 
names(merged_data_frame) [563] <- "Subject"
ordered_data_frame$Subject <- merged_data_frame[,merged_data_frame$Subject]



#Changing labels of the Activity variable from bnumbers to text

#First, we get the locations of specific values
act1 <- which(merged_data_frame$Activity == "1")
act2 <- which(merged_data_frame$Activity == "2")
act3 <- which(merged_data_frame$Activity == "3")
act4 <- which(merged_data_frame$Activity == "4")
act5 <- which(merged_data_frame$Activity == "5")
act6 <- which(merged_data_frame$Activity == "6")

#Second, we change the numbers at those locations to text labels
merged_data_frame$Activity[act1]<- "WALKING"
merged_data_frame$Activity[act2]<- "WALKING_UPSTAIRS"
merged_data_frame$Activity[act3]<- "WALKING_DOWNSTAIRS"
merged_data_frame$Activity[act4]<- "SITTING"
merged_data_frame$Activity[act5]<- "STANDING"
merged_data_frame$Activity[act6]<- "LAYING"

#Converting categorial variables to factors
merged_data_frame$Activity <- sapply(merged_data_frame$Activity,as.factor)
merged_data_frame$Subject <- sapply(merged_data_frame$Subject,as.factor)


