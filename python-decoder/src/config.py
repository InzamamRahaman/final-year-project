'''
Created on Mar 27, 2015

@author: school
'''

num_bits_per_index = 1

def bin_to_int(bin_repr):
    counter = 1
    ans = 0
    for bit in reversed(bin_repr):
        if int(bit):
            ans = ans + counter 
        counter = counter * 2
    return ans
