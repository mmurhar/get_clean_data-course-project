## Codebook for Project
This code book explains the data, variables given in the tidydata.txt file. The information about the project is given in the Readme.md file.
The tidydata.txt file contains a tidy data set which is prepared by merging the X_test,Y_test, Subject_test files from test folder and x_train, Y_train Subject_train files from train folder. Then the measurements on the mean and standard deviation for each measurement were extracted from this data set. The variables and activity labels were added and data set was appropriately labeled with the descriptive names.

## Variables

•	Subject: These are the subject id having integer values from 1 to 30.
•	Act: These are the activities performed which are as follows:
Walking, walking_upstairs, walking_downstairs, Sitting, Standing, Laying.

### Signals measured while performing the above activities
•	Sensor Signals(accelerometer and gyroscope): These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
‘t’ denotes Time and ‘f’ denotes frequency.

•	The set of variables that were estimated from these signals are:
1)	mean(): Mean value
2)	std(): Standard deviation
 
The final data set in tidydata.txt file contains average of each of the above variables for each subject and each activity.


 

