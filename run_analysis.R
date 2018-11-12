## read all data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
##
## add col names to the datasets
colnames(X_train) = features[,2]
colnames(X_test) = features[,2]
## Merge train and test datasets with added colnames
X_train$activities <- Y_train[, 1]
X_train$participants <- sub_train[, 1]
X_test$activities <- Y_test[, 1]
X_test$participants <- sub_test[, 1]

## 1. Merges the training and the test sets to create one data set.
all_set <- rbind(X_train, X_test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
Mean <- grep("mean|Mean", names(all_set), value = FALSE, fixed = TRUE)
mastermean <- all_set[Mean]
STD <- grep("std", names(all_set), value = FALSE)
masterstd <- all_set[STD]

## 3. Uses descriptive activity names to name the activities in the data set
all_set$activities <- as.character(all_set$activities)
all_set$activities[all_set$activities == 1] <- "Walking"
all_set$activities[all_set$activities == 2] <- "Walking Upstairs"
all_set$activities[all_set$activities == 3] <- "Walking Downstairs"
all_set$activities[all_set$activities == 4] <- "Sitting"
all_set$activities[all_set$activities == 5] <- "Standing"
all_set$activities[all_set$activities == 6] <- "Laying"
all_set$activities <- as.factor(all_set$activities)

## 4. Appropriately labels the data set with descriptive variable names.
names(all_set)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Master.dt <- data.table(all_set)
#This takes the mean of every column broken down by participants and activities
TidyData <- Master.dt[, lapply(.SD, mean), by = 'participants,activities']
write.table(TidyData, file = "Tidy.txt", row.names = FALSE)

