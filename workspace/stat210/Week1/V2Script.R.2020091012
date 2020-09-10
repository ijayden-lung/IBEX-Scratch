# Using R
##Introduction

# To find out the present directory we may type 
getwd() 

# in the command line. To change it the command 
setwd()
#is used. If we are using RStudio we may go to 
# *Session/Set Working Directory/Choose Directory*.


# To see a list of the objects in the current directory write 
ls()

# q()
# closes the session. 

##Syntax

sd

pressure

log(10)

rnorm(5)

data()

data(cars)

plot(cars)

head(cars)

str(cars)

2+3;  5*4

var 

# Arithmetic operations
17+25
pi/2
5+4*2
(5+4)*2


## Assignments 

a <- 8  # Object a is assigned the value 8
a       # Print the value of a
b = 7   # Object b is assigned the value 7
print(b)
6 -> d  # Object c is assigned the value 6
d


(a <- 12)


ls()
rm(a)
ls()


# To erase all objects in memory we write

rm(list=ls())
ls()

a <- 8

# q()

getwd()
setwd("/Users/ortegaj/Stat210") 

#and then load the objects saved with the command load() by typing 

load('.RData')


## Help 

help(log)
?lm

?'*'

help(truehist)
help(truehist, try.all.packages = TRUE)

??truehist


# Another useful function is example(), 

example(image)


## Input
### Loading a File

MEXpop <- read.table('MEXpop.txt', header=TRUE)
str(MEXpop)
MEXpop


plot(Pop.~ Year, data=MEXpop, pch=16)



testfile <- read.table(file.choose())


### Loading data from the command line


distance <- data.frame(stretch=c(46,54,48,50,44,42,52),
                       distance=c(148,182,173,166,109,141,166))


##Remarks**
# 1.- It is always a good idea to look at the data file before 
# reading it, to make sure that it has the information we want 
# and that its format is appropriate.  
# 2.- To represent directories and subdirectories, use the forward 
# slash / not the backward slash \.  
# 3.- If your computer is connected to the internet, it is possible 
# to directly read a data file in text format using the scan() 
# function. The basic syntax is

# scan("http://www..."')


test1 <- scan('http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat')

str(test1)


# 4.- If the directory or file name has spaces, it is necessary to 
# include a backward slash ($\backslash$) before the space.






































## Basic Functions
### c

# The concatenation function c combines elements to create a vector. 
# The elements are listed in order and separated by a comma:

x <-c(1, 1.5,2,2.5)
x

# A variable can also be used as an argument for this function. 
# For instance, if we want to add the number 3 to the vector x 
# we can write:

(x <- c(x,3))

# and also characters can be used:

(y <- c('this','is','an','example'))

# However, if one combines numbers and characters, all entries of 
# the vector will be considered as characters and it is not posible 
# to operate on them as numbers:

(z <- c(x,'a'))

# If you want to avoid the quotation marks when printing characters, 
# you may use the function cat:

cat(z)




### seq
# This function is used to form regular sequences of numbers. 
# The basic syntax is 

seq(from=1, to=1, by=((to-from)/length.out-1),length.out = NULL)


# Let's see some examples:

seq(0,100,5)
seq(1955,1966,1)
seq(10,12,0.2)


# 1 is the default value for the lower limit of the sequence and 
# also for the increment:

seq(1955,1966)
seq(5)
seq(5,-1)

# There is a shorthand for this function when the increment is 1:

1:5
5:1
50:60/5

### rep
# This function replicates a pattern. The syntax is 
rep(x,times)

# where x is the object to be replicated and times is the number 
# of replications:

rep(10,3)
rep(c(0,5), 4)
rep(c('wx','yz'),3)
rep(1:5,2)

# The number of replications can be a vector, in which
# case it must have the same number of components as the pattern, 
# and then each element of the pattern is repeated the corresponding 
# number of times.

rep(c(10,20),c(2,4))
rep(1:3,1:3)
rep(1:3,rep(4,3))

# It is also possible to specify the number of terms the replications 
# should have using the option length:

rep(c(1,2,3,4), length=10)

##Indexing

# To get a particular component from a vector, you can write the 
# position of the element in the vector within square brackets after 
# the vector's name, as in the following example:

z <- rnorm(10)
z[3]


# The general syntax for indexing is 
###
# objet[index] 
###

# where object can be any data object in R 
# (data objects will be reviewed later) and index
# can be any of the following alternatives:

# 1.- Positive integers corresponding to the position of the data 
# points we are interested in. For instance, the data set letter 
# has the 26 letters used in English. Let's see some examples using 
# this set:

letters[19]
letters[c(11,13,15)]
letters[seq(11,15,2)]

# 2.- Negative numbers that correspond to entries to be excluded:

letters[-(11:26)]
letters[-seq(1,25,2)]

 # 3.- Logical variables. TRUE values will be included while FALSE 
 # values will not.

a <- 1:26
a < 11
letters[a<11]
a %% 2 == 0
letters[a %% 2==0]

