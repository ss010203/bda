
# ==========================================
#          BLOOM FILTER IN R
# ==========================================

# A Bloom Filter is a probabilistic data structure
# used to check whether an element may be present
# in a set or is definitely not present.

# It uses a bit array and multiple hash functions.

# ------------------------------------------
# STEP 1: Define Hash Functions
# ------------------------------------------

# Hash function 1:
# Takes a number and returns a value from 0 to 4.
# %% is the modulo operator in R.
# Example: hash1(7) = 7 %% 5 = 2

hash1 <- function(n) {
  return(n %% 5)
}

# Hash function 2:
# Generates another hash value from 0 to 4.
# Example: hash2(7) = ((2 * 7) + 3) %% 5 = 2

hash2 <- function(n) {
  return(((2 * n) + 3) %% 5)
}

# ------------------------------------------
# STEP 2: Initialize the Bloom Filter
# ------------------------------------------

# m = size of the bit array.
# We are using 5 positions: 0, 1, 2, 3, 4.
#
# rep(0, m) creates an array containing m zeros.
# Initially, no positions are marked as 1.

m <- 5
bit_arr <- rep(0, m)

cat("Initially bit array is:", bit_arr, "\n")

# ------------------------------------------
# STEP 3: Insert Elements
# ------------------------------------------

# Ask the user how many elements they want to insert.

n <- as.numeric(readline("Enter the number of elements: "))

for (i in 1:n) {
  
  # Read the element to be inserted.
  a <- as.numeric(readline(
    paste("Enter the", i, "number: ")
  ))
  
  # Calculate the first hash value.
  temp1 <- hash1(a)
  cat("Hash 1 value:", temp1, "\n")
  
  # R indexing starts from 1, but our hash
  # positions start from 0.
  # Therefore, add 1 to the hash value.
  #
  # Set the corresponding bit to 1.
  # Even if it is already 1, it remains 1.
  
  bit_arr[temp1 + 1] <- 1
  
  # Calculate the second hash value.
  temp2 <- hash2(a)
  cat("Hash 2 value:", temp2, "\n")
  
  # Set the second hash position to 1.
  bit_arr[temp2 + 1] <- 1
  
  # Display the updated bit array after insertion.
  cat("Bit Array value is:", bit_arr, "\n")
}

# ------------------------------------------
# STEP 4: Display Final Bloom Filter
# ------------------------------------------

# This is the final bit array after inserting
# all the elements.

cat("\nFinal Bit Array:", bit_arr, "\n")

# ------------------------------------------
# STEP 5: Lookup / Search Elements
# ------------------------------------------

# Ask how many elements the user wants to check.

r <- as.numeric(readline(
  "Enter the number of elements to be checked: "
))

for (i in 1:r) {
  
  # Read the element to be searched.
  a <- as.numeric(readline(
    paste("Enter the", i, "number: ")
  ))
  
  # Calculate both hash values for this element.
  temp1 <- hash1(a)
  cat("Hash 1 value:", temp1, "\n")
  
  temp2 <- hash2(a)
  cat("Hash 2 value:", temp2, "\n")
  
  # Check whether either required bit is 0.
  #
  # If even one bit is 0:
  # The element is DEFINITELY NOT PRESENT.
  #
  # If both bits are 1:
  # The element MAYBE PRESENT.
  # It could be a false positive.
  
  if (bit_arr[temp1 + 1] != 1 ||
      bit_arr[temp2 + 1] != 1) {
    
    cat(a, "is not present in the array\n")
    
  } else {
    
    cat(a, "maybe present in the array\n")
  }
}
