'''
Created on Mar 27, 2015

@author: school
'''

from FileProcessor import create_queue_of_data, get_k_bits
from config import *
from StremProp import *
from OrganizingList import OrganizingList

import sys
# from FileProcessor import get_k_bits
# from config import num_bits_per_index, bin_to_int
args = sys.argv
input_file_name = args[1]
image_file = open(args[2].strip(), 'w')
secret_file = open(args[3].strip(), 'w')
my_list = OrganizingList()

queue_of_output = create_queue_of_data(input_file_name)


def read_list_index():
    zero_count = 0
    bit = int(queue_of_output.get())
    while bit == 0:
        zero_count += 1
        bit = int(queue_of_output.get())
    zero_count += 1
    num = str(bit)
    while zero_count:
        zero_count -= 1
        num += str(queue_of_output.get())
    image_file.write(str(my_list[bin_to_int(num)]) + '\n')




def main():
    while not queue_of_output.is_empty():
        bits = get_k_bits(queue_of_output, num_bits_per_index + 1)
        scenario = compute_case(bits)
        print "read ", str(bits)
        if StreamPop.scenario1 == scenario:
            index_bits = get_k_bits(queue_of_output, 8)
            index = bin_to_int(index_bits)
            my_list.insert(index)
            image_file.write(str(index) + '\n')
        elif StreamPop.scenario2 == scenario:
            secret = bits[0 : num_bits_per_index]
            for bit in secret:
                secret_file.write(bit + '\n')
            next_bit = queue_of_output.get()
            if int(next_bit):
                image_file.write(str(my_list[1]) + '\n')
            else:
                read_list_index()
        elif StreamPop.scenario3 == scenario:
            image_file.write(str(my_list[1]) + '\n')
        else:
            read_list_index()
    print "Finished with decoding process"




if __name__ == '__main__':
    main()
