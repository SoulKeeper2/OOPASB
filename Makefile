# Makefile
CC = nasm
CFLAGS = -f elf32

all: main

main: rectangle.o main.o
	ld -m elf_i386 -o main main.o rectangle.o

rectangle.o: rectangle.asm
	$(CC) $(CFLAGS) -o rectangle.o rectangle.asm

main.o: main.asm
	$(CC) $(CFLAGS) -o main.o main.asm

clean:
	rm -f *.o main