# Double inequalities such as $1 < x \leq 7$ should be written 
# using the \& symbol: 1 < a \& a <= 7:

letters[1 < a & a <= 7]


# Here is a list of the comparison operators in R:

# \begin{center
# $$
#  \begin{array{|c|c|
#  \hline \mbox{Symbol & \mbox{Relation\\
#  \hline  < & \mbox{Less than\\
#  \hline  > & \mbox{Greater than\\
#  \hline <= & \mbox{Less than or equal to\\
#  \hline >= & \mbox{greater than or equal to\\
#  \hline == & \mbox{Equal to\\
#  \hline != & \mbox{Not equal to\\
#  \hline
#  \end{array
# $$
# 
# \bigskip
# {\small Table 1.2. Comparison Operators.
# \end{center
# 

# We have used this operators to get the letters that occupy 
# even positions in the vector letters but they can also be 
# used to get the even (or odd) components of a vector:

(x <- rbinom(20, 40, prob=1/3))
x[x %% 2==0]
x[x %% 2!=0]


# If the indexing vector is shorter than the object to which it is 
# being applied, it is recycled:

letters[c(T,F)]

# This gives the letters that occupy an odd position in the vector.

### which

# This function gives a list of the positions within an object 
# occupied by entries that satisfy a certain condition. For 
# the next example we use the data set trees which provides 
# measurements of the Girth, Height and Volume of timber in 
# 31 felled black cherry trees. Girth is the diameter of the 
# tree (in inches) measured at 4 ft 6 in above the ground. 
# The expression tree\$Volume indicates the variable Volume 
# of this data set.


str(trees)
which(trees$Volume > 50)
trees[which(trees$Volume > 50),]
trees[trees$Volume > 50,]


# The functions which.max and  which.min that give the position 
# of the (first) maximum and (first) minimum values of an vector:

(b <- rep(1:3,2))
which.max(b); which.min(b)


## expand.grid
 
# This function creates a data frame with all possible 
# combinations of vectors or factors that appear as arguments 
# for the function. Let's look at an example:

expand.grid(age=c(20,40),weight=c(50,70),sex=c('Male','Female'))


## Sampling

# The sample function generates random samples from a given set. 
# The syntax is 
###
# sample(x, size, replace = FALSE, prob = NULL)
###
# where x is the set from which we want to obtain the sample, 
# size is the size of the sample, replace indicates if repetitions 
# are allowed or not, and prob is a probability vector if we want 
# to get a sample with a non-uniform distribution. Let's look at 
# some examples. 


xy <- c('bad','regular','good')
sample(xy,10,replace=T)
pp <- c(0.1,0.1,0.8)
sample(xy,10,replace=T,prob=pp)


# R also has functions for obtaining samples from many 
# probability distributions. The usual syntax of these functions 
# is R\textit{dist, where \textit{dist designates the distribution; 
#   for example, to generate values from the normal distribution we 
#   use rnorm. 

# Depending on the distribution, it may be necessary to specify 
# one or more parameters. The table below presents the most 
# common distributions, the required parameters and their default 
# values. n always represents the sample size.


# \begin{center
# \begin{tabular{ll
# \hline {\bf Distribution & {\bf Function\\
# \hline Gaussian & rnorm(n, mean=0, sd=1)\\
# Exponential &rexp(n, rate=1)\\
# Gamma & rgamma(n, shape, scale=1)\\
# Poisson & rpois(n, lambda)\\
# Weibull & rweibull(n, shape, scale=1)\\
# Cauchy & rcauchy(n, location=0, scale=1)\\
# Beta & rbeta(n, shape1, shape2)\\
# t & rt(n, df)\\
# Fisher & rf(n, df1, df2)\\
# $\chi^2$ & rchisq(n, df)\\
# Binomial & rbinom(n, size, prob)\\
# Multinomial & rmultinom(n, size, prob)\\
# Geometric & rgeom(n, prob)\\
# Hipergeometric & rhyper(nn, m, n, k)\\
# Logistic & rlogis(n, location=0, scale=1)\\
# Lognormal & rlnorm(n, meanlog=0, sdlog=1)\\
# Negative Binomial & rnbinom(n, size, prob)\\
# Uniform & runif(,n min=0, max=1)\\
#  \hline
# \end{tabular
# 
# \bigskip
# {\small Table 1.3. Functions for generating random numbers.
# \end{center

# Let`s look at some examples:

(rnorm(10))
(rbinom(5, 20, 0.5))
(rexp(8))
(rpois(4, lambda=10))


# Associated with these functions for generating random numbers 
# are three others (for each distribution) that allow to obtain 
# values for the density, distribution and quantile functions. 
# The initial letter R must be replaced by d, p or q, respectively. 
# The main argument for these functions is the vector of points 
# where we want the function to be evaluated.

pnorm(1.96)
qnorm(0.975)

# The quantiles for the normal distribution for a two-sided test 
# at the 5\% level are

qnorm(c(0.025,0.975))

# Graph for the density and distribution function, standard normal 
# distribution:

