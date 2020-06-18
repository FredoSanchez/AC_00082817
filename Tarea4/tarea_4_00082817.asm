org 	100h

section .text

    xor 	si, si 	
    mov 	dx, msg
    call 	print
    

input:
	call 	kb
	cmp 	al, "$"
	je	    conf
    	sub     al, 30h
	mov	    [300h+si], al 
	inc 	si
	jmp 	input

conf:
	mov     bx, 0000h    
	mov     ax, 0000h

promedio:
	add     al, [300h+bx]
	inc     bx
	cmp     bx, 05h
	jb      promedio
	mov     [310h], al
	mov     [320h], bl
	mov     cl, bl
	div     cl
	mov     [330h], al

mostrar:
	mov	dx, nl     
	call	print
	cmp     al, 0Ah
	je      res1
	cmp     al, 09h
	je      res2
	cmp     al, 08h
	je      res3
	cmp     al, 07h
	je      res4
	cmp     al, 06h
	je      res5
	cmp     al, 05h
	je      res6
	cmp     al, 04h
	je      res7
	cmp     al, 03h
	je      res8
	cmp     al, 02h
	je      res9
	cmp     al, 01h
	je      res10

	int     20h

res1:	mov 	dx, msg1
	call 	print
	ret

res2:   mov 	dx, msg2
	call 	print	
	ret
        
res3:	mov 	dx, msg3
	call 	print
	ret

res4:	mov 	dx, 4
	call 	print
	ret

res5:	mov 	dx, msg5
	call 	print
	ret

res6:	mov 	dx, msg6
	call 	print	
	ret

res7:	mov 	dx, msg7
	call 	print
	ret

res8:	mov 	dx, msg8
	call 	print
	ret

res9:	mov 	dx, msg9
	call 	print
	ret

res10:	mov 	dx, msg10
	call 	print
	ret

kb:	mov	ah, 7h 
	int 	21h
	ret

print:	mov	ah, 09h
	int 	21h
	ret
	
section .data

msg 	db 	"Ingrese los 5 ultimos numeros de su carnet y luego signo de dolar: $"
msg1 	db 	"Perfecto solo Dios$"
msg2 	db 	"Siempre me esfuerzo$"
msg3 	db 	"Colocho$"
msg4 	db 	"Muy bien$"
msg5 	db 	"Peor es nada$"
msg6 	db 	"En el segundo$"
msg7 	db 	"Me recupero$"
msg8 	db 	"Hay salud$"
msg9 	db 	"Aun se pasa$"
msg10 	db 	"Solo necesito el 0$"
nl	db 	0xA, 0xD, "$"