func main()

CPU Disasm
Address   Hex dump          Command                                  Comments
00AFAA03    C745 E4 0300000 MOV DWORD PTR SS:[EBP-1C],3              ; array + 0 * 4
00AFAA0A    C745 E8 0200000 MOV DWORD PTR SS:[EBP-18],2              ; array + 1 * 4
00AFAA11    C745 EC 0700000 MOV DWORD PTR SS:[EBP-14],7              ; array + 2 * 4
00AFAA18    C745 F0 0600000 MOV DWORD PTR SS:[EBP-10],6              ; array + 3 * 4
00AFAA1F    C745 F4 0F00000 MOV DWORD PTR SS:[EBP-0C],0F             ; array + 4 * 4
00AFAA26    6A 05           PUSH 5                                   ; param2: element amount of array
00AFAA28    8D45 E4         LEA EAX,[EBP-1C]
00AFAA2B    50              PUSH EAX                                 ; param1: array address
00AFAA2C    E8 056CFFFF     CALL 00AF1636                            ; call selectionSort(param1, param2)
00AFAA31    83C4 08         ADD ESP,8                                ; __cdecl
00AFAA34    8BF4            MOV ESI,ESP
00AFAA36    68 E813AF00     PUSH OFFSET 00AF13E8
00AFAA3B    68 30FCAF00     PUSH OFFSET 00AFFC30                     ; ASCII "after sort: "
00AFAA40    A1 A040B000     MOV EAX,DWORD PTR DS:[0B040A0]
00AFAA45    50              PUSH EAX
00AFAA46    E8 9468FFFF     CALL 00AF12DF
00AFAA4B    83C4 08         ADD ESP,8
00AFAA4E    8BC8            MOV ECX,EAX
00AFAA50    FF15 AC40B000   CALL DWORD PTR DS:[0B040AC]
00AFAA56    3BF4            CMP ESI,ESP
00AFAA58    E8 4F69FFFF     CALL 00AF13AC
00AFAA5D    C745 D8 0000000 MOV DWORD PTR SS:[EBP-28],0              ; start loop(cout << array[i])
00AFAA64    EB 09           JMP SHORT 00AFAA6F
00AFAA66    8B45 D8         MOV EAX,DWORD PTR SS:[EBP-28]
00AFAA69    83C0 01         ADD EAX,1                                ; i++
00AFAA6C    8945 D8         MOV DWORD PTR SS:[EBP-28],EAX
00AFAA6F    837D D8 05      CMP DWORD PTR SS:[EBP-28],5              ; compare i, 5
00AFAA73    7D 1F           JGE SHORT 00AFAA94                       ; i >= 5 -> jmp
00AFAA75    8BF4            MOV ESI,ESP
00AFAA77    8B45 D8         MOV EAX,DWORD PTR SS:[EBP-28]
00AFAA7A    8B4C85 E4       MOV ECX,DWORD PTR SS:[EAX*4+EBP-1C]      ; ecx = [i * 4 + array start address]
00AFAA7E    51              PUSH ECX                                 ; param1: number to print
00AFAA7F    8B0D A040B000   MOV ECX,DWORD PTR DS:[0B040A0]
00AFAA85    FF15 E840B000   CALL DWORD PTR DS:[0B040E8]              ; call cout
00AFAA8B    3BF4            CMP ESI,ESP
00AFAA8D    E8 1A69FFFF     CALL 00AF13AC
00AFAA92  ^ EB D2           JMP SHORT 00AFAA66                       ; jump to i increasement
00AFAA94    33C0            XOR EAX,EAX
00AFAA96    52              PUSH EDX
00AFAA97    8BCD            MOV ECX,EBP
00AFAA99    50              PUSH EAX
00AFAA9A    8D15 C8AAAF00   LEA EDX,[0AFAAC8]
00AFAAA0    E8 4869FFFF     CALL 00AF13ED
00AFAAA5    58              POP EAX
00AFAAA6    5A              POP EDX
00AFAAA7    5F              POP EDI
00AFAAA8    5E              POP ESI
00AFAAA9    5B              POP EBX
00AFAAAA    8B4D FC         MOV ECX,DWORD PTR SS:[EBP-4]
00AFAAAD    33CD            XOR ECX,EBP
00AFAAAF    E8 7B68FFFF     CALL 00AF132F
00AFAAB4    81C4 EC000000   ADD ESP,0EC
00AFAABA    3BEC            CMP EBP,ESP
00AFAABC    E8 EB68FFFF     CALL 00AF13AC
00AFAAC1    8BE5            MOV ESP,EBP
00AFAAC3    5D              POP EBP
00AFAAC4    C3              RETN


