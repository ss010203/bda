
# ==========================================
#      FLAJOLET-MARTIN ALGORITHM IN R
# ==========================================

# Flajolet-Martin is a probabilistic algorithm
# used to estimate the number of DISTINCT elements
# in a data stream using hash functions.
#
# Basic idea:
# 1. Hash every element.
# 2. Convert hash value to binary.
# 3. Count trailing zeros.
# 4. Find the maximum trailing-zero count.
# 5. Estimate distinct elements using 2^maximum R.


# ------------------------------------------
# STEP 1: Convert a Number to Binary
# ------------------------------------------

# This function converts a whole number into
# its binary string representation.
#
# Example:
# 12 -> "1100"
# 5  -> "101"
# 0  -> "0"

binarycon <- function(n) {
  
  # Special case: binary representation of 0.
  if (n == 0) {
    return("0")
  }
  
  # Store binary digits.
  bits <- c()
  
  # Repeatedly divide the number by 2.
  while (n > 0) {
    
    # Get the remainder (0 or 1).
    # Add it to the beginning of the vector.
    bits <- c(n %% 2, bits)
    
    # Integer division by 2.
    n <- n %/% 2
  }
  
  # Combine all bits into one string.
  return(paste(bits, collapse = ""))
}


# ------------------------------------------
# STEP 2: Define Hash Function
# ------------------------------------------

# Hash function:
# h(x) = (4 * x) %% 32
#
# It maps the input number to a hash value
# between 0 and 31.

mod1 <- function(n) {
  return((4 * n) %% 32)
}


# ------------------------------------------
# STEP 3: Count Trailing Zeros
# ------------------------------------------

# Trailing zeros are the zeros present
# at the RIGHT END of a binary string.
#
# Examples:
# "1100" -> 2 trailing zeros
# "1010" -> 1 trailing zero
# "1110" -> 1 trailing zero
# "1011" -> 0 trailing zeros
#
# sub("0+$", "", s) removes all zeros
# from the right side of the string.
#
# Subtracting lengths gives the number
# of trailing zeros.

trailing_zeros <- function(s) {
  
  return(
    nchar(s) - nchar(sub("0+$", "", s))
  )
}


# ------------------------------------------
# STEP 4: Read Input Elements
# ------------------------------------------

# Ask the user for the number of elements.

n <- as.numeric(readline(
  "Enter the number of elements: "
))

# Store binary hash values of elements.
lst <- character(n)

# Store trailing zero counts.
tz <- numeric(n)


# ------------------------------------------
# STEP 5: Hash Every Element
# ------------------------------------------

for (i in 1:n) {
  
  # Read an element.
  a <- as.numeric(readline(
    paste("Enter the", i, "number: ")
  ))
  
  # Calculate hash value.
  temp <- mod1(a)
  
  # Convert hash value to binary.
  tempb <- binarycon(temp)
  
  # Display hash and binary representation.
  cat("The hash value is", temp,
      "and binary value is", tempb, "\n")
  
  # Store the binary hash.
  lst[i] <- tempb
  
  # Count trailing zeros.
  tz[i] <- trailing_zeros(tempb)
  
  cat("The number of Trailing Zeros (R) is:",
      tz[i], "\n")
  
  # Display 2^R.
  cat("2^R is:", 2^tz[i], "\n")
}


# ------------------------------------------
# STEP 6: Find Maximum R
# ------------------------------------------

# maxi stores the maximum trailing-zero count.
maxi <- 0

for (i in 1:n) {
  
  # If the binary hash is all zeros,
  # ignore it as in the given reference.
  #
  # For example:
  # "0" or "0000" has no terminating 1 bit.
  #
  # Otherwise, consider its trailing zeros.
  
  if (tz[i] != nchar(lst[i])) {
    
    maxi <- max(maxi, tz[i])
  }
}


# ------------------------------------------
# STEP 7: Estimate Distinct Elements
# ------------------------------------------

# FM estimates distinct elements using:
#
# Estimate = 2^maximum R
#
# Here, we use the basic FM estimate.

ans <- 2^maxi

cat("\nMaximum R is:", maxi, "\n")
cat("DISTINCT ELEMENTS:", ans, "\n")
