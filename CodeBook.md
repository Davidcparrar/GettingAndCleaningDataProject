tidy_df dataset {datasets}
# Mean Value of the Human Activity Recognition Using Smartphones Dataset
## Description
The data was obtained from the Human Activity Recognition Using Smartphones Dataset and corresponds to the mean value of 66 variables from an experiment of  30 volunteers (subjetcs) within an age bracket of 19-48 years. Each person performed six activities (walking, walkingupstairs, walkingdownstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Originaly the experiment performed measurments (signals) on the 30 subjects with an accelerometer and a gyroscope. The raw data was tidied up and processed for this dataset
## Usage
to obtain the data set run the following command:

  source("run_analysis.R")

 The data set will be store in the data set tidy_df

## Format
A data frame with  180  observations on  68  variables    

&nbsp;&nbsp;[,1] | subject | integer    
&nbsp;&nbsp;[,2] | activity | factor    
&nbsp;&nbsp;[,3] | timeBodyAccelerometerMeanX | numeric    
&nbsp;&nbsp;[,4] | timeBodyAccelerometerMeanY | numeric    
&nbsp;&nbsp;[,5] | timeBodyAccelerometerMeanZ | numeric    
&nbsp;&nbsp;[,6] | timeBodyAccelerometerStdevX | numeric    
&nbsp;&nbsp;[,7] | timeBodyAccelerometerStdevY | numeric    
&nbsp;&nbsp;[,8] | timeBodyAccelerometerStdevZ | numeric    
&nbsp;&nbsp;[,9] | timeGravityAccelerometerMeanX | numeric    
&nbsp;&nbsp;[,10] | timeGravityAccelerometerMeanY | numeric    
&nbsp;&nbsp;[,11] | timeGravityAccelerometerMeanZ | numeric    
&nbsp;&nbsp;[,12] | timeGravityAccelerometerStdevX | numeric    
&nbsp;&nbsp;[,13] | timeGravityAccelerometerStdevY | numeric    
&nbsp;&nbsp;[,14] | timeGravityAccelerometerStdevZ | numeric    
&nbsp;&nbsp;[,15] | timeBodyAccelerometerJerkMeanX | numeric    
&nbsp;&nbsp;[,16] | timeBodyAccelerometerJerkMeanY | numeric    
&nbsp;&nbsp;[,17] | timeBodyAccelerometerJerkMeanZ | numeric    
&nbsp;&nbsp;[,18] | timeBodyAccelerometerJerkStdevX | numeric    
&nbsp;&nbsp;[,19] | timeBodyAccelerometerJerkStdevY | numeric    
&nbsp;&nbsp;[,20] | timeBodyAccelerometerJerkStdevZ | numeric    
&nbsp;&nbsp;[,21] | timeBodyGyroscopeMeanX | numeric    
&nbsp;&nbsp;[,22] | timeBodyGyroscopeMeanY | numeric    
&nbsp;&nbsp;[,23] | timeBodyGyroscopeMeanZ | numeric    
&nbsp;&nbsp;[,24] | timeBodyGyroscopeStdevX | numeric    
&nbsp;&nbsp;[,25] | timeBodyGyroscopeStdevY | numeric    
&nbsp;&nbsp;[,26] | timeBodyGyroscopeStdevZ | numeric    
&nbsp;&nbsp;[,27] | timeBodyGyroscopeJerkMeanX | numeric    
&nbsp;&nbsp;[,28] | timeBodyGyroscopeJerkMeanY | numeric    
&nbsp;&nbsp;[,29] | timeBodyGyroscopeJerkMeanZ | numeric    
&nbsp;&nbsp;[,30] | timeBodyGyroscopeJerkStdevX | numeric    
&nbsp;&nbsp;[,31] | timeBodyGyroscopeJerkStdevY | numeric    
&nbsp;&nbsp;[,32] | timeBodyGyroscopeJerkStdevZ | numeric    
&nbsp;&nbsp;[,33] | timeBodyAccelerometerMagnitudeMean | numeric    
&nbsp;&nbsp;[,34] | timeBodyAccelerometerMagnitudeStdev | numeric    
&nbsp;&nbsp;[,35] | timeGravityAccelerometerMagnitudeMean | numeric    
&nbsp;&nbsp;[,36] | timeGravityAccelerometerMagnitudeStdev | numeric    
&nbsp;&nbsp;[,37] | timeBodyAccelerometerJerkMagnitudeMean | numeric    
&nbsp;&nbsp;[,38] | timeBodyAccelerometerJerkMagnitudeStdev | numeric    
&nbsp;&nbsp;[,39] | timeBodyGyroscopeMagnitudeMean | numeric    
&nbsp;&nbsp;[,40] | timeBodyGyroscopeMagnitudeStdev | numeric    
&nbsp;&nbsp;[,41] | timeBodyGyroscopeJerkMagnitudeMean | numeric    
&nbsp;&nbsp;[,42] | timeBodyGyroscopeJerkMagnitudeStdev | numeric    
&nbsp;&nbsp;[,43] | frequencyBodyAccelerometerMeanX | numeric    
&nbsp;&nbsp;[,44] | frequencyBodyAccelerometerMeanY | numeric    
&nbsp;&nbsp;[,45] | frequencyBodyAccelerometerMeanZ | numeric    
&nbsp;&nbsp;[,46] | frequencyBodyAccelerometerStdevX | numeric    
&nbsp;&nbsp;[,47] | frequencyBodyAccelerometerStdevY | numeric    
&nbsp;&nbsp;[,48] | frequencyBodyAccelerometerStdevZ | numeric    
&nbsp;&nbsp;[,49] | frequencyBodyAccelerometerJerkMeanX | numeric    
&nbsp;&nbsp;[,50] | frequencyBodyAccelerometerJerkMeanY | numeric    
&nbsp;&nbsp;[,51] | frequencyBodyAccelerometerJerkMeanZ | numeric    
&nbsp;&nbsp;[,52] | frequencyBodyAccelerometerJerkStdevX | numeric    
&nbsp;&nbsp;[,53] | frequencyBodyAccelerometerJerkStdevY | numeric    
&nbsp;&nbsp;[,54] | frequencyBodyAccelerometerJerkStdevZ | numeric    
&nbsp;&nbsp;[,55] | frequencyBodyGyroscopeMeanX | numeric    
&nbsp;&nbsp;[,56] | frequencyBodyGyroscopeMeanY | numeric    
&nbsp;&nbsp;[,57] | frequencyBodyGyroscopeMeanZ | numeric    
&nbsp;&nbsp;[,58] | frequencyBodyGyroscopeStdevX | numeric    
&nbsp;&nbsp;[,59] | frequencyBodyGyroscopeStdevY | numeric    
&nbsp;&nbsp;[,60] | frequencyBodyGyroscopeStdevZ | numeric    
&nbsp;&nbsp;[,61] | frequencyBodyAccelerometerMagnitudeMean | numeric    
&nbsp;&nbsp;[,62] | frequencyBodyAccelerometerMagnitudeStdev | numeric    
&nbsp;&nbsp;[,63] | frequencyBodyBodyAccelerometerJerkMagnitudeMean | numeric    
&nbsp;&nbsp;[,64] | frequencyBodyBodyAccelerometerJerkMagnitudeStdev | numeric    
&nbsp;&nbsp;[,65] | frequencyBodyBodyGyroscopeMagnitudeMean | numeric    
&nbsp;&nbsp;[,66] | frequencyBodyBodyGyroscopeMagnitudeStdev | numeric    
&nbsp;&nbsp;[,67] | frequencyBodyBodyGyroscopeJerkMagnitudeMean | numeric    
&nbsp;&nbsp;[,68] | frequencyBodyBodyGyroscopeJerkMagnitudeStdev | numeric    

## Source
The variables for this data set come from the the coursera link [Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), for more information on the raw dataset please refer to [UCI machine learning repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), or the authors of the study:
> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012