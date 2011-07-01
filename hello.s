################################################################################
#
# hello.s
# By: Denver Coneybeare
# July 01, 2011
#
# The "Hello World" of Linux x86 assembly.
# Note that this application does not use the C standard library, but rather
# makes Linux system calls directly in order to print and exit.
#
# Build Instructions:
#    $ gcc -nostdlib hello.s
#
# Example Run:
#    $ ./a.out
#    Hello World!
#
################################################################################

# Put the string into a read-only data section.
# Note that the string has no null terminator because the length is explicilty
# given to the "write" system call.
    .section .rodata
message:
    .ascii "Hello World\n"

    .text
.global _start
_start:

    # print message to standard output
    movl $4, %eax # 4 is the "write" system call
    movl $1, %ebx # 1 is the file descriptor for standard output
    movl $message, %ecx
    movl $12, %edx # 12 is the number of characters to print
    int $0x80

    # exit system call
    movl $1, %eax # 1 is the "exit" system call
    movl $0, %ebx # 0 is the exit code
    int $0x80
