# ######################################################################### 
# Playing cards 
# project 2
#This project will teach me how to store, retrieve, 
# and change data values in my computer’s memory
############################################################################
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

# Creating a dataframe. Use data.frame
df <- data.frame(face = c("ace", "two", "six"),  
                 suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3))
df



# Write functions that deal and shuffle

# selecting random cards from the deck
random <- sample(1:52, size = 52)
random

deck2 <- deck[random, ]
head(deck2)

# shuffle function
shuffle <- function(deck){
  random <- sample(1:52, size = 52)
  random
  
  deck2 <- deck[random, ]
  head(deck2)
}
shuffle(deck)
shuffle(deck)
# Change the point system to suit your game
# Manage the state of the deck

# LISTS
lst_list <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))
lst_list[1]
lst_list[[1]]
sum(lst_list[1]) #This does not work
# method 1
sum(lst_list[[1]])
# method 2
sum(lst_list$numbers)

# make a copy of deck
deck3 <- deck
# adding new variables to your data set
deck3$new <- 1:52
head(deck3)
# Removing columns in a dataset
deck3$new <- NULL
head(deck3)
# Changing aces at every 13th position from 1 to 14
deck3[c(13, 26, 39, 52), ]

# You can single out just the values of the aces by subsetting the columns dimension of deck3. 
# Or, even better, you can subset the column vector deck3$value:
deck3[c(13,26,39,52),3]
# method 2: selecting
deck3$value[c(13,26,39,52)]
deck3$value[c(13, 26, 39, 52)] <- c(14, 14, 14, 14)
deck3$value[c(13,26,39,52)]
# method 2: assigning new values
deck3$value[c(13, 26, 39, 52)] <- 14
deck3$value[c(13,26,39,52)]
head(deck2)
deck2$value[deck2$face == "ace"]
deck2$face == "ace"
deck2$value[deck2$face == "ace"][1] <- 1
deck2$value[deck2$face == "ace"]
deck2$value[deck2$face == "ace"] <- 14

# changing the hearts to zero
# make a copy of the dataframe
deck4 <- deck
# confirming that the dataframe has been duplicated in deck4 variable
head(deck4)
# In hearts, every card has a value of zero
deck4$value <- 0
deck4$value
# selecting cards in the queen of spades
((deck4$face == "queen")&(deck4$suit == "spades"))

# method2
deck4$face == "queen" & deck4$suit == "spades"
sum((deck4$face == "queen")&(deck4$suit == "spades"))

# selecting cards in the suit of hearts
(deck4$suit == "hearts")
sum(deck4$suit == "hearts")

# using my test to select the values of these cards:
deck4$value[deck4$suit == "hearts"]
deck4$value[deck4$suit == "hearts"]

# Assigning new number to these values
deck4$value[deck4$suit == "hearts"] <- 1
deck4$value[deck4$suit == "hearts"]
deck4$value[((deck4$face == "queen")&(deck4$suit == "spades"))] <- 13
deck4$value[((deck4$face == "queen")&(deck4$suit == "spades"))]

# method 2
queenofspades <- deck4$face == "queen" & deck4$suit == "spades"
deck4[queenofspades,]

# Black jack game 
# In blackjack, each number card has a value equal to its face value. Each face card (king, queen, or jack) has a value of 10. 
# Finally, each ace has a value of 11 or 1, depending on the final results of the game.
deck5 <- deck
allin <-deck5$face %in% c("king", "queen", "jack")
allin
sum(allin)
# method 2: using the or boolean operator
either <- deck5$face == "king"|deck5$face == "queen"|deck5$face == "jack"
either
sum (either)
deck5[either,]
deck5[allin,]
deck5$value[allin] <- 10
deck5$value[allin]
deck5[either,]

# ENVIRONMENTS
#Checking the environments,extracting information from the environments and adding variables to the environments
#library(pryr)
#Error in library(pryr) : there is no package called ‘pryr’
#> parenvs(all = TRUE)
#Error in parenvs(all = TRUE) : could not find function "parenvs"
#> globalenv()
#<environment: R_GlobalEnv>
 # > baseenv()
#<environment: base>
 # > emptyenv()
#<environment: R_EmptyEnv>
 # > parent.env(globalenv())
#<environment: 0x0000025e1f4412a8>
 # attr(,"name")
#[1] "tools:rstudio"
#> parent.env(emptyenv())
#Error in parent.env(emptyenv()) : the empty environment has no parent
#> ls(emptyenv())
#character(0)
#> ls(globalenv())
#[1] "allin"         "ar"            "card"          "deck"          "deck2"        
#[6] "deck3"         "deck4"         "deck5"         "df"            "dice"         
#[11] "die"           "either"        "f"             "lst_list"      "queenofspades"
#[16] "random"        "roll"          "shuffle"      
#> head(globalenv()$deck, 3)
#face   suit value
#1  king spades    13
#2 queen spades    12
#3  jack spades    11
#> assign("new", "Hello Global", envir = globalenv())
#> 
 # > 
 # > globalenv()$new
#[1] "Hello Global"
#> 


# MISSING INFORMATION
#na.rm, which stands for NA remove. R will ignore NAs when it evaluates a function if you add the argument na.rm = TRUE:
mean(c(NA, 1:50), na.rm = TRUE)
#  R supplies a special function that can test whether a value is an NA. The function is sensibly named is.na:
is.na(NA)
vec <- c(1, 2, 3, NA)
is.na(vec)


# Notice that assign works similar to <-. If an object already exists with the given name in the given environment, 
# assign will overwrite it without asking for permission.
