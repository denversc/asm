CFLAGS=-g
LDFLAGS=-g
CC=gcc

EXE_FILES=hello hellostd clargs

all: $(EXE_FILES)

hello: hello.s
	$(CC) $(CFLAGS) -nostdlib -o $@ $<

hellostd: hellostd.s main.c
clargs: clargs.s main.c

clean:
	rm -f $(EXE_FILES)
