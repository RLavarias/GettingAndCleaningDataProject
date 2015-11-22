#Install Necessary Package
install.packages("data.table")
install.packages("reshape2")

#Load the necessary packages
library("data.table")
library("reshape2")

#Load the features, will use as columns for table
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

#Obtain data that is only the mean and the standard deviation for each measurment
data_features <- grepl("mean|std", features)

#Load the activity labels text file for the table
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

#Load X and Y test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#Load subject test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(X_test) = features

#Use data_features to extract measurements of the mean and standard devation
X_test = X_test[,data_features]

#Apply activity labels to test data
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

#Bind the data sets together
data_test <- cbind(as.data.table(subject_test), y_test, X_test)

#Load training data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#Load subject training data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(X_train) = features

#Use data_features to obtain measurements of the mean and standard deviation
X_train = X_train[, data_features]

#Apply activity labels to train data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

#Bind training data
data_train <- cbind(as.data.table(subject_train), y_train, X_train)

#Merge the data!
data = rbind(data_test, data_train)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

#Use the dcast function to the apply the mean function to the data set
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt")
