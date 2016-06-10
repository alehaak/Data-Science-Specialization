#Question 1
    fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
    data = './data/data.csv'
    download.file(fileurl, data)
    data1 <- read.csv(data)
    wtgp <- names(data1)
    strsplit(wtgp, 'wtgp')[123]

#strsplit(names(read.csv(download.file(fileUrl, './data/data.csv'))), 'wtgp')[123]
    
    
#Question 2 & 3
    # download data
        file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
        file.dest <- 'GDP4.csv'
    ##download.file(file.url, file.dest, method='wget')
        download.file(file.url, file.dest)
    # read the data
        GDP <- read.csv(file.dest, skip=4, nrows=190)
    # substitute comma's out
        GDPdol <- gsub(",", "", GDP$X.4)
    # convert to integer and calculate mean
        GDPdol <- as.integer(GDPdol)
        mean(GDPdol, na.rm=TRUE)
    # attach the GDP data frame
        attach(GDP)
        grep("^United",GDP$V4)

#Question 4
    # download data and load it
        file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
        file.dest <- 'GDP4.csv'
        download.file(file.url, file.dest)
        GDP <- read.csv(file.dest, skip=4, nrows=190)
        file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
        file.dest <- 'edu.csv'
        download.file(file.url, file.dest)
        edu <- read.csv(file.dest)

    # merge the datasets
        merged <- merge(GDP, edu, by.x = 'X', by.y = 'CountryCode')

    # extract the information
        fy.june <- grep('Fiscal year end: June', merged$Special.Notes)
        length(fy.june)

# Question 5
    # install the quantmod package
        install.packages('quantmod')
        library(quantmod)
    # load Amazon stock data
        amzn = getSymbols("AMZN",auto.assign=FALSE)
    
    # extract the index
        sampleTimes = index(amzn) 
    
    # create logical for year 2012
        year2012 <- grepl('2012-*', sampleTimes)
    
    # count 2012 observations (i.e. true)
        table(year2012)
    
    # subset based on 2012
        sampleTimes2012 <- subset(sampleTimes, year2012)
    
    # convert to day of week
        day <- format(sampleTimes2012, '%A')
    
    # count each day
        table(day)
