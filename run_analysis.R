run_analysis <- function() {
##  Creates a tidy data set of UCI SmartPhone data by: (1) combining test and training
##  data sets; (2) selecting columns with mean or standard deviation values;
##  (3) includes descriptive names for the activities; (4) uses description names for
##  the column (variable) names; and (5) creates a second, tidy data frame with 
##  the average of each variable for each activity and each subject.
##
        library(dplyr)
##  Generate and read in data frame.
        Smartphone_Data <- generate_smartphone_dataframe()
##  Arrange by subject.
        Smartphone_Data <- arrange(Smartphone_Data, Subject)
##  Group by subject to prepare for summarise.
        Smartphone_Data_Subject <- group_by(Smartphone_Data, Subject)
##  Calculate means of all variables over all subjects. Note that this generates warnings
##  because activity names cannot be averaged but NA values are substituted as is appropriate.
        Smartphone_Data_Subject_Summary <- summarise_each(Smartphone_Data_Subject, funs(mean))
##  Arrange by activity.
        Smartphone_Data <- arrange(Smartphone_Data, Activity)
##  Group by activity to prepare for summarise.
        Smartphone_Data_Activity <- group_by(Smartphone_Data, Activity)
##  Calculate means of all variables over all activities.
        Smartphone_Data_Activity_Summary <- summarise_each(Smartphone_Data_Activity, funs(mean))
##  Replace mean subject values with NA.
        is.na(Smartphone_Data_Activity_Summary$Subject) <- TRUE
##  Bind two tables together to generate final tidy table.
        Smartphone_Data_Summary <- rbind(Smartphone_Data_Subject_Summary,
                Smartphone_Data_Activity_Summary)        
}       
        
generate_smartphone_dataframe <- function() {
##  Creates a tidy data set of UCI SmartPhone data by: (1) combining test and training
##  data sets; (2) selecting columns with mean or standard deviation values;
##  (3) includes descriptive names for the activities; (4) uses description names for
##  the column (variable) names

##  Set working directory
        setwd("~/Data_Science_Course/UCI_HAR_Dataset")
##  Read features.txt for column names
        features <- read.table("features.txt")[, 2]
##  Read data from test subjects
        Smartphone_Data_test <- read_data("test", features)
##  Read data from training subjects
        Smartphone_Data_train <- read_data("train", features)
##  Merge two data sets
        Smartphone_Data_all <- rbind(Smartphone_Data_test, Smartphone_Data_train)
##  Remove columns that contain the term bandsEnergy since these are problematic
##  and not require for further analysis. These are in columns 463 to 504
        Smartphone_Data_all <- Smartphone_Data_all[ , c(1:462, 505:563)]
##  Find names for columns with mean() or std(). Note that a search for the substring
##  mean also captures meanFreq and these must be removed. Including ( in the search
## leads to an error message.
        Names_with_mean_all <- Get_columns_with_name(colnames(Smartphone_Data_all), "mean")
        Names_with_meanFreq <- Get_columns_with_name(colnames(Smartphone_Data_all), "meanFreq")
        Names_with_mean <- setdiff(Names_with_mean_all, Names_with_meanFreq)
        Names_with_std <- Get_columns_with_name(colnames(Smartphone_Data_all), "std")       
##  Combine lists and select columns including Subject and Activity
        Names_with_Subject_Activity_mean_std <- c("Subject", "Activity", 
                Names_with_mean, Names_with_std)
        Smartphone_Data_selected <- select(Smartphone_Data_all, 
                one_of(Names_with_Subject_Activity_mean_std))
##  Change names for Activities from numbers to descriptive names
        Activity_numbers <- as.integer(Smartphone_Data_selected$Activity)
        Activity_names <- sapply(Activity_numbers, Convert_Activity_to_Name)
##  Replace Activity numbers with names
        Smartphone_Data_selected[ , 2] <- Activity_names
##  Change names to more description names
        colnames(Smartphone_Data_selected) <- c("Subject", "Activity", 
                "Body_Acceleration_X_Mean_Time", "Body_Acceleration_Y_Mean_Time",
                "Body_Acceleration_Z_Mean_Time", "Gravity_Acceleration_X_Mean_Time",
                "Gravity_Acceleration_Y_Mean_Time", "Gravity_Acceleration_Z_Mean_Time",
                "Body_Acceleration_Jerk_X_Mean_Time", "Body_Acceleration_Jerk_Y_Mean_Time",
                "Body_Acceleration_Jerk_Z_Mean_Time", "Body_Gyroscope_X_Mean_Time",
                "Body_Gyroscope_Y_Mean_Time", "Body_Gyroscope_Z_Mean_Time",
                "Body_Gyroscope_Jerk_X_Mean_Time", "Body_Gyroscope_Jerk_Y_Mean_Time",
                "Body_Gyroscope_Jerk_Z_Mean_Time", "Body_Acceleration_Magnitude_Mean_Time",
                "Gravity_Acceleration_Magnitude_Mean_Time", "Body_Acceleration_Jerk_Magnitude_Mean_Time",
                "Body_Gyroscope_Magnitude_Mean_Time", "Body_Gyroscope_Jerk_Magnitude_Mean_Time",
                "Body_Acceleration_X_Mean_Frequency", "Body_Acceleration_Y_Mean_Frequency",
                "Body_Acceleration_Z_Mean_Frequency", "Body_Acceleration_Jerk_X_Mean_Frequency",
                "Body_Acceleration_Jerk_Y_Mean_Frequency", "Body_Acceleration_Jerk_Z_Mean_Frequency",
                "Body_Gyroscope_X_Mean_Frequency", "Body_Gyroscope_Y_Mean_Frequency", 
                "Body_Gyroscope_Z_Mean_Frequency","Body_Acceleration_Magnitude_Mean_Frequency",
                "Body_Acceleration_Jerk_Magnitude_Mean_Frequency", "Body_Gyroscope_Magnitude_Mean_Frequency",
                "Body_Gyroscope_Jerk_Magnitude_Mean_Frequency", "Body_Acceleration_X_StdDev_Time",
                "Body_Acceleration_Y_StdDev_Time", "Body_Acceleration_Z_StdDev_Time",
                "Gravity_Acceleration_X_StdDev_Time", "Gravity_Acceleration_Y_StdDev_Time", 
                "Gravity_Acceleration_Z_StdDev_Time", "Body_Acceleration_Jerk_X_StdDev_Time", 
                "Body_Acceleration_Jerk_Y_StdDev_Time", "Body_Acceleration_Jerk_Z_StdDev_Time",
                "Body_Gyroscope_X_StdDev_Time", "Body_Gyroscope_Y_StdDev_Time", 
                "Body_Gyroscope_Z_StdDev_Time", "Body_Gyroscope_Jerk_X_StdDev_Time",
                "Body_Gyroscope_Jerk_Y_StdDev_Time", "Body_Gyroscope_Jerk_Z_StdDev_Time",
                "Body_Acceleration_Magnitude_StdDev_Time", "Gravity_Acceleration_Magnitude_StdDev_Time",
                "Body_Acceleration_Jerk_Magnitude_StdDev_Time", "Body_Gyroscope_Magnitude_StdDev_Time",
                "Body_Gyroscope_Jerk_Magnitude_StdDev_Time", "Body_Acceleration_X_StdDev_Frequency",
                "Body_Acceleration_Y_StdDev_Frequency", "Body_Acceleration_Z_StdDev_Frequency",
                "Body_Acceleration_Jerk_X_StdDev_Frequency", "Body_Acceleration_Jerk_Y_StdDev_Frequency",
                "Body_Acceleration_Jerk_Z_StdDev_Frequency", "Body_Gyroscope_X_StdDev_Frequency",
                "Body_Gyroscope_Y_StdDev_Frequency", "Body_Gyroscope_Z_StdDev_Frequency",
                "Body_Acceleration_Magnitude_StdDev_Frequency", "Body_Acceleration_Jerk_Magnitude_StdDev_Frequency",
                "Body_Gyroscope_Magnitude_StdDev_Frequency", "Body_Gyroscope_Jerk_Magnitude_StdDev_Frequency")
##  Output final data frame
        Smartphone_Data_selected
}
        
