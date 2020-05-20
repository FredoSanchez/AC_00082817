	org 	100h

section .text

	call 	texto	
	call 	cursor

	mov	ah, 4d
	mov	[200h], ah
	mov 	ah, 10d
	mov	[210h], ah
	call 	phrase1

	mov	ah, 13d
	mov	[200h], ah
	mov 	ah, 40d
	mov	[210h], ah
	call 	phrase2

	mov	ah, 21d
	mov	[200h], ah
	mov 	ah, 20d
	mov	[210h], ah
	call 	phrase3

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
	add 	dl, [210h]
	mov 	dh, [200h] ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase1:mov 	di, 0d
lupi1:	mov 	cl, [line1+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	lupi1
	ret

phrase2:mov 	di, 0d
lupi2:	mov 	cl, [line2+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi2
	ret

phrase3:mov 	di, 0d
lupi3:	mov 	cl, [line3+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi3
	ret

section .data
line1	db 	"Ibas a dar equilibrio a la fuerza   NO dejarla en la oscuridad"
len1 	equ	$-line1

line2	db 	"TE ODIOOOOOO"
len2 	equ	$-line2

line3	db 	"Eras mi hermano Anakin. Yo te queria"
len3 	equ	$-line3