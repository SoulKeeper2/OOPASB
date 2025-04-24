; main.asm
section .data
  rectangle_data: times 12 db 0 ; Allocate space for the rectangle object.
  message: db "Area: ", 0

section .text
  global _start
  extern calculateArea ; Declare external function

_start:
  ; Create a Rectangle object
  mov dword [rectangle_data], 10   ; Width = 10
  mov dword [rectangle_data + 4], 5 ; Height = 5

  ; Set the method pointer (calculateArea) in the object.
  lea eax, calculateArea
  mov [rectangle_data + 8], eax

  ; Call the calculateArea method through the object's pointer
  mov ebx, rectangle_data      ; EBX = Pointer to Rectangle object
  call [ebx + 8]              ; Call calculateArea through the pointer. Result in EAX.

  ; The result is now in EAX.  Let's print it (very basic printing).
  push eax
  push 1 ; write syscall number
  push 1 ; stdout file descriptor
  push message
  push 4   ; length of the message
  mov eax, 4  ; sys_write
  int 0x80

  add esp, 20 ; Clean up stack after system call.


  ; Exit the program using a system call (sys_exit)
  mov eax, 1      ; System call number for exit
  xor ebx, ebx    ; Return code 0 (success)
  int 0x80       ; Call the kernel
