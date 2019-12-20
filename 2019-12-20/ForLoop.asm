func main()

CPU Disasm
Address   Hex dump          Command                                  Comments
00A518F8    CC              INT3
00A518F9    C745 F8 0000000 MOV DWORD PTR SS:[EBP-8],0               ; [EBP - 8]: index of loop
00A51900    EB 09           JMP SHORT 00A5190B
00A51902    8B45 F8         MOV EAX,DWORD PTR SS:[EBP-8]             ; calc cannot be done directly in RAM
00A51905    83C0 01         ADD EAX,1                                ; index++
00A51908    8945 F8         MOV DWORD PTR SS:[EBP-8],EAX             ; store increased index
00A5190B    837D F8 05      CMP DWORD PTR SS:[EBP-8],5               ; compare index, 5
00A5190F    7D 0F           JGE SHORT 00A51920                       ; if (zf == 1 or 0) and (cf == 0) -> jmp (loop end)
00A51911    68 D07BA500     PUSH OFFSET 00A57BD0                     ; ASCII "hello world!"
00A51916    E8 30F7FFFF     CALL 00A5104B                            ; printf
00A5191B    83C4 04         ADD ESP,4                                ; __cdecl -> clear param
00A5191E  ^ EB E2           JMP SHORT 00A51902                       ; loop: A51902 ~ A5191E
00A51920    33C0            XOR EAX,EAX
00A51922    5F              POP EDI
00A51923    5E              POP ESI
00A51924    5B              POP EBX
00A51925    81C4 CC000000   ADD ESP,0CC
00A5192B    3BEC            CMP EBP,ESP
00A5192D    E8 F9F8FFFF     CALL 00A5122B
00A51932    8BE5            MOV ESP,EBP
00A51934    5D              POP EBP
00A51935    C3              RETN



