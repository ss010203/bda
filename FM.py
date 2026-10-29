
# ==========================================
#      FLAJOLET-MARTIN ALGORITHM IN PYTHON
# ==========================================

# Flajolet-Martin is a probabilistic algorithm
# used to estimate the number of DISTINCT elements
# in a data stream.
#
# Basic idea:
# 1. Hash every element.
# 2. Convert the hash value to binary.
# 3. Count trailing zeros.
# 4. Find the maximum trailing-zero count.
# 5. Estimate distinct elements using 2^maximum R.


# ------------------------------------------
# STEP 1: Convert Number to Binary
# ------------------------------------------

# This function converts a whole number into
# its binary string representation.
#
# Examples:
# 12 -> "1100"
# 5  -> "101"
# 0  -> "0"

def binarycon(n):

    # Special case: binary of 0 is "0".
    if n == 0:
        return "0"

    # Store binary digits.
    bits = []

    # Repeatedly divide the number by 2.
    while n > 0:

        # Get the remainder (0 or 1).
        # Add it to the beginning of the list.
        bits.insert(0, str(n % 2))

        # Integer division by 2.
        n = n // 2

    # Join all bits into a single string.
    return "".join(bits)


# ------------------------------------------
# STEP 2: Define Hash Function
# ------------------------------------------

# Hash function:
# h(x) = (4 * x) % 32
#
# It maps the input to a value from 0 to 31.

def mod1(n):
    return (4 * n) % 32


# ------------------------------------------
# STEP 3: Count Trailing Zeros
# ------------------------------------------

# Trailing zeros are zeros at the RIGHT END
# of a binary string.
#
# Examples:
# "1100" -> 2
# "1010" -> 1
# "1011" -> 0
#
# We scan the binary string from right to left
# until we encounter a 1.

def trailing_zeros(s):

    count = 0

    # Traverse the string in reverse.
    for bit in reversed(s):

        # Count zeros until a 1 is found.
        if bit == "0":
            count += 1
        else:
            break

    return count


# ------------------------------------------
# STEP 4: Read Input Elements
# ------------------------------------------

# Ask the user for the number of elements.

n = int(input("Enter the number of elements: "))

# Store binary hash values.
lst = []

# Store trailing-zero counts.
tz = []


# ------------------------------------------
# STEP 5: Hash Every Element
# ------------------------------------------

for i in range(1, n + 1):

    # Read an element.
    a = int(input(f"Enter the {i} number: "))

    # Calculate hash value.
    temp = mod1(a)

    # Convert hash value to binary.
    tempb = binarycon(temp)

    # Display hash and binary value.
    print("The hash value is", temp,
          "and binary value is", tempb)

    # Store binary hash.
    lst.append(tempb)

    # Count trailing zeros.
    r = trailing_zeros(tempb)

    # Store trailing-zero count.
    tz.append(r)

    print("The number of Trailing Zeros (R) is:", r)

    # Display 2^R.
    print("2^R is:", 2 ** r)


# ------------------------------------------
# STEP 6: Find Maximum R
# ------------------------------------------

# maxi stores the maximum trailing-zero count.
maxi = 0

for i in range(n):

    # Ignore hash value 0, as in the R reference.
    # Its binary representation is "0".
    #
    # For other hash values, consider R.

    if lst[i] != "0":
        maxi = max(maxi, tz[i])


# ------------------------------------------
# STEP 7: Estimate Distinct Elements
# ------------------------------------------

# Basic FM estimate:
# Estimated distinct elements = 2^maximum R

ans = 2 ** maxi

print("\nMaximum R is:", maxi)
print("DISTINCT ELEMENTS:", ans)
