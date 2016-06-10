#Question1
#Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of 
#agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to 
#identify the rows of the data frame where the logical vector is TRUE. which(agricultureLogical) What are the first 3 values 
#that result?
    fileUrl1 = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
    fileName = './data/q1.csv'
    download.file(fileUrl1, fileName)
    data1 = read.csv(fileName)
    agricultureLogical = data1$ACR == 3 & data1$AGS == 6
    head(which(agricultureLogical), 3)

#Question2
#Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? (some Linux systems may produce an 
#answer 638 different for the 30th quantile)
    install.packages("jpeg")
    library("jpeg")
    fileurl2 = 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
    fileName2 = './data/q2.jpg'
    download.file(fileurl2, fileName2, mode = 'wb')
    data2 = readJPEG(fileName2, native = TRUE)
    quantile(data2, probs = c(0.3, 0.8))

#Question3
#Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank 
#(so United States is last). What is the 13th country in the resulting data frame? Original data sources:
#http://data.worldbank.org/data-catalog/GDP-ranking-table 
#http://data.worldbank.org/data-catalog/ed-stats
    install.packages("data.table")
    library("data.table")
    fileurl3a = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
    fileName3 = './data/q3a.csv'
    fileurl3b = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
    fileName3b = './data/q3b.csv'
    download.file(fileurl3a, fileName3, mode="wb")
    download.file(fileurl3b, fileName3b, mode="wb")
    gdp = fread(fileName3, skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))
    edu = fread(fileName3b)
    merge = merge(gdp, edu, by = 'CountryCode')
    nrow(merge)
    library("plyr")
    arrange(merge, desc(Rank))[13, Economy]

#Question4
#What is the average GDP ranking for the “High income: OECD” and “High income: nonOECD” group?
    tapply(merge$Rank, merge$'Income Group', mean)

#Question5
#Cut the GDP ranking into 5 separate quantile groups. Make a table versus 'Income Group'. How many countries are Lower middle 
#income but among the 38 nations with highest GDP?
    merge$RankGroups <- cut(merge$Rank, 5)
    table(merge$RankGroups, merge$'Income Group')