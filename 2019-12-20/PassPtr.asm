func main()

CPU Disasm
Address   Hex dump          Command                                  Comments
00E14F43    C745 F4 0200000 MOV DWORD PTR SS:[EBP-0C],2              ; int a = 2 (EBP - 0C: local var)
00E14F4A    8D45 F4         LEA EAX,[EBP-0C]                         ; eax = &a
00E14F4D    8945 E8         MOV DWORD PTR SS:[EBP-18],EAX            ; intPtr([EBP - 18]) = &a
00E14F50    8B45 E8         MOV EAX,DWORD PTR SS:[EBP-18]
00E14F53    50              PUSH EAX                                 ; param: intPtr
00E14F54    E8 49C4FFFF     CALL 00E113A2                            ; call dereference(intPtr)
00E14F59    83C4 04         ADD ESP,4                                ; __cdecl
00E14F5C    8945 DC         MOV DWORD PTR SS:[EBP-24],EAX            ; int b = dereference(intPtr) (EBP - 24: local var)
00E14F5F    8B45 DC         MOV EAX,DWORD PTR SS:[EBP-24]
00E14F62    50              PUSH EAX                                 ; int param b
00E14F63    68 CC7BE100     PUSH OFFSET 00E17BCC                     ; ASCII "%d"
00E14F68    E8 21C4FFFF     CALL 00E1138E                            ; call printf
00E14F6D    83C4 08         ADD ESP,8                                ; __cdecl
00E14F70    C745 E8 0000000 MOV DWORD PTR SS:[EBP-18],0              ; intPtr = nullptr
00E14F77    33C0            XOR EAX,EAX
00E14F79    52              PUSH EDX
00E14F7A    8BCD            MOV ECX,EBP
00E14F7C    50              PUSH EAX
00E14F7D    8D15 A84FE100   LEA EDX,[0E14FA8]
00E14F83    E8 B7C2FFFF     CALL 00E1123F
00E14F88    58              POP EAX
00E14F89    5A              POP EDX
00E14F8A    5F              POP EDI
00E14F8B    5E              POP ESI
00E14F8C    5B              POP EBX
00E14F8D    8B4D FC         MOV ECX,DWORD PTR SS:[EBP-4]
00E14F90    33CD            XOR ECX,EBP
00E14F92    E8 53C2FFFF     CALL 00E111EA
00E14F97    81C4 E8000000   ADD ESP,0E8                              ; clean stack
00E14F9D    3BEC            CMP EBP,ESP                              ; if ebp == esp? (stack cleaned?)
00E14F9F    E8 78C2FFFF     CALL 00E1121C                            ; call checkEsp (Assume)
00E14FA4    8BE5            MOV ESP,EBP
00E14FA6    5D              POP EBP
00E14FA7    C3              RETN


func dereference(int* ptr)

CPU Disasm
Address   Hex dump          Command                                  Comments
00E11E50    55              PUSH EBP
00E11E51    8BEC            MOV EBP,ESP
00E11E53    81EC CC000000   SUB ESP,0CC
00E11E59    53              PUSH EBX
00E11E5A    56              PUSH ESI
00E11E5B    57              PUSH EDI
00E11E5C    8DBD 34FFFFFF   LEA EDI,[EBP-0CC]
00E11E62    B9 33000000     MOV ECX,33
00E11E67    B8 CCCCCCCC     MOV EAX,CCCCCCCC
00E11E6C    F3:AB           REP STOS DWORD PTR ES:[EDI]
00E11E6E    B9 26C0E100     MOV ECX,OFFSET 00E1C026
00E11E73    E8 9AF3FFFF     CALL 00E11212
00E11E78    8B45 08         MOV EAX,DWORD PTR SS:[EBP+8]             ; eax = ptr
00E11E7B    8B08            MOV ECX,DWORD PTR DS:[EAX]               ; ecx = *ptr (ecx = 2)
00E11E7D    894D F8         MOV DWORD PTR SS:[EBP-8],ECX             ; int deref(EBP - 8: local var) = 2
00E11E80    8B45 F8         MOV EAX,DWORD PTR SS:[EBP-8]
00E11E83    83C0 01         ADD EAX,1                                ; add 1 to deref(return value)
00E11E86    5F              POP EDI
00E11E87    5E              POP ESI
00E11E88    5B              POP EBX
00E11E89    81C4 CC000000   ADD ESP,0CC                              ; clean stack
00E11E8F    3BEC            CMP EBP,ESP
00E11E91    E8 86F3FFFF     CALL 00E1121C
00E11E96    8BE5            MOV ESP,EBP
00E11E98    5D              POP EBP
00E11E99    C3              RETN
