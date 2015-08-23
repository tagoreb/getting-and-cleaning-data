### Code Book

# run_analysis.R script does the following.

1.  Read all required datasets into below mentioned R objects.
    *  features  <- holding the data from features.txt
    *  activity.labels <- holding the data from activity_labels.txt

    *  train <- holding the data from X_train.txt 
    *  train.activityid <- holding the data from Y_train.txt
    *  train.subject <- holding the data from subject_train.txt
    *  train.data <- holding the combined columns data from train, train.activityid, train.subject objects
    
    *  test <- holding the data from X_test.txt 
    *  test.activityid <- holding the data from Y_test.txt
    *  test.subject <- holding the data from subject_test.txt
    *  test.data <- holding the combined columns data from test, test.activityid, test.subject objects

2.  Merges the training and the test sets to create one data set.

    *  train.test <- gets the data from both data sets train.data & test.data objects
    
3.  Limit the columns to mean and std measurements from features object.

    *  mean_and_std <- holding the indexes of the measurements which are having either mean() or std() from features object
    *  train.test <- tranformed to having only sub set of columns identified from mean_and_std object
    
4.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

    *  average.data <- holding the column means for the each combination of subject and activity variables.
    
5.  Cleans the R objects.