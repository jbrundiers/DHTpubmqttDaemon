VERSION = 3.02
CC      = /usr/bin/gcc
CFLAGS  = -Wall -g -I ./ 
LDFLAGS = -lm  -lconfig -lmosquitto -lwiringPi
PRG = dhtpubmqttd

OBJ = dhtpubmqttd.o 

prog: $(OBJ)
	$(CC) $(CFLAGS) -o $(PRG) $(OBJ) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $<



		
