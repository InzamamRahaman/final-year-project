'''
Created on Mar 21, 2015

@author: school
'''

import sys 
from OrganizingList import OrganizingList
from FifoQueue import FifoQueue


def read_and_clean_files(file_obj):
    contents = file_obj.read().split()
    return filter(lambda x : len(x) > 0, contents)

def int_to_bin(num, num_bits = 8):
    ans = ''
    result = [0] * num_bits
    counter = 0
    temp = num
    while temp:
        result[counter] = temp % 2
        temp = temp / 2
    for bit in result:
        ans = str(bit) + ans 
    return ans
    

if __name__ == '__main__':
    
    arguments = sys.argv
    image_file_name = arguments[1]
    secret_file_name = arguments[2]
    
    if len(arguments) > 3:
        output_file_name = arguments[3]
    else:
        output_file_name = "output.txt"
    
    image_file = open(image_file_name, 'r')
    secret_file = open(secret_file_name, 'r')
    output_file = open(output_file_name, 'w')
    
    image_data = read_and_clean_files(image_file)
    secret_data = read_and_clean_files(secret_file)
    image_file.close()
    secret_file.close()
    
    image_storage = FifoQueue()
    secret_storage = FifoQueue()
    organizing_list = OrganizingList(4)
    intended_output = ''
    
    for data in image_data:
        image_storage.insert(data)
        
    for data in secret_data:
        secret_storage.insert(data)
        
    for vq_index in image_data:
        list_index = organizing_list.insert(vq_index)
        if not list_index:
            intended_output = intended_output + '00' + int_to_bin(vq_index)
        else:
            secret_bit = secret_storage.get()
            
    for bit in intended_output:
        output_file.write(bit + '\n')
    
    output_file.close()
    
    
    
    
    
    