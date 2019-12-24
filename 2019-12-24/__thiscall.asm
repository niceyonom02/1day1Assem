func main()

CPU Disasm
Address   Hex dump          Command                                  Comments
00351943    8D4D E8         LEA ECX,[EBP-18]                         ; [EBP - 18]: pointer to Car object
00351946    E8 0DF9FFFF     CALL 00351258                            ; default constructor
0035194B    68 E4070000     PUSH 7E4                                 ; param1: 7E4 (dec: 2020)
00351950    8D4D E8         LEA ECX,[EBP-18]                         ; pointer to object (__thiscall)
00351953    E8 66F7FFFF     CALL 003510BE                            ; call setCarNum
00351958    83EC 08         SUB ESP,8
0035195B    F20F1005 D07B35 MOVSD XMM0,QWORD PTR DS:[357BD0]         ; FLOAT 5.400000000000000
00351963    F20F110424      MOVSD QWORD PTR SS:[ESP],XMM0            ; param1: double 5.4
00351968    8D4D E8         LEA ECX,[EBP-18]                         ; __thiscall
0035196B    E8 23FAFFFF     CALL 00351393                            ; call acclerate
00351970    33C0            XOR EAX,EAX
00351972    52              PUSH EDX
00351973    8BCD            MOV ECX,EBP
00351975    50              PUSH EAX
00351976    8D15 A4193500   LEA EDX,[3519A4]
0035197C    E8 C3F8FFFF     CALL 00351244
00351981    58              POP EAX
00351982    5A              POP EDX
00351983    5F              POP EDI
00351984    5E              POP ESI
00351985    5B              POP EBX
00351986    8B4D FC         MOV ECX,DWORD PTR SS:[EBP-4]
00351989    33CD            XOR ECX,EBP
0035198B    E8 5FF8FFFF     CALL 003511EF
00351990    81C4 DC000000   ADD ESP,0DC
00351996    3BEC            CMP EBP,ESP
00351998    E8 84F8FFFF     CALL 00351221
0035199D    8BE5            MOV ESP,EBP
0035199F    5D              POP EBP
003519A0    C3              RETN


func setCarNum(int num)

CPU Disasm
Address   Hex dump          Command                                  Comments
003518A0    55              PUSH EBP
003518A1    8BEC            MOV EBP,ESP
003518A3    81EC CC000000   SUB ESP,0CC
003518A9    53              PUSH EBX
003518AA    56              PUSH ESI
003518AB    57              PUSH EDI
003518AC    51              PUSH ECX
003518AD    8DBD 34FFFFFF   LEA EDI,[EBP-0CC]
003518B3    B9 33000000     MOV ECX,33
003518B8    B8 CCCCCCCC     MOV EAX,CCCCCCCC
003518BD    F3:AB           REP STOS DWORD PTR ES:[EDI]
003518BF    59              POP ECX
003518C0    894D F8         MOV DWORD PTR SS:[EBP-8],ECX             ; [EBP - 8]: pointer to object
003518C3    B9 32C03500     MOV ECX,OFFSET 0035C032
003518C8    E8 4AF9FFFF     CALL 00351217
003518CD    8B45 F8         MOV EAX,DWORD PTR SS:[EBP-8]             ; eax = pointer to object
003518D0    8B4D 08         MOV ECX,DWORD PTR SS:[EBP+8]             ; ecx = param1
003518D3    8908            MOV DWORD PTR DS:[EAX],ECX               ; objectAdress + 0x00 = carNumber
003518D5    5F              POP EDI
003518D6    5E              POP ESI
003518D7    5B              POP EBX
003518D8    81C4 CC000000   ADD ESP,0CC
003518DE    3BEC            CMP EBP,ESP
003518E0    E8 3CF9FFFF     CALL 00351221
003518E5    8BE5            MOV ESP,EBP
003518E7    5D              POP EBP
003518E8    C2 0400         RETN 4

func acclerate(double accSpeed)

CPU Disasm
Address   Hex dump          Command                                  Comments
00351830    55              PUSH EBP
00351831    8BEC            MOV EBP,ESP
00351833    81EC CC000000   SUB ESP,0CC
00351839    53              PUSH EBX
0035183A    56              PUSH ESI
0035183B    57              PUSH EDI
0035183C    51              PUSH ECX
0035183D    8DBD 34FFFFFF   LEA EDI,[EBP-0CC]
00351843    B9 33000000     MOV ECX,33
00351848    B8 CCCCCCCC     MOV EAX,CCCCCCCC
0035184D    F3:AB           REP STOS DWORD PTR ES:[EDI]
0035184F    59              POP ECX
00351850    894D F8         MOV DWORD PTR SS:[EBP-8],ECX             ; [EBP - 8]: pointer to object
00351853    B9 32C03500     MOV ECX,OFFSET 0035C032
00351858    E8 BAF9FFFF     CALL 00351217
0035185D    8B45 F8         MOV EAX,DWORD PTR SS:[EBP-8]             ; eax = pointer to object
00351860    F20F1040 08     MOVSD XMM0,QWORD PTR DS:[EAX+8]          ; XMMO = objectAdress + 0x08 (speed)
00351865    F20F5845 08     ADDSD XMM0,QWORD PTR SS:[EBP+8]          ; XMM0 == object's speed += param1
0035186A    8B4D F8         MOV ECX,DWORD PTR SS:[EBP-8]             ; ecx = pointer to object
0035186D    F20F1141 08     MOVSD QWORD PTR DS:[ECX+8],XMM0          ; objectAddress + 0x08 = XMM0 (added value)
00351872    5F              POP EDI
00351873    5E              POP ESI
00351874    5B              POP EBX
00351875    81C4 CC000000   ADD ESP,0CC
0035187B    3BEC            CMP EBP,ESP
0035187D    E8 9FF9FFFF     CALL 00351221
00351882    8BE5            MOV ESP,EBP
00351884    5D              POP EBP
00351885    C2 0800         RETN 8
