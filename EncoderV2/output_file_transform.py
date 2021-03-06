import sys

def bin_to_int(bin_repr):
  res = 0
  counter = 1
  for bit in reversed(bin_repr):
    res = res + (counter * int(bit))
    counter = counter * 2
  return res


args = sys.argv
f1_name = args[1]
f2_name = args[2]

f1 = open(f1_name, 'r')
f2 = open(f2_name, 'w')

f1_contents = f1.read()
f1.close()
f1_sep = f1_contents.split()
f1_data = filter(lambda x : len(x) > 0, f1_sep)

length = len(f1_data)
odds = range(1, length, 2)
evens = range(0, length, 2)

final_string = ''

for (idx, jdx) in zip(evens, odds):
  bit_stream = f1_data[idx]
  #rep = bit_stream[0 : bin_to_int(f1_data[jdx].strip())].strip()
  #f2.write(rep + '\n')
  final_string = final_string + bit_stream[0 : bin_to_int(f1_data[jdx].strip())].strip()

for string in final_string:
  f2.write(string + '\n')

f2.close()


