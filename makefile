CFLAGS=-O1 -march=native -g
CC=gcc

hello: hello.s
	$(CC) $(CFLAGS) -nostdlib -o $@ $<

clean:
	rm -f hello
