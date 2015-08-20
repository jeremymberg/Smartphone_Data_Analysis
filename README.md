# Smartphone_Data_Analysis
For materials for Getting and Cleaning Data course project with Smartphone data

Initial data were downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The function run_analysis first reads the data with the function
generate_smartphone_dataframe.

This reads in the test and train data sets into data frames (with function read_data), merges these data frames,
selects the columns with mean or standard deviation values (with 
function Get_columns_with_names), converts the Activity variable from numbers
to descriptive names (with function Convert_Activity_to_Name), and gives the columns
descriptive names.

The final data frame have 67 columns.

run_analysis then sorts and summarizes the data to generate means for each subject
and for each activity. This is output as a single tidy table.




