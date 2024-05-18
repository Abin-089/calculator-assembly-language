extern printf

section .data
    number  dq  10000      ; 8bytes (quadword)
    fmt db  "The sum from 0 to %ld is %ld",10,0
    
section .bss

section .text

global main
    
    
main:
    push rbp
    mov  rbp,    rsp
   
    mov  rcx,    [number]
    mov  rax,    0
   
bloop:
    add rax,    rcx
    loop    bloop
    
    mov rdi,    fmt
    mov rsi,    [number]
    mov rdx,    rax
    mov rax,    0
    
    
    call printf
    
    mov rsp,    rbp
    pop rbp
    ret
