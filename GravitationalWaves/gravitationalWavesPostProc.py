from __future__ import division
from shutil import *
import glob
import numpy as np
import getpass

result = 0

# Traigo los archivos de resultado del scratch
for file in glob.glob(r'/scratch/' + getpass.getuser() + '/result_*.dat'):
    copy2(file, ".")
    print(file)

for file in glob.glob(r'result_*.dat'):
	tmp = np.loadtxt(file)
	result += tmp

print("Energia total", result)
