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

symbols_1 <- c("7","7","7")
symbols_2 <- c("dd","0","7")
if(symbols_2[1] == symbols_2[2]& symbols_2[2]==symbols_2[3]){
  print("all are equal")
}else{
  print("not equal")
}
if(symbols_1[1] == symbols_1[2]& symbols_1[2]==symbols_1[3]){
  print("all are equal")
}else{
  print("not equal")
}
# method 2: checking three of a kind
symbols_1[1] == symbols_1[2] & symbols_1[1] == symbols_1[3]
# method 3: checking three of a kind
all(symbols_1 == symbols_1[1])

# method 4: checking three of a kind
# The unique function returns every unique term that appears in a vector. 
# If your symbols vector contains three of a kind (i.e., one unique term that appears three times), then unique(symbols) will return a vector of length 1.
length(unique(symbols_1) == 1)
length(unique(symbols_2) == 1)

three_of_a_kind_1 <- symbols_1[1] == symbols_1[2]&& symbols_1[2]==symbols_1[3]
three_of_a_kind_2 <- symbols_2[1] == symbols_2[2]&& symbols_2[2]==symbols_2[3]
three_of_a_kind_1
three_of_a_kind_2
# && and || are not vectorized, which means they can only handle a single logical test on each side of the operator.

# test for all bars
#symbols_3 <- c("B", "BBB", "BB")
"B" %in% symbols_3
#symbols_4 <- c("BBB", "BBB", "BBB")
"B" %in%  symbols_4

# Method 1
symbols_3[1] == "B" | symbols_3[1] == "BB" | symbols_3[1] == "BBB" &
  symbols_3[2] == "B" | symbols_3[2] == "BB" | symbols_3[2] == "BBB" &
  symbols_3[3] == "B" | symbols_3[3] == "BB" | symbols_3[3] == "BBB"
# method 2
# You can often replace multiple | operators with a single %in%. Also, you can check that a test is true for each element in a vector with all. 
# These two changes shorten the preceding code to:
all(symbols_3 %in% c("B", "BB", "BBB")) #always remember that what is being tested is on the left
bars <- symbols_3 %in% c("B", "BB", "BBB")

symbols <- c("dd","B","7") 
same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- symbols %in% c("B", "BB", "BBB")

if (same) {
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, 
               "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])
} else if (all(bars)) {
  prize <- 5
} else {
  cherries <- sum(symbols == "C")
  prize <- c(0, 2, 5)[cherries + 1]
}

diamonds <- sum(symbols == "DD")
prize * 2 ^ diamonds


score <- function (symbols) {
  # identify case
  same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
  bars <- symbols %in% c("B", "BB", "BBB")
  
  # get prize
  if (same) {
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, 
                 "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[symbols[1]])
  } else if (all(bars)) {
    prize <- 5
  } else {
    cherries <- sum(symbols == "C")
    prize <- c(0, 2, 5)[cherries + 1]
  }
  
  # adjust for diamonds
  diamonds <- sum(symbols == "DD")
  prize * 2 ^ diamonds
}
play <- function() {
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}
play()
