# Smartphone_Data_Analysis

These data were derived from the materials below:

Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket
of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer
and gyroscope, we captured 3-axial linear acceleration and 3-axial
angular velocity at a constant rate of 50Hz. The experiments have
been video-recorded to label the data manually. The obtained dataset
has been randomly partitioned into two sets, where 70% of the volunteers
was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed
by applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal,
which has gravitational and body motion components, was separated using
a Butterworth low-pass filter into body acceleration and gravity. The 
gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window,
a vector of features was obtained by calculating variables from the time
and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the 
												estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Code Book:

UNITS:

Note:  All features were normalized and set in a range from -1 to 1.

The values of variables of that represent mean or standard deviation values were
captured from the data set. These include values of body acceleration, acceleration
due to gravity, jerk (the derivative of acceleration), and rotational factors
from the gyroscope on the smartphone. Parameters in the time domain or frequency domain
(after Fourier transform) were determined.  The final two terms in each variable
name refers to mean versus standard deviation and time versus frequency domain.

Additional variables are subject number and activity (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Variables:

Subject
Activity
Body_Acceleration_X_Mean_Time
Body_Acceleration_Y_Mean_Time
Body_Acceleration_Z_Mean_Time
Gravity_Acceleration_X_Mean_Time
Gravity_Acceleration_Y_Mean_Time
Gravity_Acceleration_Z_Mean_Time
Body_Acceleration_Jerk_X_Mean_Time
Body_Acceleration_Jerk_Y_Mean_Time
Body_Acceleration_Jerk_Z_Mean_Time
Body_Gyroscope_X_Mean_Time
Body_Gyroscope_Y_Mean_Time
Body_Gyroscope_Z_Mean_Time
Body_Gyroscope_Jerk_X_Mean_Time
Body_Gyroscope_Jerk_Y_Mean_Time
Body_Gyroscope_Jerk_Z_Mean_Time
Body_Acceleration_Magnitude_Mean_Time
Gravity_Acceleration_Magnitude_Mean_Time
Body_Acceleration_Jerk_Magnitude_Mean_Time
Body_Gyroscope_Magnitude_Mean_Time
Body_Gyroscope_Jerk_Magnitude_Mean_Time
Body_Acceleration_X_Mean_Frequency
Body_Acceleration_Y_Mean_Frequency
Body_Acceleration_Z_Mean_Frequency
Body_Acceleration_Jerk_X_Mean_Frequency
Body_Acceleration_Jerk_Y_Mean_Frequency
Body_Acceleration_Jerk_Z_Mean_Frequency
Body_Gyroscope_X_Mean_Frequency
Body_Gyroscope_Y_Mean_Frequency
Body_Gyroscope_Z_Mean_Frequency
Body_Acceleration_Magnitude_Mean_Frequency
Body_Acceleration_Jerk_Magnitude_Mean_Frequency
Body_Gyroscope_Magnitude_Mean_Frequency
Body_Gyroscope_Jerk_Magnitude_Mean_Frequency
Body_Acceleration_X_StdDev_Time
Body_Acceleration_Y_StdDev_Time
Body_Acceleration_Z_StdDev_Time
Gravity_Acceleration_X_StdDev_Time
Gravity_Acceleration_Y_StdDev_Time
Gravity_Acceleration_Z_StdDev_Time
Body_Acceleration_Jerk_X_StdDev_Time
Body_Acceleration_Jerk_Y_StdDev_Time
Body_Acceleration_Jerk_Z_StdDev_Time
Body_Gyroscope_X_StdDev_Time
Body_Gyroscope_Y_StdDev_Time
Body_Gyroscope_Z_StdDev_Time
Body_Gyroscope_Jerk_X_StdDev_Time
Body_Gyroscope_Jerk_Y_StdDev_Time
Body_Gyroscope_Jerk_Z_StdDev_Time
Body_Acceleration_Magnitude_StdDev_Time
Gravity_Acceleration_Magnitude_StdDev_Time
Body_Acceleration_Jerk_Magnitude_StdDev_Time
Body_Gyroscope_Magnitude_StdDev_Time
Body_Gyroscope_Jerk_Magnitude_StdDev_Time
Body_Acceleration_X_StdDev_Frequency
Body_Acceleration_Y_StdDev_Frequency
Body_Acceleration_Z_StdDev_Frequency
Body_Acceleration_Jerk_X_StdDev_Frequency
Body_Acceleration_Jerk_Y_StdDev_Frequency
Body_Acceleration_Jerk_Z_StdDev_Frequency
Body_Gyroscope_X_StdDev_Frequency
Body_Gyroscope_Y_StdDev_Frequency
Body_Gyroscope_Z_StdDev_Frequency
Body_Acceleration_Magnitude_StdDev_Frequency
Body_Acceleration_Jerk_Magnitude_StdDev_Frequency
Body_Gyroscope_Magnitude_StdDev_Frequency
Body_Gyroscope_Jerk_Magnitude_StdDev_Frequency
