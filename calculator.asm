extern printf

section .data
    number1     dd  1234567890   ; 32-bit value
    number2     dd  10000        ; 32-bit value
    neg_number  dd  -12          ; 32-bit value

    fmt         db  "The numbers are %d and %d", 10, 0
    fmtint      db  "%s %d", 10, 0
    sumi        db  "The sum is ", 0
    difi        db  "The difference is ", 0
    inci        db  "Number 1 Incremented: ", 0
    deci        db  "Number 1 Decremented: ", 0
    sali        db  "Number 1 Shift left 2 (x4): ", 0
    sari        db  "Number 1 Shift right 2 (/4): ", 0
    sariex      db  "Number 1 Shift right 2 (/4) with sign extension: ", 0
    multi       db  "The product is ", 0
    divi        db  "The integer quotient is ", 0
    remi        db  "The modulo is ", 0

section .bss
    resulti     resd 1
    modulo      resd 1

section .text
global main
main:
    push    ebp
    mov     ebp, esp

    ; Display the numbers
    mov     eax, [number1]
    mov     ebx, [number2]
    push    ebx
    push    eax
    push    fmt
    call    printf
    add     esp, 12

    ; Adding
    mov     eax, [number1]
    add     eax, [number2]
    mov     [resulti], eax

    ; Display the sum
    mov     eax, [resulti]
    push    eax
    push    sumi
    push    fmtint
    call    printf
    add     esp, 12

    ; Subtracting
    mov     eax, [number1]
    sub     eax, [number2]
    mov     [resulti], eax

    ; Display the difference
    mov     eax, [resulti]
    push    eax
    push    difi
    push    fmtint
    call    printf
    add     esp, 12

    ; Incrementing
    mov     eax, [number1]
    inc     eax
    mov     [resulti], eax

    ; Display the incremented value
    mov     eax, [resulti]
    push    eax
    push    inci
    push    fmtint
    call    printf
    add     esp, 12

    ; Decrementing
    mov     eax, [number1]
    dec     eax
    mov     [resulti], eax

    ; Display the decremented value
    mov     eax, [resulti]
    push    eax
    push    deci
    push    fmtint
    call    printf
    add     esp, 12

    ; Shift left
    mov     eax, [number1]
    shl     eax, 2
    mov     [resulti], eax

    ; Display the shifted left value
    mov     eax, [resulti]
    push    eax
    push    sali
    push    fmtint
    call    printf
    add     esp, 12

    ; Shift right
    mov     eax, [number1]
    sar     eax, 2
    mov     [resulti], eax

    ; Display the shifted right value
    mov     eax, [resulti]
    push    eax
    push    sari
    push    fmtint
    call    printf
    add     esp, 12

    ; Shift right with sign extension
    mov     eax, [neg_number]
    sar     eax, 2
    mov     [resulti], eax

    ; Display the shifted right value with sign extension
    mov     eax, [resulti]
    push    eax
    push    sariex
    push    fmtint
    call    printf
    add     esp, 12

    ; Multiply
    mov     eax, [number1]
    imul    eax, dword [number2]
    mov     [resulti], eax

    ; Display the product
    mov     eax, [resulti]
    push    eax
    push    multi
    push    fmtint
    call    printf
    add     esp, 12

    ; Divide
    mov     eax, [number1]
    xor     edx, edx
    idiv    dword [number2]
    mov     [resulti], eax
    mov     [modulo], edx

    ; Display the quotient
    mov     eax, [resulti]
    push    eax
    push    divi
    push    fmtint
    call    printf
    add     esp, 12

    ; Display the remainder
    mov     eax, [modulo]
    push    eax
    push    remi
    push    fmtint
    call    printf
    add     esp, 12

    ; Clean up
    mov     esp, ebp
    pop     ebp
    ret
