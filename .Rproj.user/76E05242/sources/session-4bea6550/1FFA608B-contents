# final presentation scheduling poll:
# https://forms.gle/p8umuGMmdBfKvYyr6
# course evaluation link:
# https://montana.campuslabs.com/eval-home/direct/1015826

# what is a for loop? ------------------------

# say we have two vectors:
x = 0:9; y = rnorm(10)

# normally in R we add two vectors like this:
x + y

# this code does the addition element-wise; we call this vectorized code.
# vectorized code operates on all the elements of your vector/dataframe/object 
# at once instead of looping through each one.
# in other words, take x[1] + y[1] and make that the first element of the result.
# take x[2] + y[2] and make that the second element of the result. etc.

# in many languages like C, we would need to loop explicitly through the vector 
# to add each pair of elements. we can do that in R too (this isn't a great use 
# of for loops in R in practice, but it's a good initial demonstration):

z = rep(NA, 10)

for(i in 1:10){
  z[i] = x[i] + y[i]
}

# let's break down how we built this for loop.

# first, the general structure of a for loop:
# (this is pseudocode, not meant to run, just to illustrate the structure)
for(iter in sequence){
  # do code for each element of the sequence: iter = sequence[1], iter = sequence[2], ...
}

# often we start by just writing the code for one iteration of the loop:
x[1] + y[1]

# if we want to store this as something:
z = x[1] + y[1]

# okay, but now we're going to do another iteration:
x[2] + y[2]

# and we want to store this as another element of z. so let's create z first and then store both iterations together:
z = rep(NA, 2)
z[1] = x[1] + y[1]
z[2] = x[2] + y[2]

# now we want to extend this for a vector of length 10 without having to copy and paste.
# to do that, identify what code repeats, how the number of the iteration appears 
# in the code, and what code doesn't repeat.
# put code that doesn't need to be repeated before or after the loop as much as possible.
# each iteration looks like z[iter] = x[iter] + y[iter] where iter = 1, 2, ..., 10

z = rep(NA, 2) # only need to do at the beginning, so put it before the loop

for(iter in 1:10){
  z[iter] = x[iter] + y[iter]
}

# notice that here, iter is the INDEX not the value of x
# and at the end of the loop, iter has its greatest value
iter # 10
x[iter] # 9

# What if we want to be able to handle a vector of any length, not necessarily 10?
z = rep(NA, 2) # only need to do at the beginning, so put it before the loop

for(iter in 1:length(x)){
  z[iter] = x[iter] + y[iter]
}

# we can also check that x and y are the same length and return an error if not
# by using an if statement, which has the following form:
# if (logical condition){
#    # run this code
# }
z = rep(NA, 2) # only need to do at the beginning, so put it before the loop

if(length(x) != length(y)){
  stop("x and y must be the same length")
}

for(iter in 1:length(x)){
  z[iter] = x[iter] + y[iter]
}

# a better version of this for loop uses seq_along --------------------
z = rep(NA, 2) # only need to do at the beginning, so put it before the loop

for(iter in seq_along(x)){
  z[iter] = x[iter] + y[iter]
}

# why is this better? if you accidentally apply your for loop to an object x 
# that has length 0 (is empty), seq_along handles this safely/properly as you 
# can see here:

## with seq_along --------------------
df <- data.frame(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

for (i in seq_along(df)) {
  print(median(df[[i]]))
}

# if the dataframe is empty, the loop prints nothing (as it should)
df <- data.frame()

for (i in seq_along(df)) {
  print(median(df[[i]]))
}


## without seq_along --------------------
df <- data.frame(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

for (i in 1:length(df)) {
  print(median(df[[i]]))
}

# if the dataframe is empty, the loop gives an error "subscript out of bounds"
df <- data.frame()

for (i in 1:length(df)) {
  print(median(df[[i]]))
}

# take-away message: seq_along is a good option when you are iterating over 
# elements of an object that is user-generated or created from earlier code
# - not necessary if you want to loop over a fixed sequence like 1:10

# quick practice -----------------

# 1. what is the difference between these two loops? why?
# hint: first take a look at letters itself
letters

# loop 1
for (i in seq_along(letters)) {
  print(i)
}

# loop 2
for (i in seq_along(letters)) {
  print(letters[i])
}

# 2. write a loop to print the numbers 1 through n, where n is some integer you set in advance


# 3. write a loop to print out each element of a vector called heights


# 4. write a loop that computes the sum of squares for the numbers 1 through n



# guidelines for using for loops --------------------------

# for loops can be used in lots of programming languages, and they work a little
# differently from one language to another, so how to use them well varies by
# language.

# good uses of a for loop in R:
# - reading in or saving many files
# - making lots of similar plots
# - often, tasks are easier to understand initially as a for loop, and then with
#   experience or after you work out the logic of what you need, you can look into
#   functional programming or vectorized commands like purrr:map, lapply, etc.
# 
# good ways to implement a for loop in R:
# - allocate memory beforehand by creating an empty dataframe, vector, etc. before the loop

# bad uses of a for loop in R:
# - computing things that can be more straightforwardly done with vectorized 
#   computation
#   - to add two vectors a and b, use a + b instead of a for loop that iterates 
#     over the elements of the vectors
#   - use tidyverse or base-R vectorized functions instead of iterating over 
#     rows of a dataframe. pretty much never use a for loop to iterate over rows.
#
# bad ways to implement a for loop in R:
# - try to avoid growing objects with each iteration, especially if you have many iterations




# using for loops with control flow ---------------------

# control statements allow you to change the behavior based on some condition

## we saw one example above with a control statement (if) before the loop -------

z = rep(NA, 2) # only need to do at the beginning, so put it before the loop

if(length(x) != length(y)){
  stop("x and y must be the same length")
}

for(iter in 1:length(x)){
  z[iter] = x[iter] + y[iter]
}

# here's another example with the control statement inside the loop ---------

# suppose we want to iterate over a sequence of numbers and print each one, but 
#  - we want to skip the third value and
#  - stop after the first 5 values

x = 4:10

for(i in seq_along(x)){
  if(i == 3){
    next # skips 3rd element
  }
  if(i > 5){
    break # exits or breaks the loop without an error
  }
  print(x[i])
}


# what happens if I change the order?

x = 4:10

for(i in seq_along(x)){
  if(i == 3){
    next # skips 3rd element
  }
  print(x[i])
  if(i > 5){
    break # exits or breaks the loop without an error
  }
}

# what happens if I change the order?

x = 4:10

for(i in seq_along(x)){
  print(x[i])
  if(i == 3){
    next # skips 3rd element
  }
  if(i > 5){
    break # exits or breaks the loop without an error
  }
}


# more realistic examples of for loops ------------------

# one use of for loops is in simulating data
# let's write a for loop to simulate a coin flip twenty times, keeping track of
# the individual outcomes (1 = heads, 0 = tails), and compute what proportion
# of the time the result is heads
# hint: to simulate a single coin flip, you can use rbinom(1, 1, 0.5)
# - the first 1 means do this experiment once
# - the second 1 means this experiment consists of a single coin flip
# - the 0.5 is the probability of getting heads; you can change it if you want 
#   the coin not to be a fair coin

# allocate a vector beforehand (create a blank vector of length 20)
flips = rep(NA, 20)

for(i in 1:20){
  flips[i] = rbinom(1, 1, 0.5)
}

mean(flips)

# how could you do this task more simply without a for loop?


# the for loop construct is handy, though, if you have a more complicated simulation that you're repeating
avgs = rep(NA, 20)

for(i in 1:20){
  avgs[i] = mean(rbinom(1, 10, 0.5))
}

mean(avgs)