points.x <- seq(-3,3,length=100)
points.den <- dnorm(points.x)
points.fd <- pnorm(points.x)
plot(points.x, points.fd,type='l',xlab='Values',
ylab='', main='Normal Distribution',col='cyan')
lines(points.x,points.den,col='darkblue')
legend('topleft',c('Dist. Fn','Density'),col=c('cyan','skyblue'),lty=rep(1,2))


## Vectorized Operations
# R performs vector operations componentwise: if we add two vectors 
# of equal length, the result is another vector of the same length, 
# whose components are the sum of the components of the vectors we 
# add. This is also true for any other arithmetic operation, 
# including powers. 

(a <- 5:2)
(b <- (1:4)*2)
a + b
a - b
a * b
a / b
a^b

# Function evaluation is also a vectorized operation, this means 
# that if, for instance, we want to evaluate the logarithm of the 
# components of a certaiin vector a, we only have to write log(a):

log(a)

# This also works with more complicated expressions. Suppose we 
# want to evaluate the function
# 
# f(x,y) =\log \Big(\frac{x^2+2y{(x+y)^2 \Big)
# 
# for several values of x and y. One possibility is to take each 
# pair of values and calculate f(x,y). We can, however, take 
# advantage of the way R works with vectors to perform all 
# operations with a single evaluation. We start by creating the 
# vectors that contain the values of interest for x and y.

(x <- 10:6)
(y <- seq(1,9,2))

# We now define the function in terms of these vectors we have 
# created and store the results in a new vector z.

(z <- log((x^2 + 2*y) / (x + y)^2 ))

# The following table lists functions commonly used with vectors.

# \begin{center
# \begin{tabular{ll
# \hline
# {\bf Name & {\bf Function\\
# \hline
# length(x) & length of x\\
# sum(x) & sum of the components  of x\\
# prod(x) & product of the components  of x\\
# cumsum(x), cumprod(x) & cumulative sum and product for  x\\
# max(x), min(x) & maximum and minimum of the components of x\\
# cummax(x), cummin(x) & cumulative maximum and minimum of x\\
# sort(x) & orders vector components\\
# rev(x) & reverses the order of the elements of x\\
# diff(x) & calculates the difference between successive components\\
# which(x == a) & gives a vector with the indices of the components of  x that satisfy the equality\\
# which.max(x) &  index of the largest element\\
# which.min(x) &  index of the smallest element\\
# range(x) & range of values for x\\
# mean(x) & average of the elements of  x\\
# median(x) & median for the elements of x\\
# round(x,n) & rounds the elements of x up to n decimals\\
# rank(x) & ranks of the elements of x\\
# unique(x) & vector with duplicate elements of x removed \\
#  \hline
# \end{tabular
# 
# \bigskip
# {\small Table 1.4. Vector Functions.
# \end{center

## NAs and Infs
# Missing data in R are denoted by NA (not available). When we do 
# an operation with an NA the result will be an NA. 

(y <- c(1:5,NA))
2*y
max(y)

# Care must be taken with this but R has methods for dealing with
# missing data that will appear in the course as needed.
# 
# R can handle adequately the values $\pm \infty$ with $\pm$Inf or 
# non-numerical values with NaN (not a number):

(x <- 2/0)
exp(x)
exp(-x)
x - x

# Objects and Data

# R interprets every expression we write in the console and 
# produces a value. This value is a data object that can be named.
# Data objects are composed of elements, which in simple objects 
# correspond to individual data and in more complex objects can 
# comprise other data objects.
# Every element has a **mode** which can be 

# * Logical, which take values TRUE of FALSE. 
# * Numerical: Floating point numbers. They can be written as 
#   integers (4, -24), decimals (3.14, -2.717) or in scientific 
#   notation (4e12).
# * Complex: Complex numbers of the form a + bi, where a y b
#   are numerical (e.g. 3.6 + 2.4i).
# * Characters: Sequences of letters or characters limited by 
#   single or double quotation marks (e.g. ’letter’ ”test”).


# We have listed the modes progressing from the least informative 
# to the most informative. This order is important when considering 
# data objects created using elements in different modes, since 
# there are data objects that do not allow combining different modes.

# The number of elements of an object determines its length. 
#   Vectors are the simplest data objects and are classified 
#   according to their mode and length. To create vectors we use 
#   the function c, as we have seen.

# It is important to observe that if elements of different modes 
# are combined in the same vector, they will all be assigned the 
# most informative mode among those present:

c(T,F,12)
c(T,F,12.3)
c(T,8.3,12+3i)
c(F,12.3,'hi')


# *Mode* and *length* are atributes of an object. 
# All objects in R have these two attributes, which are known as 
# implicit attributes. Vectors only have these two. 
# Other attributes refer to the structure of more complicated objects.

# The functions mode and length give the atributes of an object:

mode(letters); length(letters)

# We can introduce a multidimensional structure to the elements of 
# a vector by adding the attribute dim, creating an object called 
# an array. The dim attribute is a numeric vector that specifies 
# how many elements should be placed in each dimension. The length 
# of the dim attribute determines how many dimensions there are.
# 
# If dim has length 2 the array is called a matrix. In this case 
# the first element determines the number of rows and the second, 
# the number of columns.

