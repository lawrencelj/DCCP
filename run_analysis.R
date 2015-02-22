# PrepareData() download required data as rawData.zip and  
# create a temporary folder call "temporaryFolder" right under
# the working directory and unzip the file to this folder 

## Define Freequent use static varuables
rawDataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
rawDataFolder <-"rawDataFolder"
rawDataFile <- "rawData.zip"
temporaryFolder <-"tmpFolder"
downloadMethod <- "curl"
trainDataPath <-"./tmpFolder/UCI HAR Dataset/train"
testDataPath <- "./tmpFolder/UCI HAR Dataset/test"
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
## 1. Folder will be merged to a new folder.
## 2. Files will be merged into 1 files if names are same. 
## 3. If there is file has no matching one in either folder
##    it will simply be copied over.
## 4. Data in file will be merge to 1 if all records are
##    the same, otherwise will be treat as 2 different 
##    records.

MergeData <-function(train=trainDataPath,test=testDataPath,destFolder=rawDataFolder)
{
  
  trainFilesNumber <- empty
  testFilesnumber  <- empty
  trainFilesList   <- list.files(train)
  testFilesList    <- list.files(test)
  trainXMergeDF
  testXMergeDF
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

  
  
}