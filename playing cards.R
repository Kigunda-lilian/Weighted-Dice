# ######################################################################### 
# Playing cards 
# project 2
#This project will teach me how to store, retrieve, 
# and change data values in my computer’s memory

# BUILD THE DECK
# matrix will fill up the matrix column by column by default, 
# but you can fill the matrix row by row if you include the argument byrow = TRUE:

die <- 1:6
matrix(die,nrow = 2,byrow = T)

# Arrays
# array is not as customizeable as matrix and 
# basically does the same thing as setting the dim attribute
# To use array, provide an atomic vector as the first argument,
# and a vector of dimensions as the second argument, now called dim:

# create an array with 2 rows,2columns and 3 slices
ar <- array(c(11:34), dim = c(2, 2, 3)) 
ar

#Exercise 5.3 (Make a Matrix) Create the following matrix, which stores 
# the name and suit of every card in a royal flush. 

card <- c("ace","spades","king" ,"spades","queen" ,"spades","jack","spades","ten","spades")
matrix(card,ncol = 2,byrow = T)

#Other methods
matrix(card, nrow = 5)
matrix(card,ncol = 2)
matrix(card,nrow = 5,byrow = T)
# dim(card) <-  c(5,2)  #Code not working



# Write functions that deal and shuffle
# Change the point system to suit your game
# Manage the state of the deck
# 