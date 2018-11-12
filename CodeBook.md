Description of code in script run_analysis.R

1. Merges the training and the test sets to create one data set.
The code will read all the files and merge the test and train datasets into one dataset. Colnames are also added in the final dataset(all_set).

2. Extracts only the measurements on the mean and standard deviation for each measurement.
The code will extract the mean and SD on the final dataset(all_set).

3. Uses descriptive activity names to name the activities in the data set
The activity names are added to the all_set dataset based on the value in the activities column.

4. Appropriately labels the data set with descriptive variable names.
This part was done as part of step1.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Tidy.txt is th final tidy dataset with average of values for each activity and participant.
