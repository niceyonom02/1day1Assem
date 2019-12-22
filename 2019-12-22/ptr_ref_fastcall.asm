func main()

CPU Disasm
Address   Hex dump          Command                                  Comments
006648E3    C745 F4 0500000 MOV DWORD PTR SS:[EBP-0C],5              ; int a = 5
006648EA    8D45 F4         LEA EAX,[EBP-0C]
006648ED    8945 E8         MOV DWORD PTR SS:[EBP-18],EAX            ; int* ptr = &a
006648F0    8D45 F4         LEA EAX,[EBP-0C]
006648F3    8945 DC         MOV DWORD PTR SS:[EBP-24],EAX            ; int& ref = a
006648F6    8B45 E8         MOV EAX,DWORD PTR SS:[EBP-18]            ; eax = ptr
006648F9    50              PUSH EAX                                 ; param2: ptr
006648FA    68 307B6600     PUSH OFFSET 00667B30                     ; param1: ASCII "%p"
006648FF    E8 47C7FFFF     CALL 0066104B                            ; printf
00664904    83C4 08         ADD ESP,8                                ; __cdecl
00664907    8B45 DC         MOV EAX,DWORD PTR SS:[EBP-24]            ; eax = &ref
0066490A    50              PUSH EAX                                 ; param2: &ref
0066490B    68 307B6600     PUSH OFFSET 00667B30                     ; param1: ASCII "%p"
00664910    E8 36C7FFFF     CALL 0066104B                            ; printf
00664915    83C4 08         ADD ESP,8                                ; __cdecl
00664918    BA 2D000000     MOV EDX,2D                               ; param2: 2D (dec: 45)
0066491D    8B4D E8         MOV ECX,DWORD PTR SS:[EBP-18]            ; param1: ptr
00664920    E8 78CAFFFF     CALL 0066139D                            ; call funcA(__fastcall)
00664925    6A 40           PUSH 40                                  ; param2: 40 (dec: 64)
00664927    8B45 E8         MOV EAX,DWORD PTR SS:[EBP-18]
0066492A    50              PUSH EAX                                 ; param1: ptr
0066492B    E8 72CAFFFF     CALL 006613A2                            ; call funcB(__stdcall)
00664930    33C0            XOR EAX,EAX
00664932    52              PUSH EDX
00664933    8BCD            MOV ECX,EBP
00664935    50              PUSH EAX
00664936    8D15 64496600   LEA EDX,[664964]
0066493C    E8 0DC9FFFF     CALL 0066124E
00664941    58              POP EAX
00664942    5A              POP EDX
00664943    5F              POP EDI
00664944    5E              POP ESI
00664945    5B              POP EBX
00664946    8B4D FC         MOV ECX,DWORD PTR SS:[EBP-4]
00664949    33CD            XOR ECX,EBP
0066494B    E8 A4C8FFFF     CALL 006611F4
00664950    81C4 E8000000   ADD ESP,0E8
00664956    3BEC            CMP EBP,ESP
00664958    E8 CEC8FFFF     CALL 0066122B
0066495D    8BE5            MOV ESP,EBP
0066495F    5D              POP EBP
00664960    C3              RETN


func funcA(int* const constPtr, int toChange)

CPU Disasm
Address   Hex dump          Command                                  Comments
00664380    55              PUSH EBP
00664381    8BEC            MOV EBP,ESP
00664383    81EC D8000000   SUB ESP,0D8
00664389    53              PUSH EBX
0066438A    56              PUSH ESI
0066438B    57              PUSH EDI
0066438C    51              PUSH ECX
0066438D    8DBD 28FFFFFF   LEA EDI,[EBP-0D8]
00664393    B9 36000000     MOV ECX,36
00664398    B8 CCCCCCCC     MOV EAX,CCCCCCCC
0066439D    F3:AB           REP STOS DWORD PTR ES:[EDI]
0066439F    59              POP ECX
006643A0    8955 EC         MOV DWORD PTR SS:[EBP-14],EDX            ; [EBP - 14] = toChange
006643A3    894D F8         MOV DWORD PTR SS:[EBP-8],ECX             ; [EBP - 8] = constPtr
006643A6    B9 26C06600     MOV ECX,OFFSET 0066C026
006643AB    E8 71CEFFFF     CALL 00661221
006643B0    8B45 F8         MOV EAX,DWORD PTR SS:[EBP-8]             ; eax = constPtr
006643B3    8B4D EC         MOV ECX,DWORD PTR SS:[EBP-14]            ; ecx = toChange
006643B6    8908            MOV DWORD PTR DS:[EAX],ECX               ; *constPtr = toChange
006643B8    5F              POP EDI
006643B9    5E              POP ESI
006643BA    5B              POP EBX
006643BB    81C4 D8000000   ADD ESP,0D8
006643C1    3BEC            CMP EBP,ESP
006643C3    E8 63CEFFFF     CALL 0066122B
006643C8    8BE5            MOV ESP,EBP
006643CA    5D              POP EBP
006643CB    C3              RETN


func funcB(int* const constPtr, int toChange)

//where set local var?

CPU Disasm
Address   Hex dump          Command                                  Comments
006617E0    55              PUSH EBP
006617E1    8BEC            MOV EBP,ESP
006617E3    81EC C0000000   SUB ESP,0C0
006617E9    53              PUSH EBX
006617EA    56              PUSH ESI
006617EB    57              PUSH EDI
006617EC    8DBD 40FFFFFF   LEA EDI,[EBP-0C0]
006617F2    B9 30000000     MOV ECX,30
006617F7    B8 CCCCCCCC     MOV EAX,CCCCCCCC
006617FC    F3:AB           REP STOS DWORD PTR ES:[EDI]
006617FE    B9 26C06600     MOV ECX,OFFSET 0066C026
00661803    E8 19FAFFFF     CALL 00661221
00661808    8B45 08         MOV EAX,DWORD PTR SS:[EBP+8]             ; eax = constPtr
0066180B    8B4D 0C         MOV ECX,DWORD PTR SS:[EBP+0C]            ; ecx = toChange
0066180E    8908            MOV DWORD PTR DS:[EAX],ECX               ; *constPtr = toChange
00661810    5F              POP EDI
00661811    5E              POP ESI
00661812    5B              POP EBX
00661813    81C4 C0000000   ADD ESP,0C0
00661819    3BEC            CMP EBP,ESP
0066181B    E8 0BFAFFFF     CALL 0066122B
00661820    8BE5            MOV ESP,EBP
00661822    5D              POP EBP
00661823    C2 0800         RETN 8                                   ; clear parameter in callee
