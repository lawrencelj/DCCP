This Script has 3 methods:

prepareData()
reshapData()
getTidyData()

to run the script, it requires only running the getTidayData(). which basicly running prepareData() and reshapData() in order.

prepareData() download required data by project as rawData.zip and create a temporary folder call "temporaryFolder" right under the working directory and unzip the file to this folder.

reshapData() will work as following order:
1. It reads the activites lable data and replace all ID with activities name from train and test data set respectively. 
2. It then reads raw data with required columns which manually selected as numberic factors
3. All above datas will be combinded with subjects lable data
4. melt function is used to preparing a temporary dataset for creation of tidy data
5. tapply mean function to temporary dataset , we get the tidy data.