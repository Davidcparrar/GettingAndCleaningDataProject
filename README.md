***
# Getting and Cleaning Data course project #
***

## This Repo contains the following files ##

- "run_analisis.R" : script that contains all the process to clean up the Human Activity Recognition Using Smartphones Dataset Version 1.0*

- "code_book.R" : script that creates the file "CodeBook.md" (Usage: source("code_book.R"); code_book(tidy_df))

- "CodeBook.md" : File that contains the variables of the dataset that the file "run_analysis.R" generates

- "tidy_dataset.txt" : File that contains the dataset generated with the "run_analysis.R" script
***
## Requirements ##

All scripts and files where created under Rstudio and platform:

> R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"  
> Copyright (C) 2016 The R Foundation for Statistical Computing  
> Platform: x86_64-w64-mingw32/x64 (64-bit)  
> Running under: Windows >= 8 x64 (build 9200)

Raw data was obtained from the UCI machine learning repository from the coursera link [Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), for more information on the raw dataset please refer to [UCI machine learning repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), or the authors of the study:

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The package dplyr was used for some of the data manipulation under the verision

> dplyr package -> version dplyr_0.5.0

Once the data is downloaded the script "run_analysis.R" should be in the same folder where the "UCI HAR Dataset"" (Root of the data) folder is, i.e. if the dir() command is typed in R the items "UCI HAR Dataset" and "run_analysis.R"  should be visible

***
## Data transformation ##

The tidy data set was obtain using the script "run_analysis.R" (Usage: source("run_analysis.R"))

- First it was checked if the dplyr was loaded in the R enviroment.

```ruby
packages <- search()
if(sum(grepl("package::dplyr", packages)) == 0) library(dplyr)
```
- The raw data was read using the commands scan (for single column files, e.g. features.txt) and read.table (for multiple column files, e.g. X_test.txt)

- The appropiate labels (column names) were imported from the features.txt file and the activity integers were converted into factors (walking, sitting, etc.)

- Using the mutate function the variables subject and activity were added to both raw data sets:

```ruby
test_tbl_df <- mutate(test_tbl_df, activity = test_labels, subject = test_subject)
train_tbl_df <- mutate(train_tbl_df, activity = train_labels, subject = train_subject)
```
- With the appropiate label names and complete columns the data sets were combined into one big data set:

```ruby
uci_har <- merge(test_tbl_df,train_tbl_df, all = TRUE)
```

- A subsetting vector col_new_df was created to obtain only the mean and standard deviation of the measurements (mean_std_df data set). Special care was taken in the regular expression given the fact that some measurements had the word mean on them but were not the mean() or std() of a measurement, e.g. meanFreq() and the angle() related variables (See file features_info.txt in the raw data set). Both the activity and subject columns were manualy included in the subsetting vector: 

```ruby
col_new_df <- grepl("mean[.?]()|std[.?]()",names(uci_har))
```

- The names of the variables were tidied up according to the [lower camel case][1] and the data set of the mean value of the variables grouped by activity and subject (tidy_df) was created and written into the file tidy_dataset.txt.

```ruby
tidy_df <- group_by(mean_std_df, subject, activity) %>% summarise_each(funs(mean))
write.table(tidy_df, file = "tidy_dataset.txt", row.names = FALSE)
```

[1]: https://journal.r-project.org/archive/2012-2/RJournal_2012-2_Baaaath.pdf  "The State of Naming Conventions in R"