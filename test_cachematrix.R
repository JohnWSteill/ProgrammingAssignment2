#library(testthat) ; test_file('test_cachematrix.R')
# Notes: 
#   Forked Repo (https://github.com/rdpeng/ProgrammingAssignment2, Fork Button)
#   Cloned Repo (https://help.github.com/articles/fork-a-repo/)
#     git clone https://github.com/YOUR-USERNAME/Spoon-Knife
#     git clone https://github.com/JohnWSteill/ProgrammingAssignment2
#     git add all
source('cachematrix.R')

z = makeCacheMatrix(2*diag(10))
expect_identical(z$get(),diag(10))
# expect_identical(z$cacheSolve(),NULL)
# z$setInverse("Peanuts")
# expect_identical(z$getInverse(),"Peanuts")
# expect_identical(cacheSolve(z),"Peanuts")
# z$set(2*diag(10))
# expect_identical(z$getInverse(),NULL)
# expect_equal(cacheSolve(z),5*diag(10))

z = makeVector(1:10) 
expect_identical(z$get(),1:10)
expect_identical(z$getmean(),NULL)
z$setmean("Peanuts")
expect_identical(z$getmean(),"Peanuts")
expect_identical(cachemean(z),"Peanuts")
z$set(1:10)
expect_identical(z$getmean(),NULL)
expect_equal(cachemean(z),5.5)


