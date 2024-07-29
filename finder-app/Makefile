CC ?= $(CROSS_COMPILE)gcc
CFLAGS = -Wall -Wextra -std=c11
LDFLAGS =

SRCS = writer.c
OBJS = $(SRCS:.c=.o)
TARGET = writer

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

cross-compile:
	$(MAKE) CROSS_COMPILE=aarch64-none-linux-gnu-

clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: all clean cross