func selectionSort(int* firstElement, size_t size)

CPU Disasm
Address   Hex dump          Command                                  Comments
00AF34A0    55              PUSH EBP
00AF34A1    8BEC            MOV EBP,ESP
00AF34A3    81EC F0000000   SUB ESP,0F0
00AF34A9    53              PUSH EBX
00AF34AA    56              PUSH ESI
00AF34AB    57              PUSH EDI
00AF34AC    8DBD 10FFFFFF   LEA EDI,[EBP-0F0]
00AF34B2    B9 3C000000     MOV ECX,3C
00AF34B7    B8 CCCCCCCC     MOV EAX,CCCCCCCC
00AF34BC    F3:AB           REP STOS DWORD PTR ES:[EDI]
00AF34BE    B9 2660B000     MOV ECX,OFFSET 00B06026
00AF34C3    E8 D5DEFFFF     CALL 00AF139D
00AF34C8    C745 F8 0000000 MOV DWORD PTR SS:[EBP-8],0               ; min = 0
00AF34CF    C745 EC 0000000 MOV DWORD PTR SS:[EBP-14],0              ; temp = 0
00AF34D6    C745 E0 0000000 MOV DWORD PTR SS:[EBP-20],0              ; i = 0
00AF34DD    EB 09           JMP SHORT 00AF34E8
00AF34DF    8B45 E0         MOV EAX,DWORD PTR SS:[EBP-20]
00AF34E2    83C0 01         ADD EAX,1                                ; i++
00AF34E5    8945 E0         MOV DWORD PTR SS:[EBP-20],EAX
00AF34E8    8B45 0C         MOV EAX,DWORD PTR SS:[EBP+0C]            ; size
00AF34EB    83E8 01         SUB EAX,1                                ; size - 1
00AF34EE    3945 E0         CMP DWORD PTR SS:[EBP-20],EAX            ; compare i, size - 1
00AF34F1    73 75           JNB SHORT 00AF3568                       ; if(i >= size  - 1) -> jump (cf == 0)
00AF34F3    8B45 E0         MOV EAX,DWORD PTR SS:[EBP-20]
00AF34F6    8945 F8         MOV DWORD PTR SS:[EBP-8],EAX             ; min = i
00AF34F9    8B45 E0         MOV EAX,DWORD PTR SS:[EBP-20]
00AF34FC    83C0 01         ADD EAX,1
00AF34FF    8945 D4         MOV DWORD PTR SS:[EBP-2C],EAX            ; k = i + 1 (k = [EBP - 2C])
00AF3502    EB 09           JMP SHORT 00AF350D
00AF3504    8B45 D4         MOV EAX,DWORD PTR SS:[EBP-2C]
00AF3507    83C0 01         ADD EAX,1                                ; k++
00AF350A    8945 D4         MOV DWORD PTR SS:[EBP-2C],EAX
00AF350D    8B45 D4         MOV EAX,DWORD PTR SS:[EBP-2C]
00AF3510    3B45 0C         CMP EAX,DWORD PTR SS:[EBP+0C]            ; compare k, size
00AF3513    73 1C           JNB SHORT 00AF3531                       ; if(k >= size) -> jump
00AF3515    8B45 F8         MOV EAX,DWORD PTR SS:[EBP-8]             ; eax = min
00AF3518    8B4D 08         MOV ECX,DWORD PTR SS:[EBP+8]             ; ecx = firstElement
00AF351B    8B55 D4         MOV EDX,DWORD PTR SS:[EBP-2C]            ; edx = k
00AF351E    8B75 08         MOV ESI,DWORD PTR SS:[EBP+8]             ; esi = firstElement
00AF3521    8B0481          MOV EAX,DWORD PTR DS:[EAX*4+ECX]         ; eax = [min * 4 + firstElement]
00AF3524    3B0496          CMP EAX,DWORD PTR DS:[EDX*4+ESI]         ; compare [min * 4 + firstElement], [k * 4 + firstElement]
00AF3527    7E 06           JLE SHORT 00AF352F                       ; if(eax <= [edx * 4 + esi]) -> jmp (sf == 1 / zf == 1)
00AF3529    8B45 D4         MOV EAX,DWORD PTR SS:[EBP-2C]            ; eax = k
00AF352C    8945 F8         MOV DWORD PTR SS:[EBP-8],EAX             ; min = k
00AF352F  ^ EB D3           JMP SHORT 00AF3504
00AF3531    8B45 E0         MOV EAX,DWORD PTR SS:[EBP-20]
00AF3534    3B45 F8         CMP EAX,DWORD PTR SS:[EBP-8]             ; compare i, min
00AF3537    74 2A           JE SHORT 00AF3563                        ; if(i == min) jmp
00AF3539    8B45 E0         MOV EAX,DWORD PTR SS:[EBP-20]            ; eax = i
00AF353C    8B4D 08         MOV ECX,DWORD PTR SS:[EBP+8]             ; ecx = firstElement
00AF353F    8B1481          MOV EDX,DWORD PTR DS:[EAX*4+ECX]         ; edx = [i * 4 + firstElement]
00AF3542    8955 EC         MOV DWORD PTR SS:[EBP-14],EDX            ; temp = edx
00AF3545    8B45 E0         MOV EAX,DWORD PTR SS:[EBP-20]            ; eax = i
00AF3548    8B4D 08         MOV ECX,DWORD PTR SS:[EBP+8]             ; ecx = firstElement
00AF354B    8B55 F8         MOV EDX,DWORD PTR SS:[EBP-8]             ; edx = min
00AF354E    8B75 08         MOV ESI,DWORD PTR SS:[EBP+8]             ; esi = firstElement
00AF3551    8B1496          MOV EDX,DWORD PTR DS:[EDX*4+ESI]         ; edx = [min * 4 + firstElement]
00AF3554    891481          MOV DWORD PTR DS:[EAX*4+ECX],EDX         ; [i * 4 + firstElement] = [min * 4 + firstElement]
00AF3557    8B45 F8         MOV EAX,DWORD PTR SS:[EBP-8]             ; eax = min
00AF355A    8B4D 08         MOV ECX,DWORD PTR SS:[EBP+8]             ; ecx = firstElement
00AF355D    8B55 EC         MOV EDX,DWORD PTR SS:[EBP-14]            ; edx = temp
00AF3560    891481          MOV DWORD PTR DS:[EAX*4+ECX],EDX         ; [min * 4 + firstElement] = temp
00AF3563  ^ E9 77FFFFFF     JMP 00AF34DF
00AF3568    5F              POP EDI
00AF3569    5E              POP ESI
00AF356A    5B              POP EBX
00AF356B    81C4 F0000000   ADD ESP,0F0
00AF3571    3BEC            CMP EBP,ESP
00AF3573    E8 34DEFFFF     CALL 00AF13AC
00AF3578    8BE5            MOV ESP,EBP
00AF357A    5D              POP EBP
00AF357B    C3              RETN
