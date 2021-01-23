# Join (Merge) data frames (inner, outer, left, right) 
df1 = data.frame(CustomerId = c(1:6), Product = c(rep("Oven", 3), rep("Television", 3)))
df1
df2 = data.frame(CustomerId = c(2, 4, 6,7), State = c(rep("California", 3), rep("Texas", 1)))
df2
# Merging happens based on the common column name in both the data sets
# Inner Join
df<-merge(x=df1,y=df2,by="CustomerId")
df
# Outer Join
df<-merge(x=df1,y=df2,by="CustomerId",all=TRUE)
df
x<-c(8,'Oven','California') # cbind is used to combine column wise 
df2<-rbind(df,x) # it is used to combine rows in data frame
df2
# Left outer join
df<-merge(x=df1,y=df2,by="CustomerId",all.x=TRUE)
df
# Right outer join 
df<-merge(x=df1,y=df2,by="CustomerId",all.y=TRUE)
df
# Cross join
df<-merge(x = df1, y = df2, by = NULL)
df

data("Seatbelts")
data("iris")
View(iris)

# Apply functions 
# Returns a vector or array or list of values obtained by 
#applying a function to margins of an array or matrix or data frames 
#apply(df , 1 or 2 , function)

z = apply(iris[,1:4], 2 ,mean)

# # lapply function takes list, vector or Data frame  as input and returns only list as output
#lapply(df , function)
x = lapply(iris[,1:4],mean)

# # sapply function takes list, vector or Data frame  as input. It is similar to lapply 
#function but returns only vector as output

y = sapply(iris[,1:4],mean)

# tapply

data("iris")
iris$Sepal.Length


attach(iris)
detach(iris)
Sepal.Length


is.vector(Sepal.Length)

tapply(Sepal.Length, Species, mean) # mean of Sepal.Length for all 3 Species 

tapply(Sepal.Width, Species, median)


getwd() # to know the working directory 
setwd("F:/Data Science/Basics of R - 07.10.2020") # to set the working directory 

data("mtcars")
View(mtcars)
mtcars$mpg
mpg

nrow(mtcars) # no.of rows in mtcars
row.names(mtcars) # row names 
ncol(mtcars) # number of columns 
colnames(mtcars) # column names in mtcars 
names(mtcars) 
dim(mtcars) # dimensions ( rows X columns )
dimnames(mtcars) # Dimension names ( row names and column names )

head(mtcars,10) # top 10 observations 
tail(mtcars,4) # bottom 4 observations

data("mtcars")
min(mtcars$mpg, na.rm = T) # na.rm --> Remove NA values 
max(mtcars$mpg, na.rm = T)
range(mtcars$mpg,na.rm = T) # Return both min and max 

# mean, median
mean(mtcars$mpg, na.rm = T) # Average 
median(mtcars$mpg, na.rm = T) # middle most value in data after sorting in ascending or descending
range(mtcars$mpg,na.rm = T)
mode(iris$Sepal.Length)

Mode = function(x){ 
  ta = table(x)
  tam = max(ta)
  if (all(ta == tam))
    mod = NA
  else
    if(is.numeric(x))
      mod = as.numeric(names(ta)[ta == tam])
  else
    mod = names(ta)[ta == tam]
  return(mod)
}
Mode(mtcars$hp)

ta = table(mtcars$hp)
tam = max(ta)

mtcars$cyl = factor(mtcars$cyl)
table(mtcars$cyl)

##Handy dplyr Verb:
#Filter --> filter()
#Select --> select()
#Arrange --> arrange()

install.packages('dplyr')
library(dplyr)
#Structure:
# First Argument is a DataFrame
# Subsequent Argument say what to do with Data Frame
# Always return a Data Frame

#You can use "," or "&" to use and condition
#filter(df , condition )
mtcars[,c(2,10)] # extract entire rows and in columns 2 and 10 
filter(mtcars , cyl==8)

filter(mtcars,cyl==8,gear==5)


filter(mtcars,cyl==8 & gear == 5) # and gate (&) and OR gate(|)

#select method
 sel = select(mtcars,mpg,cyl,gear)
sel
filter(select(mtcars,mpg,cyl,gear),cyl == 4)
# Use ":" to select multiple contiguous columns, 
#and use "contains" to match columns by name

select(mtcars,"carb",mpg:disp,gear)

#Syntax:
#arrange(dataframe,orderby)
arrange(mtcars,cyl)
arrange(select(mtcars,"cyl","gear"),cyl)
arrange(select(mtcars,"cyl","gear"),cyl,gear)
arrange(select(mtcars,"cyl","gear"),desc(cyl))
arrange(select(mtcars,"cyl","gear"),cyl,desc(gear))

mtcars[,c(1,2)]