x <- 1:10
x
dim(x) <- c(2,5)
x


# The table below lists the different types of objects available in R 
# and some of their characteristics.
# 
# \begin{center
# \begin{tabular{|c|c|c|
#  \hline
#  {\small Objet & {\small Modes & {\small Several modes
#  \tabularnewline
#  \hline
#  {\small Vector & {\small Numerical, character, complex or logical & {\small No
#  \tabularnewline
#  %\hline
#  {\small Factor & {\small Numerical or character (categorical) & {\small No
#  \tabularnewline
#  {\small Matrix & {\small Numerical, character, complex or logical & {\small No
#  \tabularnewline
#  {\small Array & {\small Numerical, character, complex or logical & {\small No
#  \tabularnewline
#  {\small Data frame & {\small Numerical, character, complex or logical &
# {\small  Yes
#  \tabularnewline
#  {\small ts & {\small Numerical, character, complex or logical & {\small No
#  \tabularnewline
#  {\small List & {\small Numerical, character, complex, logical, function, \dots & {\small Yes
#  \tabularnewline
#  \hline
# \end{tabular
# 
# \medskip
# {\small Table 1.5 Types of objects.
# \end{center
# 
# 
# * A *factor* is a categorical variable.
# 
# * A *matrix* is a two-dimensional arrangement of elements that
#  must all be of the same mode. 
# 
# * An *array* is a $k$-dimensional arrangement of elements that
#  must all be of the same mode.
# 
# * A *data frame* is a table that allows elements of different modes. All columns must have the same length.
# 
# * A *ts* is a data set corresponding to a time series.
#  It has additional attributes such as frequency and dates. 
# 
# * Finally, one of the most useful objects is the *list*,
#  which can be used to combine any collection of objects into a
#  single object,  including other lists.

## Class
# Another important attribute for R objects is the class. 
# R is an object-oriented language, which means the functions 
# will act differently depending on the object, and the relevant 
# attribute for this is the class. If an object has no specific 
# class assigned to it, such as a simple numeric vector, it's class 
# is usually the same as its mode, by convention.

xx <- (1:10)/2
mode(xx)
class(xx)
dim(xx) <- c(2,5)
mode(xx)
class(xx)
is.numeric(xx)
xx <- data.frame(xx)
mode(xx)
class(xx)
mode(xx[2,2])


## Factors
# Some variables take non-numerical values, such as gender or the
#  country a person was born in.  These are known as 
#  *categorical variables* or *factors* and their values are known 
#  as  *levels*. 

# When you create a data frame by reading a file using a command 
# such as read.table, all variables containing one or more character 
# stings will be converted automatically into factors.

# The function factor can be used to create a factor:

(gender <- factor(c('male', 'female','female','male', 'female' )))


# Some important functions for dealing with factors are the following.

attach(iris)
is.factor(Species)
is.factor(Sepal.Length)
levels(Species)
nlevels(Species)
length(levels(Species))


# Suppose a factor has $n$ levels. Internally, this factor consists
#  of two items, a vector of integers between $1$ and $n$,
#  corresponding to the levels of the factor, and a vector of
#  length $n$, containing strings describing what the levels are.

opinion <- c(1,2,2,2,1,0,4,4)
fopinion <- factor(opinion,levels=0:4)
levels(fopinion) <- c('awful','bad','regular','good', 'excellent')

# The first command creates a numerical vector opinion that
# corresponds to the graded opinions of 8 users of a webpage.
# The second command creates a factor fopinion with this data 
# and 5 levels, from 0 to 4. The final line assigns the names for
# the levels. 

# Now we look at the objects we have created:

opinion
fopinion
levels(fopinion)
as.numeric(fopinion)

# The function as.numeric extracts the numerical coding for 
# the levels, while levels gives the names of the levels. 
# Observe that the original coding in a scale from 0 to 4 has 
# been changed to a scale from 1 to 5: The internal representation 
# always uses a scale starting at 1.

# When using factor the option levels may be omitted and R will 
# then define the levels using the values present in the argument.
# Beware that if a value in a scale is missing, it will not be
# included among the levels, as the next example shows

test1 <- factor(c(0,1,2,3,4,5))
test2 <- factor(c(0,1,2,3,5))
levels(test1)
levels(test2)

#### Ordered Factors
# There are two kinds of factors, with order, known as *ordinals*, 
# and those without order, known as *nominal* factors. 
# Ordered factors have a natural order such a length scales 
# (short, medium or long) or satisfaction scales 
# (excellent, good, normal, bad, awful). 
# For the second group of factors there is no natural order. 
# Examples are the type of soil or the make of a car.
# There are two commands for creating a factor, factor, and ordered. 
# We have already seen examples of the use of the factor fuction. 
# Let's now see some examples of the use of the function ordered 
# to explore the differences between the two. We will use these
# functions to create a random vector with the values high, 
# medium, and low.

