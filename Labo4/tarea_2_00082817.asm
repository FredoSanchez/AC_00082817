	org     100h

	mov     ax, 0000h
        add     ax, 8d
        add     ax, 2d
        add     ax, 8d
        add     ax, 1d
        add     ax, 7d
        mov     cl, 5d
        div     cl		;(8+2+8+1+7)/5 = 5.2 => 5

	