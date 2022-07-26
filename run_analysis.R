library(dplyr)

#1. Download file and unzip
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Dataset.zip")
unzip("Dataset.zip")

#2. Reading the data - (in this section is included the activity 4 "Appropriately labels the 
#data set with descriptive variable names" at naming the col.names)

  ##2.1. Description of the labels and name of the columns
  actlab<-read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("codact","activity"))
  varname<-gsub("\\()","",read.table("UCI HAR Dataset/features.txt")$V2)
  varname<-gsub("^t", "Time", varname)
  varname<-gsub("Acc", "Accelerometer", varname)
  varname<-gsub("Gyro", "Gyroscope", varname)
  
  ##2.2. Information of the test file (set, label, subject)
  testset<-read.table("UCI HAR Dataset/test/X_test.txt",col.names=varname )
  testlabel<-read.table("UCI HAR Dataset/test/y_test.txt",col.names="codact")
  testsub<-read.table("UCI HAR Dataset/test/subject_test.txt",col.names="codsub")
  
  ##2.3. Information of the train file (set, label, subject)
  trainset<-read.table("UCI HAR Dataset/train/X_train.txt", col.names=varname)
  trainlabel<-read.table("UCI HAR Dataset/train/y_train.txt",col.names="codact")
  trainsub<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names="codsub")

#3. Merging the sets (test, train, label) - (in this section is included the 
#activities 1 "Merges the training and the test sets to create one data set" and 
#3 "Uses descriptive activity names to name the activities in the data set")

  ##3.1. Test
  test<-cbind(testsub,testlabel,testset)
  
  ##3.2. Train
  train<-cbind(trainsub,trainlabel,trainset)
  
  ##3.3. Test and train
  data<-rbind(test,train)
  
  ##3.4. Data and label(joining activities)
  data<- merge(data,actlab,by.x="codact",by.y="codact")


#4. Keeping only means and standard deviation for each measurement -
#(Activity 2 of the Assignment)
data<-data%>%select(codsub,codact,activity,everything())

  ##4.1. Identify the means columns
  mean<-grep(".mean.", names(data),fixed=T)
  
  ##4.2. Identify the standard deviation columns
  std<-grep(".std.", names(data),fixed=T)
  
  ##4.3. Selecting the columns
  data1<-data[,sort(c(1:3,mean,std))]

#5. Data set with the average of each variable for each activity and each subject.
  data2<- data1 %>%
        group_by(codsub,codact,activity) %>%
        summarise_all(funs(mean))

#6. Remove data and variables created (keep only outputs:data1 y data2)
  rm(list = ls()[ls()!="data1" & ls()!="data2"])

#7. Save the data in TXT files
  write.table(data1, "data1.txt", row.name=FALSE)
  write.table(data2, "data2.txt", row.name=FALSE)