(xx <- sample(c('high','medium','low'),10,replace=T))
(yy <- factor(xx))
(zz <- ordered(xx))


# We see some differences in the way the data are presented. 
# In the first case (xx), the elements are of character mode, 
# since they are between quotation marks. In the other two cases
# the elements are factors. The levels for yy are presented 
# unordered while those for zz are (alphabetically) ordered. 
# We can verify the class  of each of these objects:

class(xx)
class(yy)
class(zz)
is.factor(xx)
is.factor(yy)
is.factor(zz)

# For the ordered factor zz, the alphabetical order is not the
# natural order among the levels, which would be
# low < medium < high. If we try  to change this using the
# function levels, the result is not perhaps what you would expect:

levels(zz)
zz
levels(zz) <- c('low','medium','high')
zz

# The outcome is that everything changes, not only the levels 
# but also the values. What this command does is to 'translate' 
# everything, values and levels of the object, to new labels 
# for the levels.

# Levels should be assigned when the object is created and for 
# we may use the function ordered:

xx
(ww <- ordered(xx,levels=c('low','medium','high')))


### Tables 
# The function table is useful for summing up in a table the
# frequency of factor values in a vector:

table(xx)
table(yy)
table(zz)
table(ww)

# Let's see another example using the dataset mtcars, that has 
# data on fuel consumption and 10 other variables for 32 cars, 
# 1973-74 models, taken from the 1974 \textsl{Motor Trend magazine.

attach(mtcars)
str(mtcars)
table(cyl, gear)

# More than two factors can be used to build up the table:

table(cyl, gear,am)



## Matrices
# A matrix is a rectangular arrangement of cells, each of which
# contains a value.
# To create an matrix in R you can use the matrix function, 
# whose syntax is

###
# matrix(data, nrow, ncol, byrow=F, dimnames = NULL)
###

# where nrow and ncol represent, respectively, the
# number of rows and columns in the matrix.

# Only the first argument is indispensable. If neither the second
# nor the third argument appear, the data is placed in a
# one-dimensional matrix, i.e.,  a vector. If only one of the
# dimensions is included, the other is determined by division.

matrix(1:6)
matrix(1:6, nrow=3)

# Observe that in the second example the elements are stored in
# the matrix column-wise. If we want the elements to be stored
# row-wise, the option byrows has to be set to T:

matrix(1:6, nrow=3, byrow=T)

# The elements of a matrix must all be of the same type.
# To store columns of different types in a two-dimensional array 
# it is necessary to use a data frame, an object that we will 
# study a little later.  
# To add and subtract matrices, operations that are carried out
# component by component, the only necessary condition is that
# both matrices have the same dimensions.  The usual addition 
# and subtraction symbols are used for these operations.

(A <-  matrix(1:6, nrow=3, byrow=T))
(B <-  matrix(seq(0, 10, 2), 3, 2))
A+B
A-B


# You can also add, substract, multiply or divide by a scalar:

A-5
B/2

# Matrix multiplication is a more complicated operation. 
# The syntax for matrix multiplication is %*%.
# The rule for multiplication of matrices is that the number of
# columns in the first matrix must be equal to the number of rows
# in the second. 
# For example, the matrix A we have defined above is a 3 x 2 matrix.
# We can multiply it by any matrix that has 2 rows:

(D <- matrix ((1:8)*3,2))
A %*% D

# It is also possible to multiply two matrices with the same 
# dimensions component-wise, by using the usual symbol for
# multiplication *:

A*B

# The following table presents other common operations with matrices
# \begin{center
# \begin{tabular{ll
# {\bf Name & {\bf Operation\\
# \hline
# dim() & matrix dimensions\\
# as.matrix() & coerces the argument as a matrix\\
# t() & transposition\\
# diag() & extracts the diagonal elements\\
# det() & determinant\\
# solve() & inverse\\
# eigen() & calculates eigenvalues and eigenvectores\\
# dimnames() & Retrieve or set the dimnames 
# \end{tabular
# 
# \bigskip
# {\small Table 1.6 Matrix Functions.
# \end{center

# Let's see some examples:

(XX <- matrix(c(2,3,4,1,5,3),ncol=3))
t(XX)
XX %*% t(XX)
t(XX) %*% XX


# The functions col and row have as argument a matrix and the
# result of the first one is a matrix with entries the column
# occupied by the corresponding element of the argument matrix
# while the second instruction indicates the row.

col(XX)
row(XX)


# The diag function extracts the diagonal elements of a matrix
# and can also be used to build up diagonal matrices:

diag(XX)
diag(t(XX))
diag(t(XX) %*% XX)
diag(1:4)
diag(3)


# We now explore the use of the functions det and solve:

(YY <- matrix(c(12,3,8,16,21,5,7,9,12,18,4,3,19,5,21,8), ncol=4))
det(YY)
solve(YY)


# To verify that this is the inverse, we multiply the matrices

YY%*%solve(YY)


# We round off the values so that the result is clearer:

round(YY%*%solve(YY),15)
round(solve(YY)%*%YY,15)


