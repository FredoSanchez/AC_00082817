	org     100h

; EJERCICIO 1

	mov     ax, 0000h
        add     ax, 8d
        add     ax, 2d
        add     ax, 8d
        add     ax, 1d
        add     ax, 7d
        mov     cl, 5d
        div     cl		;(8+2+8+1+7)/5 = 5.2 => 5

	mov     cl, "E"
        mov [200h], cl
        mov     cl, "N"
        mov [201h], cl
        mov     cl, "E"
        mov [202h], cl
	mov     cl, "L"
	mov [203h], cl
	mov     cl, "S"
	mov [204h], cl
	mov     cl, "E"
	mov [205h], cl
	mov     cl, "G"
	mov [206h], cl
	mov     cl, "U"
	mov [206h], cl
	mov     cl, "N"
	mov [208h], cl
	mov     cl, "D"
	mov [209h], cl
	mov     cl, "0"
	mov [20Ah], cl


	int 20h
