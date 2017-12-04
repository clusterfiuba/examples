EXECS=mpi_pi_calculation
MPICC?=mpicc

all: ${EXECS}

mpi_pi_calculation: mpi_pi_calculation.c
	${MPICC} -o mpi_pi_calculation mpi_pi_calculation.c -lm

clean:
	rm -f ${EXECS}
