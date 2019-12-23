CPU Disasm
Address   Hex dump          Command                                  Comments
00E65133    C745 F4 7856341 MOV DWORD PTR SS:[EBP-0C],12345678       ; [EBP - C]: dword
00E6513A    8D45 F4         LEA EAX,[EBP-0C]
00E6513D    8945 E8         MOV DWORD PTR SS:[EBP-18],EAX            ; [EBP - 18]: &dword
00E65140    C745 DC 0000000 MOV DWORD PTR SS:[EBP-24],0              ; [EBP-24]: index
00E65147    EB 09           JMP SHORT 00E65152
00E65149    8B45 DC         MOV EAX,DWORD PTR SS:[EBP-24]
00E6514C    83C0 01         ADD EAX,1                                ; index++
00E6514F    8945 DC         MOV DWORD PTR SS:[EBP-24],EAX
00E65152    837D DC 04      CMP DWORD PTR SS:[EBP-24],4              ; compare index, 4
00E65156    7D 1D           JGE SHORT 00E65175                       ; if(index >= 4): jmp
00E65158    8B45 E8         MOV EAX,DWORD PTR SS:[EBP-18]
00E6515B    0345 DC         ADD EAX,DWORD PTR SS:[EBP-24]            ; eax = &dword + index (not &dword + 4 * index)
00E6515E    0FB608          MOVZX ECX,BYTE PTR DS:[EAX]              ; ecx = [&dword + index]
00E65161    51              PUSH ECX                                 ; param3: [&dword + index]
00E65162    8B55 DC         MOV EDX,DWORD PTR SS:[EBP-24]
00E65165    52              PUSH EDX                                 ; param2: index
00E65166    68 307BE600     PUSH OFFSET 00E67B30                     ; param1: ASCII " byte in %d order: %x ||||"
00E6516B    E8 DBBEFFFF     CALL 00E6104B                            ; printf (print value: index = 0: 78 / 1: 56 / 2: 34 / 3: 12)
00E65170    83C4 0C         ADD ESP,0C                               ; __cdecl
00E65173  ^ EB D4           JMP SHORT 00E65149
00E65175    33C0            XOR EAX,EAX
00E65177    52              PUSH EDX
00E65178    8BCD            MOV ECX,EBP
00E6517A    50              PUSH EAX
00E6517B    8D15 A851E600   LEA EDX,[0E651A8]
00E65181    E8 C8C0FFFF     CALL 00E6124E
00E65186    58              POP EAX
00E65187    5A              POP EDX
00E65188    5F              POP EDI
00E65189    5E              POP ESI
00E6518A    5B              POP EBX
00E6518B    8B4D FC         MOV ECX,DWORD PTR SS:[EBP-4]
00E6518E    33CD            XOR ECX,EBP
00E65190    E8 5FC0FFFF     CALL 00E611F4
00E65195    81C4 E8000000   ADD ESP,0E8
00E6519B    3BEC            CMP EBP,ESP
00E6519D    E8 89C0FFFF     CALL 00E6122B
00E651A2    8BE5            MOV ESP,EBP
00E651A4    5D              POP EBP
00E651A5    C3              RETN
