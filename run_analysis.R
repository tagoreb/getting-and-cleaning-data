##
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##


## step : Read all required datasets into R 

#set local path for features
path <- 'data/UCI HAR Dataset/'

#set file name; this is all measurements
f <- 'features.txt'

#read all features into R
features <- read.table(paste(path, f, sep=""), header=FALSE, sep="")

#give meaningful name for columns
names(features) <- c("measurementid", "measurementname")

#set file name; this is activity names
f <- 'activity_labels.txt'

#read activity names into R
activity.labels <- read.table(paste(path, f, sep=""), header=FALSE, sep="")

#give meaningful names for columns
names(activity.labels) <- c("activityid", "activityname")

#set local path for training data
path <- 'data/UCI HAR Dataset/train/'

#set file name; this is actual training data set
f <- 'X_train.txt'

#read training data into R
train <- read.table(paste(path, f, sep=""), header=FALSE, sep="")

#set file name; this is training activity ids
f <- 'Y_train.txt'

#read training activityids into R
train.activityid <- read.table(paste(path, f, sep=""), header=FALSE, sep="")

#set meaningful column name
names(train.activityid) <- c("activityid")

#set file name; this is training subjects
f <- 'subject_train.txt'

#read training subjects into R
train.subject <- read.table(paste(path, f, sep=""), header=FALSE, sep="")

#set meaningful column name
names(train.subject) <- c("subject")

#prepare training dataset
train.data <- cbind(train, train.activityid, train.subject)

#set local path for test dataset 
path <- 'data/UCI HAR Dataset/test/'

#set file name; this is actual test data set
f <- 'X_test.txt'

#read test data into R
test <- read.table(paste(path, f, sep=""), header=FALSE, sep="")

#set file name; this is test activity ids
f <- 'Y_test.txt'

#read test activityids into R
test.activityid <- read.table(paste(path, f, sep=""), header=FALSE, sep="")

#set meaningful column name
names(test.activityid) <- c("activityid")

#set file name; this is test subjects
f <- 'subject_test.txt'

#read test subjects into R
test.subject <- read.table(paste(path, f, sep=""), header=FALSE, sep="")

#set meaningful column name
names(test.subject) <- c("subject")

#prepare test dataset
test.data <- cbind(test, test.activityid, test.subject)

## Step 1.  Merges the training and the test sets to create one data set.

#merge training and test actual data sets into one
train.test <- rbind(train.data, test.data)

## Step2. limit the columns to mean and std measurements from features

#get only columns with mean() or std() in their names
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

#subset the columns along with activity & subject
train.test <- train.test[, c(mean_and_std, 562, 563)]

#load column names
names(train.test) <- features[mean_and_std, 2]

## Step 3. Uses descriptive activity names to name the activities in the data set
names(train.test)[67] <- "activityid"
names(train.test)[68] <- "subject"

## step 4. Appropriately labels the data set with descriptive variable names. 
#done already

## step 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#average of all measures based on subject and activitiyid
average.data <- ddply(train.test, .(subject, activityid), function(x) colMeans(x[, 1:66]))

#update values with correct activity names
average.data <- merge(activity.labels, average.data, by="activityid", sort = TRUE)

#writing to a file
write.table(average.data, "average_data.txt", row.name=FALSE)

#cleaning the datasets
rm(activity.labels, features)
rm(train, train.activityid, train.subject, train.data)
rm(test, test.activityid, test.subject, test.data)