read_data <- function(subject_type, features_names) {
##  This function reads in the subject, activity, and data files based on the input
##  of type = test or type = train.
##
##  Set working directory and read test subject data
        wd_initial <- getwd()
        setwd(paste(wd_initial, "/", subject_type, sep = ""))
##  Subjects from subject_type.txt
        subject_file_name <- paste("subject_", subject_type, ".txt", sep = "")
        Subjects <- read.table(subject_file_name)
        colnames(Subjects) <- "Subject"
##  Activities from y_type.txt
        activities_file_name <- paste("y_", subject_type, ".txt", sep = "")
        Activities <- read.table(activities_file_name)
        colnames(Activities) <- "Activity"
##  Smartphone data from X_type.txt
        data_file_name <- paste("X_", subject_type, ".txt", sep = "")
        Smartphone_Data <- read.table(data_file_name)
##  Add column names from features_names
        colnames(Smartphone_Data) <- features_names
##  Bind Activities to Smartphone data
        Smartphone_Data <- cbind(Activities, Smartphone_Data)
##  Bind Subjects to Smartphone data
        Smartphone_Data <- cbind(Subjects, Smartphone_Data)
##  Reset working directory
        setwd(wd_initial)
        Smartphone_Data
}

Get_columns_with_name <- function(name_vec, test_name) {
##  Gets columns names that contain a given word.
##
        name_df <- data.frame(name_vec)
        names_out <- as.character((filter(name_df, grepl(test_name, name_vec)))$name_vec)
}

Convert_Activity_to_Name <- function(Activity_number) {
##  Converts numeric activity codes to descriptive activity labels (based on activity_label file)
##
        Activity_labels <- read.table("activity_labels.txt")
        colnames(Activity_labels) <- c("Number", "Name")
        Activity_name <- (filter(Activity_labels, Number == Activity_number))[1, 2]
        Activity_name <- as.character(Activity_name)
}