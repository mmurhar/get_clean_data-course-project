# Download the data and unzip the file
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile = "C:\\Users\\murhar.family\\Desktop\\coursera\\get_clean data\\project_data.zip",method = "curl")

if(!file.exists("UCI HAR DATASET")){
  unzip("project_data.zip")
}
# Load the required packages
library(plyr)
# Load the required data into R
act_label<-read.table("UCI HAR Dataset\\activity_labels.txt")
features<-read.table("UCI HAR Dataset\\features.txt")
test_x<-read.table("UCI HAR Dataset\\test\\X_test.txt")
test_y<-read.table("UCI HAR Dataset\\test\\Y_test.txt")
train_x<-read.table("UCI HAR Dataset\\train\\X_train.txt")
train_y<-read.table("UCI HAR Dataset\\train\\Y_train.txt")
sub_test<-read.table("UCI HAR Dataset\\test\\subject_test.txt")
sub_train<-read.table("UCI HAR Dataset\\train\\subject_train.txt")
# Merge the train and test data
xdata<-rbind(train_x,test_x)
ydata<-rbind(train_y,test_y)
sub_data<-rbind(sub_train,sub_test)
# Label the columns
colnames(xdata)<-features[,2]
colnames(ydata)<-"activities"
colnames(sub_data)<-"subject"
# Merge and subset the data to get mean and standard deviation values
cmplt_data<-cbind(xdata,cbind(ydata,sub_data))
mean_std_data<-as.character(features[,2][grep("[m][e][a][n][()]|[s][t][d][()]",features[,2])])
req_data<-c(mean_std_data,"subject","activities")
final_data<-cmplt_data[,req_data]
# Label the activities
final_data$act<-factor(final_data$act,levels = act_label[, 1], labels = act_label[, 2])
# Label the data set with descriptive variable names
colnames(final_data)<-sub("^t","time",colnames(final_data))
colnames(final_data)<-sub("^f","frequency",colnames(final_data))
colnames(final_data)<-sub("Acc","Accelerometer",colnames(final_data))
colnames(final_data)<-sub("Gyro","Gyroscope",colnames(final_data))
colnames(final_data)<-sub("Mag","Magnitude",colnames(final_data))
colnames(final_data)<-sub("BodyBody","Body",colnames(final_data))
# Create independent tidy data set with the average of each variable for each activity and each subject
result<-aggregate(. ~subject + act, final_data, mean)
result<-result[order(result$subject,result$act),]
write.table(result,file="tidydata.txt",row.names = FALSE, quote=FALSE, sep = '\t')