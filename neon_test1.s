    .syntax unified

    @ --------------------------------
  .global main
main:
  @ Stack the return address (lr) in addition to a dummy register (ip) to
  @ keep the stack 8-byte aligned.
  push    {ip, lr}

  @ load the address of myarr into r7
  ldr r7, =myarr

  @ Exit from 'main'. This is like 'return 0' in C.
  mov     r0, #0      @ Return 0.
  @ Pop the dummy ip to reverse our alignment fix, and pop the original lr
  @ value directly into pc — the Program Counter — to return.
  pop     {ip, pc}

  @ --------------------------------
  .balign 256
myarr:
  .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16