# The same instruction solve used with an array A and a column 
# vector b allows you to solve the linear equation b=Ax to get x:

b <- 1:4
(x <- solve(YY,b))
YY %*% x


# Let's use the B matrix for some examples on the dimnames function

dimnames(B)
dim(B)
subjects <- c('Patient1','Patient2','Patient3')
variables <- c('Var1', 'Var2')
dimnames(B) <- list(subjects,variables)
dimnames(B)
B


# To extract data from a matrix one can use the coordinates of 
# the entry or entries one requires:

A[1,2]
A[1,]
YY[2:3,1:2]

# and it is also possible to use dimension names, if available:

B['Patient1','Var2']
B['Patient1',]
B[,'Var2']


# Finally, to add new rows or columns to a matrix we can use the
# functions rbind and cbind, respectively:

A
(A <-cbind(A,c(3,5,7)))
B
cbind(B,c(3,5,7))
cbind(B,Var3=c(3,5,7))
rbind(B,Patient4 = c(6,12))


### Arrays 
# An array is a extension of a matrix to more dimensions. 
# Arrays follow the  same rules as matrices. 
# To define an array use array(data, dim):

(x <- array (1:24, c(3,4,2)))

# When printing the array R starts with the largest dimension 
# and goes down to the smallest dimension, printing 
# two-dimensional matrices at each stage.

# Another way of creating an array is to start with a vector and 
# then assign the dimensions

(x1 <- 1:24)
dim(x1) <- c(4,3,2)
x1


# Indexing follows the same rules as before:

x[,2,]
x[,3,1]
x[,,1]


# The aperm function is an extension of matrix transposition 
# that changes the dimensions of an array. 
# The syntax is
###
# aperm(array, perm, resize=TRUE)
###
# where array is the arrangement to permute, perm is a  
# permutation vector and resize is an indicator of whether 
# the data vector should be resized, if necessary.

# As an example we will permute the iris3 array that has dimensions
# $50\times 4 \times 3$ to an array with dimensions  $4\times 3 \times 50$:

str(iris3)
iris3b <- aperm(iris3, c(2,3,1))
str(iris3b)

###apply
#This command successively applies a function to each row 
# (first dimension), column (second dimension) or level of 
## a higher-dimensional array. The syntax is 
###
# apply(data, dim,function, ...)
###
# where data is the name of the matrix or array and 
# function is any function in R.To see an example of the use 
# of this function we are going to work with the file iris3
# that has the information of the data set iris that we have 
# used previously but in theformat of an arrangement of dimensions
# 50×4×3.  The third dimension corresponds to the species, and 
# for each of the three species there is a matrix of dimension
# 50×4 with the values of the four variables that we already know 
# for the 50 plants of the corresponding species.
str(iris3)
# To calculate the mean value for each variable in the data set 
# we write:
apply(iris3, 2, mean)
# However, if we want the mean value for each species we have 
# to se a vector as dimension,as follows
apply(iris3,c(2,3), mean)
apply(iris3,c(3,2), mean)

# If the function to be used requires additional parameters, 
# these can be included afterthe function name.
# As an example, we are going to calculate the trimmed averages 
# for the same data above.Trimmed averages are a robust version 
# of averages in which a percentage of the sample corresponding 
# to the data furthest from the centre is ‘trimmed’.
apply(iris3,c(2,3), mean, trim=0.1)

## sweep
# This function returns an array obtained from an input array by 
# sweeping out a summarystatistic. It is often used in conjunction
# with the apply function.For instance, suppose we want to 
# subtract the mean we calculated in the previous example from 
# all the components of the array iris3, that is, in each case we 
# want to subtract themean corresponding to the variable and the 
# species of each data.  One way to do this is as follows:

(iris.means <-apply(iris3,c(2,3), mean))
iris.ctd <-sweep(iris3,c(2,3), iris.means,'-')
head(iris.ctd)

## outer
# Another important function for matrices, data tables and 
# arrangements in general is the function outer or outer product.

# If texttt{A} and texttt{B} are two arrays, their outer product 
# is a new array whose dimension is the concatenation of the 
# dimension vectors of the arrays A and B, in the order of the 
# product, and whose entries are obtained forming all possible 
# products of the elements of A with all the elements of B.
# For example, the outer product of a vector of length 2 with 
# another of length 3 producesan array (matrix) of dimensions
# 2×3; the product of an array of dimensions m×n times 
# another array of dimensions pxq produces an array of dimensions 
# m x n x p x q. In this new array, the element in position 
# (i,j,k,l) is the product  A[i,j] x B[k,l]
# Let's look at some examples.

(aa <- 1:4)
(bb <- c(2,4,6))
(ab <- aa %o% bb)

# In terms of linear algebra, the outer product %o% of vectors x 
# and y is the product xy^t, while the matrix product %*% represents 
# x^ty, and requires the vectors to be of equal length.

(A  <- matrix(1:12, ncol=3))
(B <- 9:10)
(AB <- A %o% B)

# Another, more flexible, way of writing this function is
###
# outer( array1}, array2, FUN='*')
###

