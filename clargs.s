    .data
template:
    .ascii "%i: %s\n\0"

    .text
.global go
go:
    # reserve 4 bytes on the stack for the local variable "i"
    enter $4, $0

    # Local Variables:
    #   argc: 8(%ebp)
    #   argv: 12(%ebp)
    #   i: -4(%ebp)

    # initialize i to 0
    movl $0, -4(%ebp)

argloop:

    # copy i into the ecx register
    movl -4(%ebp), %ecx

    # test if i>=argc, and if it is, exit the loop
    cmpl 8(%ebp), %ecx
    jge argloopend

    # set edx to the the address of the string to print
    movl 12(%ebp), %edx

    # call printf()
    pushl (%edx, %ecx, 4)
    pushl %ecx
    pushl $template
    call printf
    popl %ecx
    popl %ecx

    # increment i
    incl -4(%ebp)

    # start the next iteration of the loop
    jmp argloop

argloopend:

    # store the return value in the %eax register
    mov $0, %eax
    leave
    ret
