  .syntax unified

  @--------------------------------
  .global main
main:
  @ Stack the return address (lr) in addition to a dummy register (ip) to
  @ keep the stack 8-byte aligned.
  push    {ip, lr}
  @--------------------------------


  @ load the address of myarr into r7
  ldr r7, =myarr
  vld1.8 {d6}, [r7]
  vld1.16 {d7}, [r7]
  vld1.32 {d8}, [r7]
  vld1.64 {d9}, [r7]

  vld1.8 {d0[0]}, [r7]

  @--------------------------------
  @ Exit from 'main'. This is like 'return 0' in C.
  mov     r0, #0      @ Return 0.
  @ Pop the dummy ip to reverse our alignment fix, and pop the original lr
  @ value directly into pc — the Program Counter — to return.
  pop     {ip, pc}
  @--------------------------------
  .balign 256
myarr:
  .byte 0x5, 0x10, 0x15, 0x25, 0x30, 0x35, 0x40, 0x45, 0x50, 0x55, 0x60, 0x65, 0x70, 0x75, 0x80, 0x85

