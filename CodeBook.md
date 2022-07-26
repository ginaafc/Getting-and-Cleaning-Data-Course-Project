# Code book

  **First Step:** Download the file and unzip it.
  
  **Second Step:** Read the data, which includes the following: 
    1. activity_labels.txt: contains information of the activity names, important to link the data by the code of the activity.
    2. features.txt: contins the name of the variables, in this section some names are adjusted in order to have descriptive variable names.
    3. Test (X_test,y_test, subject_test) an train (X_train,y_train, subject_train) files: The 'X files' contains recorded features test data, the 'y files' contains test data of activities’code labels and the 'subject files' contains data of the volunteer subjects being observed.

  **Third Step:** Merging the data
    1. Merging information of the Test files(X_test,y_test, subject_test)
    2. Merging information of the Train files(X_train,y_train, subject_train)
    3. Merging information of the Train and test files.
    4. Merging the information from the point 3 with the information of activities, by the code of the activity.
    
  **Fourth Step:** Keeping only means and standard deviation for each measurement, which results on the first tidy data named "data1".
  
  **Fifth Step:** Getting average of each variable for each activity and each subject, which results on the second tidy data named "data2".
  
  **Sixth Step:** Remove data and variables created, keeping only the outputs (data1 y data2).
  
  **Seventh Step:** Save the data in TXT files