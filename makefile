#
## Makefile
#

CC = gcc # Compiler to use
OPTIONS = -O2 -g -lm -lncurses -lplplotd # -g for debug, -O2 for optimise and -Wall additional messages
INCLUDES = -I/usr/include/plplot # Directory for header file
FUENTES=\
		main.c \
	   	int_newton.c \
		main_intnewton.c \
		funciones.c \
		menu.c \
		raices-cerrados.c \
		entrada_raices.c \
		raices-abiertos.c \
		grafica.c
#FUENTES=%.c
OBJS = ${FUENTES:.c=.o} # List of objects to be build
.PHONY: all clean # To declare all, clean are not files
 
all: ${OBJS} 
	@echo "Building.." # To print "Building.." message
	${CC} ${OPTIONS} ${INCLUDES} ${OBJS} -o metodos_bin

%.o: %.c  # % pattern wildcard matching
	${CC} ${OPTIONS}  -c $*.c ${INCLUDES}
list:
	@echo $(shell ls) # To print output of command 'ls'
     
clean:
	@echo "Cleaning up.."
	-rm -rf *.o # - prefix for ignoring errors and continue execution
	-rm metodos_bin
