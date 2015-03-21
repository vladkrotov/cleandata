#Initializing file locations

#Intializing file locations for the training set
X_train_location <- "C:/Users/user/Documents/MyR/JH Classes/Cleaning/Quiz1/Project/data/train/X_train.txt"
y_train_location <- "C:/Users/user/Documents/MyR/JH Classes/Cleaning/Quiz1/Project/data/train/y_train.txt"
subject_train_location <- "C:/Users/user/Documents/MyR/JH Classes/Cleaning/Quiz1/Project/data/train/subject_train.txt"

#Intializing file locations for the test set
X_test_location <- "C:/Users/user/Documents/MyR/JH Classes/Cleaning/Quiz1/Project/data/test/X_test.txt"
y_test_location <- "C:/Users/user/Documents/MyR/JH Classes/Cleaning/Quiz1/Project/data/test/y_test.txt"
subject_test_location <- "C:/Users/user/Documents/MyR/JH Classes/Cleaning/Quiz1/Project/data/test/subject_test.txt"

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
ncol(train_data_frame)

#Creating a data frame for test data
test_data_frame <- data.frame(test_column1,test_column2,test_column3) 
ncol(test_data_frame)

#Joining train and test data frames into one single data frame
merged_data_frame <- rbind(train_data_frame,test_data_frame)
ncol(merged_data_frame)

#Naming columns in the merged data frame
features_location <- "C:/Users/user/Documents/MyR/JH Classes/Cleaning/Quiz1/Project/data/features.txt"
features_vector <- read.table(features_location, header = FALSE)
new_names <- features_vector[,2]
names(merged_data_frame) <- new_names
names(merged_data_frame) [562] <- "Activity" 
names(merged_data_frame) [563] <- "Subject"
head(merged_data_frame)
