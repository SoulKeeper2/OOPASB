; rectangle.asm
section .data
  ; No data here for now

section .text
  global calculateArea

; Function: calculateArea
; Input: EAX = Pointer to Rectangle object
; Output: EAX = Area (width * height)
calculateArea:
  push ebp
  mov ebp, esp

  ; Access width from the object
  mov eax, [eax]   ; Load width into EAX

  ; Access height from the object
  mov edx, [eax + 4] ; Load height into EDX (offset 4)

  ; Calculate area: EAX = EAX * EDX
  mul edx          ; EAX = EAX * EDX

  pop ebp
  ret
