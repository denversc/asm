################################################################################
#
# hello.s
# By: Denver Coneybeare
# July 07, 2011
#
# The "Hello World" of Linux x86 assembly, using the standard library's printf.
#
# Build Instructions:
#    $ gcc hellostd.s main.c
#
# Example Run:
#    $ ./a.out
#    Hello World
#
################################################################################

    .data

template:
    .ascii "%s\n\0"
message:
    .ascii "Hello World\0"

    .text

.global go
go:
    enter $8, $0
    
    # push the template and the message onto the stack (in reverse order) then
    # call printf
    pushl $message
    pushl $template
    call printf

    # return a value of 0 (zero) in register eax
    mov $0, %eax
    leave
    ret
