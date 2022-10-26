"""
You are presented with an integer number larger than 5. Your goal is to identify the longest side
possible in a right triangle whose sides are not longer than the number you are given.

For example, if you are given the number 15, there are 3 possibilities to compose right triangles:

1. [3, 4, 5]
2. [6, 8, 10]
3. [5, 12, 13]

The following function shows one way to solve the problem but the code is not ideal or efficient.
Refactor the code based on what you have learned about code simplicity and efficiency.
"""
import numpy as np

x_input = int(input("What is the maximal length of the triangle side? Enter a number: "))

def pythagoreanTriplets(x_input) :
    c, m = 0, 2
    triangles = []
    
    # Limiting c would limit
    # all a, b and c
    while c < x_input :
         
        # Now loop on n from 1 to m-1
        for n in range(1, m) :
            a = m**2 - n**2
            b = 2 * m * n
            c = m**2 + n**2
 
            # if c is greater than
            # limit then break it
            if c > x_input :
                break
 
            print(a, b, c)
            triangles.append([a, b, c])

        m = m + 1

    return np.amax(triangles)

# This is ok but it is O(n^3), we can do it in O(k) if we use some math 
# def my_function(X):
#     solutions = []
#     for x in range(5, X):
#         for y in range(4, X):
#             for z in range(3, X):
#                 if (x*x==y*y+z*z):
#                     solutions.append([x, y, z])
#     m = 0
#     for solution in solutions:
#         if m < max(solution):
#             m = max(solution)
#     return m

print("The longest side possible is %d" % pythagoreanTriplets(x_input))
