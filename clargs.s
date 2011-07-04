    .data
template:
    .ascii "%s\n\0"

    .text
.global go
go:
    enter $8, $0
    movl 8(%ebp), %ecx
    movl 12(%ebp), %esi

argloop:
    pushl (%esi)
    pushl $template
    call printf
    addl $4, %esi

    subl $1, %ecx
    cmpl $0, %ecx
    jge argloop

    mov $0, %eax
    leave
    ret
