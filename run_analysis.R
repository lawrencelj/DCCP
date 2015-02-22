# PrepareData() download required data as rawData.zip and  
# create a temporary folder call "temporaryFolder" right under
# the working directory and unzip the file to this folder 

## Define Freequent use static varuables
rawDataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
rawDataFolder <-"rawDataFolder"
rawDataFile   <- "rawData.zip"
temporaryFolder <-"tmpFolder"
downloadMethod  <- "curl"
rawTrainPath <-"./tmpFolder/UCI HAR Dataset/train"
rawTestPath  <- "./tmpFolder/UCI HAR Dataset/test"
rawTrainDataFolder <-"./tmpFolder/UCI HAR Dataset/train/Inertial Signals"
rawTestDataFolder  <- "./tmpFolder/UCI HAR Dataset/test/Inertial Signals"

## Data File name
trainX <-"X_train.txt"
testX  <-"X_test.txt"
trainY <-"Y_train.txt"
testY  <-"Y_test.txt"
trainSubject <-"subject_train.txt"
testSubject  <-"subject_test.txt"

## Training Data Set
rawTrainBodyAccX <-"body_acc_x_train.txt"
rawTrainBodyAccY <-"body_acc_y_train.txt"
rawTrainBodyAccZ <-"body_acc_z_train.txt"

rawTrainBodyGyroX <-"body_gyro_x_train.txt"
rawTrainBodyGyroY <-"body_gyro_y_train.txt"
rawTrainBodyGyroZ <-"body_gyro_z_train.txt"

rawTrainTotalX <-"total_acc_x_train.txt"
rawTrainTotalY <-"total_acc_y_train.txt"
rawTrainTotalZ <-"total_acc_z_train.txt"

## Testing Data Set
rawTestBodyAccX <-"body_acc_x_test.txt"
rawTestBodyAccY <-"body_acc_y_test.txt"
rawTestBodyAccZ <-"body_acc_z_test.txt"

rawTestBodyGyroX <-"body_gyro_x_test.txt"
rawTestBodyGyroY <-"body_gyro_y_test.txt"
rawTestBodyGyroZ <-"body_gyro_z_test.txt"

rawTestTotalX <-"total_acc_x_test.txt"
rawTestTotalY <-"total_acc_y_test.txt"
rawTestTotalZ <-"total_acc_z_test.txt"


empty <-0
 
prepareData <-function(url=rawDataURL,destFile=rawDataFile,unzipFolder=temporaryFolder)
{

  ### checking if files and folders are exist, create the folder if not 

  if(file.exists(destFile) & file.info(destFile)$size > empty)
  {
   message("file already exists.")      
  }else
  {
    download.file(url,destFile,method<-downloadMethod)
  }
  
  if(file.info(destFile)$size<=empty)
  {
    stop("Failed on downloading data")
  }
  if(!file.exists(unzipFolder))
  {
    dir.create(unzipFolder)
  }
  
  ### unzip the file, file will be overwrited if exists
  unzip(destFile,exdir=unzipFolder)
  if(length(list.files(unzipFolder))>empty)
  {
    message("Data retrival and unzip process is finished successfully")
  }else
  {
    message("Unzip folder empty, please check download file integrety")
  }
}

## this function will merge Train and Test data set to 
## new working folder. 
## 1. Training and Testing Data set will be read into
##    separate dataset then will be merge together
## 2. Merge dataset will be place in RawData Folder
## 
MergeData <-function(train=rawTrainPath,test=rawTestPath,destFolder=rawDataFolder)
{
  
  trainFilesNumber <- empty  # Number of training files in directory
  testFilesnumber  <- empty  # Number of Testing files in directory
  trainFilesList   <- list.files(train) # getting file list
  testFilesList    <- list.files(test)  # Same as above
  trainDF
  testDF

  ### Checking if target source folders and files exist
  if(file.exists(train))
  {
    trainFilesNumber <- length(trainFilesList)
    if(trainFilesNumber<=empty)
    {
      stop("Training data set folder is empty, please ensure data files have not been removed")
    }
  }
  if(file.exists(test))
  {
    testFilesnumber<- length(testFilesList)   
    if(testFilesnumber<=empty)
    {
      stop("Testing data set folder is empty, please ensure data files have not been removed")    
    }
  }
 
  ### Ensure destination data folder exists
  if(!file.exists(destFolder))
  {
    dir.create(destFolder)
  }

  ### Construct DataFram/DataTable 
  
  
}