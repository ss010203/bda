
# ==========================================
#          BLOOM FILTER IN PYTHON
# ==========================================

# A Bloom Filter is a probabilistic data structure
# used to check whether an element may be present
# in a set or is definitely not present.
#
# It uses:
# 1. A bit array
# 2. Multiple hash functions


# ------------------------------------------
# STEP 1: Define Hash Functions
# ------------------------------------------

# Hash function 1:
# Returns a value between 0 and 4.
# Example: hash1(7) = 7 % 5 = 2

def hash1(n):
    return n % 5


# Hash function 2:
# Generates another hash value between 0 and 4.
# Example: hash2(7) = ((2 * 7) + 3) % 5 = 2

def hash2(n):
    return ((2 * n) + 3) % 5


# ------------------------------------------
# STEP 2: Initialize Bloom Filter
# ------------------------------------------

# m represents the size of the bit array.
# We are using 5 positions: 0, 1, 2, 3, 4.
#
# Initially, all positions are set to 0.
# 0 means that the bit is not set.

m = 5
bit_arr = [0] * m

print("Initially bit array is:", bit_arr)


# ------------------------------------------
# STEP 3: Insert Elements
# ------------------------------------------

# Ask the user how many elements to insert.

n = int(input("Enter the number of elements: "))

for i in range(1, n + 1):

    # Read the element to be inserted.
    a = int(input(f"Enter the {i} number: "))

    # Calculate the first hash value.
    temp1 = hash1(a)
    print("Hash 1 value:", temp1)

    # Use the hash value as the array index.
    # Python indexing starts from 0.
    # Therefore, no need to add 1.
    #
    # Set the corresponding bit to 1.

    bit_arr[temp1] = 1

    # Calculate the second hash value.
    temp2 = hash2(a)
    print("Hash 2 value:", temp2)

    # Set the second hash position to 1.
    bit_arr[temp2] = 1

    # Display the updated bit array.
    print("Bit Array value is:", bit_arr)


# ------------------------------------------
# STEP 4: Display Final Bloom Filter
# ------------------------------------------

print("\nFinal Bit Array:", bit_arr)


# ------------------------------------------
# STEP 5: Lookup / Search Elements
# ------------------------------------------

# Ask how many elements to check.

r = int(input("Enter the number of elements to be checked: "))

for i in range(1, r + 1):

    # Read the element to be searched.
    a = int(input(f"Enter the {i} number: "))

    # Calculate both hash values.
    temp1 = hash1(a)
    print("Hash 1 value:", temp1)

    temp2 = hash2(a)
    print("Hash 2 value:", temp2)

    # Check whether either required bit is 0.
    #
    # If any bit is 0:
    # The element is DEFINITELY NOT PRESENT.
    #
    # If both bits are 1:
    # The element MAYBE PRESENT.
    # It could also be a false positive.

    if bit_arr[temp1] != 1 or bit_arr[temp2] != 1:
        print(a, "is not present in the array")
    else:
        print(a, "maybe present in the array")
