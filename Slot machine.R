# ######################################################################### 
# Slot machine 
# project 3
#This project will teach me how to write programs and run simulations in R. 
#I will also learn how to:

#Use a practical strategy to design programs
#Use if and else statements to tell R what to do when
#Create lookup tables to find values
#Use for, while, and repeat loops to automate repetitive operations
#Use S3 methods, R’s version of Object-Oriented Programming
#Measure the speed of R code
#Write fast, vectorized R code
# setting the language in the system environment to english:Sys.setenv(LANG = "en")
############################################################################

#Sample function generates three symbols from a group of common slot machine symbols: diamonds (DD), sevens (7), triple bars (BBB), double bars (BB), single bars (B), cherries (C), and zeroes (0). 
#The symbols are selected randomly, and each symbol appears with a different probability:

get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE, 
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}
get_symbols()
# trunc takes a number and returns only the portion of the number that appears to the left of the decimal place (i.e., the integer part of the number).
# a - trunc(a) is a convenient way to return the decimal part of a.
a <- 3.14 
dec <- a-trunc(a)
# if else tree to round the number (either up or down):
if (dec >= 0.5) {
  a <- trunc(a) + 1
} else {
  a <- trunc(a)
}
a
dec
