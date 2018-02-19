from __future__ import division
import numpy as np
import scipy.integrate as integrate
import sys

# Numero total de procesos en Slurm
procs = int(sys.argv[1])
# Numero de proceso en Slurm
proc = int(sys.argv[2])
print("Proceso ", proc)
# Cargo la senial
signal = np.loadtxt("L-L1_LOSC_4_V1-1126259446-32.txt")
# Frecuancia y periodo de sampling de la senial
Fs = 4096
Ts = 1/Fs
# Vector de tiempos
t = np.arange(0, (len(signal))*Ts, Ts)
# Obtengo el chunk correspondiente al proceso
signalChunks = np.array_split(np.array(signal),procs)
tChunks = np.array_split(np.array(t),procs)
# Se eleva la senial al cuadrado e integra por Simpson para obtener la energia
squareSignal = signalChunks[proc]**2
energy = integrate.simps(squareSignal, tChunks[proc])
print("Energia calculada ", energy)
file = open("result.dat", "w")
file.write(str(energy))
file.close()