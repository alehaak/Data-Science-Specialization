#Getting and Cleaning Data Course Project
        library(plyr)
    
#1. Merge the training and test sets to create one data set
        trainX <- read.table("./data/train/X_train.txt")
        trainY <- read.table("./data/train/y_train.txt")
        trainSubject <- read.table("./data/train/subject_train.txt")
        
        testX <- read.table("./data/test/X_test.txt")
        testY <- read.table("./data/test/y_test.txt")
        subjecTest <- read.table("./data/test/subject_test.txt")

    #Create 'x', 'y' and 'subject' data sets
        dataX <- rbind(trainX, testX)
        dataY <- rbind(trainY, testY)
        dataSubject <- rbind(trainSubject, subjecTest)
    
#2. Extract only the measurements on the mean and standard deviation for each measurement
    #Creating 'features' dataset
        features <- read.table("./data/features.txt")
    #Get only columns with mean() or std() in their names
        meanStd <- grep("-(mean|std)\\(\\)", features[, 2])
    #Subset the desired columns
        dataX <- dataX[, meanStd]
    #Correct the column names
        names(dataX) <- features[meanStd, 2]

#3. Use descriptive activity names to name the activities in the data set
    #Creating 'activities' dataset     
        activities <- read.table("./data/activity_labels.txt")
    #Update values with correct activity names
        dataY[, 1] <- activities[dataY[, 1], 2]
    #Correct column name
        names(dataY) <- "activity"

#4. Appropriately label the data set with descriptive variable names
    #Correct column name
        names(dataSubject) <- "subject"
    
    #Bind all the data in a single data set
        all_data <- cbind(dataX, dataY, dataSubject)

#5. Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
    #66 <- 68 columns but last two (activity & subject)
        averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
        write.table(averages_data, "averages_data.txt", row.name=FALSE)
        