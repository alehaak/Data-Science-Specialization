# CodeBook

* Data merged using the `rbind()` function.
* Only columns with mean and standard deviation measures taken from dataset, names fixed using `features.txt`.
* As activity data is addressed with values 1:6, we take the activity names and IDs from `activity_labels.txt` and they are substituted in the dataset.

* On the whole dataset, those columns with vague column names are corrected.

* Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). 

The output file is called `averages_data.txt`, and uploaded to this repository.



# Variables


* `trainX`, `trainY`, `trainSubject`, `testX`, `testY`, and `testSubject` = data from the downloaded files.
* `dataX`, `dataY` and `dataSubject` merge of the previous datasets where:
    *dataX = trainX + testX
    *dataY = trainY + testY
    *dataSubject = trainSubject + testSubject
* `features` contains the fixed names for `dataX', applied to column names in `meanStd`.
* `activities` receive the same approach.
* `allData` merges `dataX`, `dataY` and `dataSubject` in one dataset.

* `averages_data` contains averages stored in a `.txt` file. 
* Function `ddply()` from package 'plyr' is used to apply `colMeans()`.
