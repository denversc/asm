CFLAGS=-g
CC=gcc

all: hello hellostd

hello: hello.s
	$(CC) $(CFLAGS) -nostdlib -o $@ $<

hellostd: hellostd.s main.c

clean:
	rm -f hello hellostd
