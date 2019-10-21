; Assemble on GNU/Linux with NASM
; $ nasm -f elf64 [filename]
; link the object file
; ld -o filename.bin [filename].o

.section .data
  msg db "Hello World",10,0 ; The great message
  len equ $-msg ; The length of the great message

.section .text

global _start

_start:
  mov rax,1 ; Write Syscall
  mov rdi,1 ; Stdout
  mov rsi, msg ; Putting the address of the message in rsi
  mov rdi, len ; The len of the message
  syscall ; Calling the syscall
  
  mov rax, 60 ; The syscall to exit
  mov rdi, 0 ; Exit status
  syscall
