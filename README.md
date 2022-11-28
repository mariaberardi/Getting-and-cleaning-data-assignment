# Getting and cleaning data assignment

This repository contains my work for the course project *Getting and cleaning the Data*. It includes the following files, according to the instructions for the assignment:

README.md
run_analysis.R
tidy_data.txt
CodeBook.md

The run_analysis.R file can be used to get and clean data from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Instructions to use the provided R script 

1.Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip to desired working directory. Use the default name of the folder.

3.Install the dplyr package typing install.package("dplyr") 

4.Run run_analysis.R to obtain the tidy_data.txt file. The user will need to modify the paths where stated in the comments. The output file is provided in this repository as well. Details of the variables in this file, as well as the transformations performed to the original dataset, are described in the CodeBook.md file. 
