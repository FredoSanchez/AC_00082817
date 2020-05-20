	org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	add 	dl, 9d
	mov 	dh, 4d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 0d
lupi:	mov 	cl, [line1+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	lupi
	ret


section .data
line1	db 	"Ibas a dar equilibrio a la fuerza   NO dejarla en la oscuridad"
len1 	equ	$-line1

line2	db 	"TE ODIOOOOOO"
len2 	equ	$-line2

line3	db 	"Eras mi hermano Anakin   Yo te queria"
len3 	equ	$-line3