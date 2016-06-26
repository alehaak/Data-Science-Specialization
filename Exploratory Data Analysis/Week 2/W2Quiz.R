#100% Exploratory Data Analysis Week 2 Quiz 
    #1. Under the lattice graphics system, what do the primary plotting functions like xyplot() and bwplot() return?
        #an object of class "trellis"
    
    #2. What is produced by the following code?
        library(nlme)
        library(lattice)
        xyplot(weight ~ Time | Diet, BodyWeight)
        #A set of 3 panels showing the relationship between weight and time for each diet.
    
    #3. Which of the following functions can be used to annotate the panels in a multi-panel lattice plot?
        #panel.lmline()
        
    #4. The following code does NOT result in a plot appearing on the screen device.
        #Which of the following is an explanation for why no plot appears?
        library(lattice)
        library(datasets)
        data(airquality)
        p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
        #The object 'p' has not yet been printed with the appropriate print method.
    
    #5. In the lattice system, which of the following functions can be used to finely control the appearance of all 
    #   lattice plots?
        #trellis.par.set()
    
    #6. What is ggplot2 an implementation of?
        #the Grammar of Graphics developed by Leland Wilkinson
    
    #7. Load the `airquality' dataset form the datasets package in R.
    #   I am interested in examining how the relationship between ozone and wind speed varies across each month. 
    #   What would be the appropriate code to visualize that using ggplot2?
        library(datasets)
        data(airquality)
        airquality = transform(airquality, Month = factor(Month))
        #qplot(Wind, Ozone, data = airquality, facets = . ~ Month)
    
    #8. What is a geom in the ggplot2 system?
        #a plotting object like point, line, or other shape
    
    #9. When I run the following code I get an error. I was expecting a scatterplot of 'votes' and 'rating' to appear. 
    #   What's the problem?
        library(ggplot2)
        library(ggplot2movies)
        g <- ggplot(movies, aes(votes, rating))
        print(g)
        #ggplot does not yet know what type of layer to add to the plot.
    
    #10.qplot(votes, rating, data = movies)
        #How can I modify the the code above to add a smoother to the scatterplot?
        #qplot(votes, rating, data = movies) + geom_smooth()