# where array1, array2 are the arrays and FUN is the operation that 
# is going to be used to get the new array, which by default is 
# multiplication, but can be any other operation or any function 
# of two variables. Let's see examples

# Suppose we want to evaluate the function 
# f(x,y) = \frac{1}{2\pi} \exp\big\{-\frac{x^2+y^2}{2}\big\}
# which is the standard bivariate normal distribution, in a 
# square of sides [-3,3]. We use a mesh of 100 points in [-3,3] 
# and the define the function f(x,y) before doing the outer product:

x <- y <- seq(-3,3,length=100)
f <- function(x,y){
  exp(-(x^2+y^2)/2)/(2*pi)
  }
z <- outer(x,y,f)
str(z)
persp(x,y,z,phi=20, theta=30,expand = 0.8,col='lightblue')

# As a final example let's see how to produce a multiplication table:

outer(1:9,1:9)














## Data Frames
# Data frames are matrix-like structure whose columns may be of 
# different mode but must all have the same length. The command 
# for creating a data frame is
###
# data.frame (datos1, datos2, ...)
###

# For instance:

x <- -1:-4
(dframe1 <- data.frame(x=2001:2014,y=rnorm(14),
                       z1=letters[sample.int(26,14)],w = (1:14)%/%2==0))

# However, if we try to add a new column with only three elements, 
# an error message is produced:

dframe1 <- data.frame(x=2001:2014,y=rnorm(14),
                      z1=letters[sample.int(26,14)],w = (1:14)%/%2==0,
                      v=c(1,-1,2))

# As we have seen, the function str gives a description of objects 
# in R and can be used to get a sketch of data frames. Other useful 
# functions for this are head and tail

str(dframe1)
head(dframe1)
tail(dframe1)

# The variables in a data frame can be accessed using the 
# instructions:

dframe1$x
dframe1['x']

# Observe, however, that they have different structures

str(dframe1$x)
str(dframe1['x'])

# In the first case we have a (row) vector with 14 components 
# while in the second the result is a data frame with one variable.

# This syntax to access a variable in a data frame is cumbersome. 
# When the information on a data frame is used frequently, a 
# convenient resource is the function attach(object) which places 
# the object in a preferent place of the search path.

attach(dframe1)
x
z1

# Observe that we get a value for x is different from that in the 
# data frame dframe1. The reason for this is that there exists a 
# variable with the same name in the working directory and local 
# variables precede those obtained from the command attach(). 
# This was alerted by the warning we got when using the 
# attach(dframe1) command. To further explore this issue consider 
# the following commands

ls()
rm(x)
x

# After removing object \texttt{x} from the working environment, 
# we get the correct answer from the attached data frame. Let us 
# now look at the effect of the attach function on the search path: 

search()

# We see that dframe1 has been place in second position, just 
# after .GlobalEnv, which is the working directory. To eliminate 
# it from the search path we can use the detach() function:
  
detach(dframe1)
search()


### attributes
# The function attributes lists the characteristics of any object 
# in R, in particular data frames.

attributes(dframe1)  

### merge
# The merge function allows you to merge two data frames based on 
# the common values of certain columns or rows. To see an example 
# let's use the Animals and mammals datasets from the MASS package.
# The former has the average brain and body weight for 28 species 
# of terrestrial animals while the latter has the same information 
# for 62 species of terrestrial mammals.

library(MASS)
head(Animals)
head(mammals)
merge(Animals,mammals,by = 'row.names')


### aggregate

# The aggregate function splits the data into subsets, computes 
# summary statistics for each, and returns the result in a 
# convenient form. The syntax is 
###
#agregate(x,by,FUN,...)
###
# where x is the data frame,  by is a list of the elements 
# that determine the groups and FUN is the functión to be used.

str(crabs)
aggregate(crabs[, 4:8], list(sp=crabs$sp,sex=crabs$sex), median)

### order
# The function order sorts complex structures, such as data 
# frames.  

# The result of using order on a vector is a permutation that 
# rearranges the vector in ascending or descending order, 
# according to the \texttt{decreasing} option selected (that is 
# true by default). Let's see an example

(x <- c(4:6,2,1,3,7))
order(x)

# The result means that in order to sort the vector x
# you have to place component 5 first, component 4 second, 
# component 6 third, and so on. To order x, type

x[order(x)]

# The interesting thing is that this function allows you to use 
# the indexes obtained to sort several vectors using the criteria 
# corresponding to the vector x.

y <- 7:1
z <- 1:7
rbind(x,y,z)[,order(x)]


## Lists 
# Lists are objects that can contain information of different 
# mode and  different structure. Recall that a data frame is an 
# object that can contain data of different modes, but all the 
# vectors had to have the same length. In lists, the objects in 
# the list can be arbitrary. Thus, a list is an ordered collection
# of objects. To build lists use the command list:

(vec1 <- letters[5:10])
(vec2 <- 1:10)
(vec3 <- matrix(rnorm(12),ncol=3))
(mixed.list <- list(item1 = vec1, item2 = vec2, item3 = vec3, item4 = distance))

