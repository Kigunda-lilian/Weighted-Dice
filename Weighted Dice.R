# ££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££
# Practising R programming using the following platforms: 
# - afterwork.io,
# - rstudio-education.github.io
 # Part 1 : - Weighted Dice project
 #           -Introduction to R programming project
#  Date: 12th Feb 2024
# By Lilian Kigunda
#This is my first R script to push to github!!! I am super excited
# Let's do this !!!!!!!!
# ££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££

# The colon operator (:) returns every integer between two integers.
# It is an easy way to create a sequence of numbers.
# You can do inner multiplication with the %*% operator and outer multiplication with the %o% operator:

# A function to roll the dice
roll <- function(){
  die <- 1:6
  # sample function
  dice <- sample(die,size = 2,replace = T)
  dice
  sum(dice)
  }
roll()
