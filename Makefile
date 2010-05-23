udis86=/home/nelhage/sw/udis86

LIBS=-lbfd -L$(udis86)/lib -ludis86
CFLAGS=-I$(udis86)/include -g
SO_LDFLAGS=-nostdlib -fPIC -shared

all: replace-ret preload.so

%: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $< $(LIBS) -o $@

preload.so: preload.c mcount.o
	$(CC) $(CFLAGS) $(SO_LDFLAGS) $< -o $@
