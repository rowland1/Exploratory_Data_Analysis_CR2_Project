getwd()

#download files#

fileUrl <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
d <-"Dataset.zip"
if (!file.exists("./data")) {dir.create("./data")}
download.file(fileUrl,file.path("./data",d))

#Unzip files#
unzip("./data/Dataset.zip")

#set reusable input path#
pathmain <- file.path("./NEI_dataset")
list.files()

