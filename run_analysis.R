
#Checks if package dplyr is loaded, loads if not
packages <- search()
if(sum(grepl("package::dplyr", packages)) == 0) library(dplyr)

#Contains type of experiment related to its level
labels <- read.table("UCI HAR Dataset/activity_labels.txt",col.names = c("level","label"))

#Contains id of subject whose masurements where taken
test_subject <- scan("UCI HAR Dataset/test/subject_test.txt",integer())
train_subject <- scan("UCI HAR Dataset/train/subject_train.txt",integer())

#Contains the names of the variables measured or derived
features <- read.table("UCI HAR Dataset/features.txt",col.names = c("id","feature"), stringsAsFactors = FALSE)

#Dataset of the test individuals
test_df <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
train_df <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)

#Contains the label of each observation of the data set i.e. type of experiment
test_labels <- scan("UCI HAR Dataset/test/y_test.txt", integer())
train_labels <- scan("UCI HAR Dataset/train/y_train.txt", integer())

#Tidy labels variable
labels$label <- sub("_","",tolower(labels$label))
test_labels <- factor(test_labels,levels = labels$level, labels = labels$label)
train_labels <- factor(train_labels,levels = labels$level, labels = labels$label)

#Convert test df to tbl_df
test_tbl_df <- tbl_df(test_df)
train_tbl_df <- tbl_df(train_df)

#adding the respective subject and activity columns to the dataset
test_tbl_df <- mutate(test_tbl_df, activity = test_labels, subject = test_subject)
train_tbl_df <- mutate(train_tbl_df, activity = train_labels, subject = train_subject)

#Merges the train and test datasets into one
uci_har <- merge(test_tbl_df,train_tbl_df, all = TRUE)

#Subsets for the mean and standard deviation variables. To avoid angle() related 
#columns (the ones with mean on their name) the regular expression [.?] is used
col_new_df <- grepl("mean[.?]()|std[.?]()",names(uci_har))

#We add the columns of activity and subject to the subsetting vector
col_new_df[length(col_new_df)] <- TRUE
col_new_df[length(col_new_df)-1] <- TRUE

#Subsets accordingly and transform the data into a tbl df format
mean_std_df <- tbl_df(uci_har[,col_new_df])

#Assings the names of our dataset and tidies up the name of the columns
namesdf <- names(mean_std_df)
namesdf <- gsub("^t","time",namesdf)
namesdf <- gsub("^f","frequency",namesdf)
namesdf <- gsub("Acc","Accelerometer",namesdf)
namesdf <- gsub("Gyro","Gyroscope",namesdf)
namesdf <- gsub("Mag","Magnitude",namesdf)
namesdf <- gsub("\\.mean\\.\\.","Mean",namesdf)
namesdf <- gsub("\\.std\\.\\.","Stdev",namesdf)
namesdf <- gsub("\\.","",namesdf)
names(mean_std_df) <- namesdf

#Now that the data set is finally clean we subset by subject and activity and create the mean of the variables dataset
tidy_df <- group_by(mean_std_df, subject, activity) %>% summarise_each(funs(mean))
write.table(tidy_df, file = "tidy_dataset.txt", row.names = FALSE)

#Clean the memory of all but the tidy dataset of point 5
rm(labels,test_subject,train_subject,features,test_df,train_df,test_labels,train_labels,test_tbl_df,train_tbl_df,uci_har,col_new_df,mean_std_df,namesdf)