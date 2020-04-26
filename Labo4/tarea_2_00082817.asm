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
        mov 	[200h], cl
        mov     cl, "N"
        mov 	[201h], cl

        mov     cl, "E"
        mov 	[203h], cl
	mov     cl, "L"
	mov 	[204h], cl

	mov     cl, "S"
	mov 	[206h], cl
	mov     cl, "E"
	mov 	[207h], cl
	mov     cl, "G"
	mov 	[208h], cl
	mov     cl, "U"
	mov 	[209h], cl
	mov     cl, "N"
	mov 	[20Ah], cl
	mov     cl, "D"
	mov 	[20Bh], cl
	mov     cl, "O"
	mov 	[20Ch], cl



;EJERCICIO 2

	mov 	ax, 0000h
	mov     al, 2d
	mov     bx, 210h
	mov     cx, 2d

calculo:mul     cx
        mov     [bx], ax
	
	cmp     ah, 00h
	ja      doscell

	cmp	ah, 00h
	je      unacell

doscell:add     bx, 2h
	jmp     dia

unacell:add     bx, 1h

dia:    cmp     bx, 21Fh
	jb      calculo


;EJERCICIO 3

	mov     ax, 0d
	mov     [220h], ax  
	mov     ax, 1d
	mov     [221h], ax 
	mov     bx, 222h

fibo:   mov     ax, 0000h
	mov     [bx], ax
	sub     bx, 2h
	mov     al, [bx]
	add     bx, 1h
	add     ax, [bx]
	add     bx, 1h
	mov     [bx], ax
	inc     bx

	cmp     bx, 22Fh
	jb      fibo


	int 20h