# Named items in a list can be accessed in two different ways, 
# either using the $ sign as we did for data frames or ussing 
# double square brackets:

mixed.list$item1
mixed.list[[1]]

# Double square brackets are used for getting items out of a list
# while single square brackets are used for extracting elements of 
# a vector or array in the list:

mixed.list$item3[,2]
mixed.list[[3]][,2]
mixed.list$item4$stretch

# Lists are objects with great flexibility for storing data and 
# other objects in \texttt{R}. These objects may be completely 
# independent and may be of different types and shapes.

# Elements in a list can be assigned and changed as with other 
# objects. To add a new element to a list, simply place it in a 
# position that is not in use.
# The mixed.list list has three elements (this can be determined 
# as usual using the length() function). We can add a new element 
# by assigning it to a free index.

length(mixed.list)
mixed.list[[5]] <- c('The', 'new', 'element')

# Any index can be used, but it is better to use the first one 
#that is free, since the intermediate elements are assigned the 
# NULL value. If we add an element with index 10 to a list of 3 
# elements, we are automatically creating the elements from  4 to 9. 
# The following command to add the new element in the first free place:

mixed.list[[length(mixed.list)+1]] <- c('the newest of the new')
mixed.list 

# If we assign an existing index, the element is replaced. To 
# remove an existing element, assign it the value NULL:

mixed.list[[2]] <- NULL
mixed.list

# removes the second item from the list, so it doesn't appear again.

# As we can see, by eliminating one element the others move forward 
# and their indices are reduced by one unit.
# It is impossible to remove several items from a list simultaneously 
# and it is also imposible to use negative indexes to delete list 
# elements.

# The function \texttt{names} gives the names of the elements in 
# the list and camn also be used to assign or change names:

names(mixed.list)
names(mixed.list)[5] <- 'item.new'
names(mixed.list)

## The selection operator 

## The selection operator is represented by the symbol [ between quotation 
#  marks: 
## `[`
## The selection operator is a function whose first argument is the object 
## being subsetted. Subsequent arguments are the indices to that subset.

(M <- matrix(1:12,ncol=4))
M[2,4]
'['(M,2,4)
'['(M,1:2,)
'['(M,1:2,-3)





# ### lapply
# The lapply function allows you to apply the same function on 
# all items in a list. For example, you might want to calculate 
# the average of the elements in the list:

(L <- list (vec = 1:10, mat=matrix (99:88, 3, 4)))

(res <- lapply (L, mean))
str(res)
lapply (L, '-', 1)

# We see that lapply returns a list with the averages of the 
# componentes of the original list.

## \texttt{lapply} and the selection operator

## The selection operator '[' can be used in combination with lapply
3# to extract elements (or columns or rows or subsets) of matrices 
## in a list of matrices. 

## To give an example we build a list of three $2x3$ matrices 
(m1<- matrix(rbinom(6,20,0.5),nrow=2))
(m2<- matrix(rpois(6,10),nrow=2))
(m3<- matrix(rgeom(6,0.1),nrow=2))
(L1 <- list(m1=m1,m2=m2,m3=m3))
lapply(L1,'[',2,3)
lapply(L1, '[',2,2:3)
lapply(L1, '[', 1:2, 2:3)



## sapply and apply

# Other similar functions are apply and sapply. apply is used to 
# apply a function to margins of an array or matrix. The syntax is 
###
# apply(X, MARGIN, FUN, ...)
###

apply(mtcars, 2, range)

#  sapply is similar to lapply but, by default, returns a vector 
# or matrix, if possible:

(res2 <- sapply (L, mean))
str(res2)

# A similar result can be obtained with the function unlist

unlist(lapply(L, mean))

# R has functions for calculating several statistics from a sample. 
# For numerical data we have, among others, the following
# 
# \begin{center}
# \begin{tabular}{ll}
# \hline
# Function & Operation\\
# \hline \texttt{mean()}& Average\\
# \texttt{median()}& Median\\
# \texttt{fivenum()}& 5 Number  summary\\
# \texttt{summary()}& Numerical summary\\
# \texttt{min(), max()} & Smallest and largest value in the sample\\
# \texttt{quantile()}& Sample quantiles \\
# \texttt{var(), sd()} & Variance and standard deviation\\
# \texttt{cov(), cor()} & Covariance and correlation
# \end{tabular}
# \end{center}

# Lists are often used in R to store the result of a function 
# that has some complexity. To see an example let's consider the 
# result of a linear regression:

fit1 <- lm(Fertility ~ Education, data=swiss)
str(fit1)

# The result of linear regression is a very complex list that has 
# stored a great deal of information about the fitted model. 

### split
# The function \texttt{split} divides the values of one variable 
# according to the values of another. The result is a list that 
# has as many elements as the second variable has different values. 
# For example, the command


library(lattice)
split(barley$yield, barley$site)

# produces a list with six elements, since there are six 
# experimental stations in the data.
# Each component of the list contains the yield for one of the 
# experimental stations. The names of the components in the list 
# correspond to the levels of the variable site.