# Introduction
# 
# This second programming assignment will require you to write an R function is
# able to cache potentially time-consuming computations. For example, taking the
# mean of a numeric vector is typically a fast operation. However, for a very
# long vector, it may take too long to compute the mean, especially if it has to
# be computed repeatedly (e.g. in a loop). If the contents of a vector are not
# changing, it may make sense to cache the value of the mean so that when we
# need it again, it can be looked up in the cache rather than recomputed. In
# this Programming Assignment will take advantage of the scoping rules of the R
# language and how they can be manipulated to preserve state inside of an R
# object.
# 
# Example: Caching the Mean of a Vector
# 
# In this example we introduce the <<- operator which can be used to assign a
# value to an object in an environment that is different from the current
# environment. Below are two functions that are used to create a special object
# that stores a numeric vector and cache's its mean.
# 
# The first function, makeVector creates a special "vector", which is really a
# list containing a function to set the value of the vector get the value of the
# vector set the value of the mean get the value of the mean makeVector <-
# function(x = numeric()) { m <- NULL set <- function(y) { x <<- y m <<- NULL } 
# get <- function() x setmean <- function(mean) m <<- mean getmean <- function()
# m list(set = set, get = get, setmean = setmean, getmean = getmean) } The
# following function calculates the mean of the special "vector" created with
# the above function. However, it first checks to see if the mean has already
# been calculated. If so, it gets the mean from the cache and skips the
# computation. Otherwise, it calculates the mean of the data and sets the value
# of the mean in the cache via the setmean function.
# 
# cachemean <- function(x, ...) { m <- x$getmean() if(!is.null(m)) { 
# message("getting cached data") return(m) } data <- x$get() m <- mean(data,
# ...) x$setmean(m) m } Assignment: Caching the Inverse of a Matrix
# 
# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly (there
# are also alternatives to matrix inversion that we will not discuss here). Your
# assignment is to write a pair of functions that cache the inverse of a matrix.
# 
# Write the following functions:
# 
# makeCacheMatrix: This function creates a special "matrix" object that can
# cache its inverse. cacheSolve: This function computes the inverse of the
# special "matrix" returned by makeCacheMatrix above. If the inverse has already
# been calculated (and the matrix has not changed), then the cachesolve should
# retrieve the inverse from the cache. Computing the inverse of a square matrix
# can be done with the solve function in R. For example, if X is a square
# invertible matrix, then solve(X) returns its inverse.
# 
# For this assignment, assume that the matrix supplied is always invertible.
# 
# In order to complete this assignment, you must do the following:
# 
# Fork the GitHub repository containing the stub R files at
# https://github.com/rdpeng/ProgrammingAssignment2 to create a copy under your
# own account. Clone your forked GitHub repository to your computer so that you
# can edit the files locally on your own machine. Edit the R file contained in
# the git repository and place your solution in that file (please do not rename
# the file). Commit your completed R file into YOUR git repository and push your
# git branch to the GitHub repository under your account. Submit to Coursera the
# URL to your GitHub repository that contains the completed R code for the
# assignment. In addition to submitting the URL for your GitHub repository, you
# will need to submit the 40 character SHA-1 hash (as string of numbers from 0-9
# and letters from a-f) that identifies the repository commit that contains the
# version of the files you want to submit. You can do this in GitHub by doing
# the following
# 
# Going to your GitHub repository web page for this assignment
# 
# Click on the "?? commits" link where ?? is the number of commits you have in
# the repository. For example, if you made a total of 10 commits to this
# repository, the link should say "10 commits".
# 
# You will see a list of commits that you have made to this repository. The most
# recent commit is at the very top. If this represents the version of the files
# you want to submit, then just click the "copy to clipboard" button on the
# right hand side that should appear when you hover over the SHA-1 hash. Paste
# this SHA-1 hash into the course web site when you submit your assignment. If
# you don't want to use the most recent commit, then go down and find the commit
# you want and copy the SHA-1 hash.
# 
# A valid submission will look something like (this is just an example!)
# 
# https://github.com/rdpeng/ProgrammingAssignment2
# 
# 7c376cc5447f11537f8740af8e07d6facc3d9645 Grading
# 
# This assignment will be graded via peer assessment. During the evaluation
# phase, you must evaluate and grade the submissions of at least 4 of your
# classmates. If you do not complete at least 4 evaluations, your own assignment
# grade will be reduced by 20%. Please submit the URL pointing to your GitHub
# repository containing the completed R code for this assignment. (NOTE: Please
# submit the URL for the entire repository, not for any individual files.)
# 
# On a separate line, submit the SHA-1 hash identifier corresponding to the
# commit that contains the full submission (the identifier should be a string of
# 40 characters containing numbers 0-9 and letters a-f). BI
# Link<code>MathPreviewEdit: Rich
# 
# Evaluation/feedback on the above work
# 
# Note: this section can only be filled out during the evaluation phase. Was a
# valid GitHub URL containing a git repository submitted?
# 
# 0 points: A valid GitHub URL was NOT submitted (or URL is broken) 1 point: The
# submitted URL points to a GitHub repository
# 
# Does the GitHub repository contain at least one commit beyond the original
# fork?
# 
# 0 points: No, there are no commits beyond the original fork 1 point: Yes,
# there is at least one commit beyond the original fork
# 
# Was a SHA-1 submitted indicating a specific commit in the GitHub repository?
# 
# 0 points: No, there was no SHA-1 submitted 1 point: Yes, a SHA-1 was submitted
# 
# If a SHA-1 was submitted along with the GitHub URL, does the SHA-1 correspond
# to a specific commit in the repository?
# 
# 0 points: No, there is no commit in the repository corresponding to that SHA-1
# 2 points: Yes, there is a commit in the repository corresponding to that SHA-1
# 
# Overall evaluation/feedback
# 
# Note: this section can only be filled out during the evaluation phase. Does
# the GitHub repository contain an R file containing code implementing the
# completed assignment?
# 
# NOTE: There is no need to run the code here, but rather you should visually
# inspect the R file in the GitHub repository and check to see that there is
# code there beyond the original stub that was committed there by the
# instructor. Do not attempt to judge whether the code is correct or not.
# 
# 0 points: No, the R file does not contain any code implementing the completed
# assignment 1 point: The R file contains code implementing a partially
# completed assignment 2 points: The R file contains code implementing the
# complete assignment
# 
# Does the R file containing the code have any comments explaining what the code
# does?
# 
# NOTE: The makeCacheMatrix and cacheSolve functions should both be documented
# with explanatory comments. There maybe other functions in the R file but they
# do not need to be commented.
# 
# 0 points: There are no explanatory comments in the R file 1 points: One of the
# functions has some corresponding explanatory comments in the R file 2 points:
# Both functions have corresponding explanatory comments in the R file
# 
# Does the R code implementing the 'makeCacheMatrix' function appear to be
# correct, to the best of your ability to judge?
# 
# NOTE: Do not run the R code on your own computer. Please examine the R code
# and determine to the best of your ability, whether the solution presented
# appears to match the requirements of the assignment. A correct solution (as
# best you can determine) gets 1 point and a solution that is well-written and
# easy to read gets an additional 1 point.
# 
# 0 points: The solution contains at least one identifiable problem 1 point: The
# solution appears to be correct 2 points: The solution appears to be correct
# and is written in a well-formatted and easily readable style
# 
# Does the R code implementing the 'cacheSolve' function appear to be correct,
# to the best of your ability to judge?
# 
# NOTE: Do not run the R code on your own computer. Please examine the R code
# and determine to the best of your ability, whether the solution presented
# appears to match the requirements of the assignment. A correct solution (as
# best you can determine) gets 1 point and a solution that is well-written and
# easy to read gets an additional 1 point.
# 
# 0 points: The solution contains at least one identifiable problem 1 point: The
# solution appears to be correct 2 points: The solution appears to be correct
# and is written in a well-formatted and easily readable style
# 
# Use this space to provide constructive feedback to the student who submitted
# the work. Point out both strengths and weaknesses in the submission and
# provide advice about how the work could be improved in the future.'