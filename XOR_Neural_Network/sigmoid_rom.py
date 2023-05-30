# The contents of the generated text file ROM.txt is pasted in the Verilog code sigmoid.v

file1 = open("ROM.txt","w")

inputs = []

for i in range(2**16):
  inputs.append('{:016b}'.format(i))

outputs = []
for i in inputs:
  if (i[0] == '0'):
    if (int(i[0:8],2) > 1):
      pass
    else:
      outputs.append("16'b000000001"+i[7:14])
  elif (i[0] == '1'):
    c2 = 65536 - int(i,2)
    c2c = '{:016b}'.format(c2)
    if (int(c2c[0:8],2) > 1):
      pass
    else:
      outputs.append("16'b000000000"+c2c[7:14])

optimal = []
for i in range(len(outputs)):
  if i%4 == 0:
    optimal.append(outputs[i])

for i in range(2**8):
  string = 'rom['+str(i)+'] = '+optimal[i]+';\n'
  file1.write(string)
file1.close()
