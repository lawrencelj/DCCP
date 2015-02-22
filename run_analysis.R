# PrepareData() download required data as rawData.zip and  
# create a temporary folder call "temporaryFolder" right under
# the working directory and unzip the file to this folder 

## Define Freequent use static varuables
rawDataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
rawDataFolder <-"rawDataFolder"
rawDataFile   <- "rawData.zip"
temporaryFolder <-"tmpFolder"
downloadMethod  <- "curl"
rawDataRoot <-"./tmpFolder/UCI HAR Dataset"
rawTrainPath <-paste(rawDataRoot,"train",sep="/")
rawTestPath  <-paste(rawDataRoot,"test",sep="/")


## Data File paths
rawTrainData <-paste(rawTrainPath,"X_train.txt",sep="/")
rawTestData  <-paste(rawTestPath,"X_test.txt",sep="/")
rawTrainLable <-paste(rawTrainPath,"Y_train.txt",sep="/")
rawTestLable  <-paste(rawTestPath,"Y_test.txt",sep="/")
trainSubject <-paste(rawTrainPath,"subject_train.txt",sep="/")
testSubject  <-paste(rawTestPath,"subject_test.txt",sep="/")

## request 4: lable valuables: column names
colLable <- "Activies"
colSubject <- "Subject"
colNameFilePath <- paste(rawDataRoot,"features.txt",sep="/")

### Getting column names for data from feature files
colDataName <- read.table(colNameFilePath,col.names=c("ID","Feature.Name"))[,"Feature.Name"]

## request 3: change the activities to name instead of number
activitiesFile <- paste(rawDataRoot,"activity_labels.txt",sep="/")

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
mergeData <-function(train=rawTrainPath,test=rawTestPath,destFolder=rawDataFolder)
{
  
  trainFilesNumber <- empty  # Number of training files in directory
  testFilesnumber  <- empty  # Number of Testing files in directory
  trainFilesList   <- list.files(train) # getting file list
  testFilesList    <- list.files(test)  # Same as above


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
  rawTrain<-cbind(read.table(trainSubject,col.names=colSubject),
                  read.table(rawTrainLable,col.names=colLable),
                    read.table(rawTrainData,col.names=colDataName))
  summary(rawTrain)
}