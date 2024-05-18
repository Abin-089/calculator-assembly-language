#makefile for the project.asm
project: project.o
	gcc -o project project.o -no-pie
project.o: project.asm
	nasm -f elf64 -g -F dwarf project.asm -l project.lst
	
