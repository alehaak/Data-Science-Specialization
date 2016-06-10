rm(list=ls())
#Question 1
    #Apply strsplit() to split all the names of the data frame on the characters "wgtp". 
    #What is the value of the 123 element of the resulting list?
    #The code book, describing the variable names is here:
        #https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
    #Download and read data
        fileUrl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
        download.file(fileUrl, './data/W4Q1.csv')
        data1 <- read.csv("./data/W4Q1.csv")
    #Assign the data
        wtgp <- names(data1)
        strsplit(wtgp, "wtgp")[123]
    #Answer: 

#Question 2 & 3
    #Remove the commas from the GDP numbers in millions of dollars and average them.
    #Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table
    #In the data set from Question 2 what is a regular expression that would allow 
    #you to count the number of countries whose name begins with "United"? Assume 
    #that the variable with the country names in it is named countryNames. How many 
    #countries begin with United?
    #Download data
        fileUrl2 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
        download.file(fileUrl2, './data/W4Q2.csv')
    #Read the data
        GDP <- read.csv('./data/W4Q2.csv', skip=4, nrows=190)
    #Substitute comma's out
        GDPdol <- gsub(",", "", GDP$X.4)
    #Convert to integer and calculate mean
        GDPdol <- as.integer(GDPdol)
        mean(GDPdol, na.rm=TRUE)
    
    #Attach the GDP data frame
        attach(GDP)
        grep("^United",GDP$X.3)

        #Answer Question2 = 377652.4
        #Answer Question3 = grep("^United",GDP$V4), 3

#Question 4
    #Match the data based on the country shortcode. Of the countries for which the end of the 
    #fiscal year is available, how many end in June?
    #Original data sources:
        #http://data.worldbank.org/data-catalog/GDP-ranking-table
        #http://data.worldbank.org/data-catalog/ed-stats
        
    # download data and load it
        fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
        download.file(fileUrl, './data/W4Q4.csv')
        GDP <- read.csv('./data/W4Q4.csv', skip=4, nrows=190)
        fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
        fileDest <- 'edu.csv'
        download.file(fileUrl, fileDest)
        edu <- read.csv(fileDest)
    # merge the datasets
        merged <- merge(GDP, edu, by.x = 'X', by.y = 'CountryCode')
    # extract the information
        fy.june <- grep('Fiscal year end: June', merged$Special.Notes)
        length(fy.june)

# Question 5
    #You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices 
    #for publicly traded companies on the NASDAQ and NYSE. Use the following code to download 
    #data on Amazon's stock price and get the times the data was sampled.
    #Install the quantmod package
        install.packages('quantmod')
        library(quantmod)
    #Load Amazon stock data
        amzn = getSymbols("AMZN",auto.assign=FALSE)
    #Extract the index
        sampleTimes = index(amzn) 
    #Create logical for year 2012
        year2012 <- grepl('2012-*', sampleTimes)
    #Count 2012 observations (i.e. true)
        table(year2012)
    #Subset based on 2012
        sampleTimes2012 <- subset(sampleTimes, year2012)
    #Convert to day of week
        day <- format(sampleTimes2012, '%A')
    #Count each day
        table(day)