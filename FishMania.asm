;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[org 0x0100]
 mov [cs:DataSegment],ds
jmp main2
oldisr: dd 0
oldTimerisr: dd 0
arr: dw 2940,3760,3108,3228,3300,2880,3620,3700,3620,3208,3000,3916,3822,3776,3660
arr2: dw 3710,2950,3788,3186,3100,3740,3012,2944,3226,3350,3812
tickcount: dw 0
tickcount2: dw 0
index: dw 0
index2: dw 0
score: dw 0
Current_RedCell: dw 0
Current_GreenCell: dw 0
Current_FishCell: dw 0
scr: db 'SCORE: '
DataSegment: dw 0
 GameEndMsg: db ' END OF FISHING GAME ',0
 GameSMsg: db ' OPENING FISH MANIA  ',0
  FetchData: db ' Fetching Data ...',0
 CalcResult: db ' Calculating Results ...',0 
 Ready: db ' LOADING GAME',0 
PrintResult: db ' Printing',0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					;PRINTS THE SKY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sky:
push bp
mov bp,sp
push ax
push cx
push di
mov ax,0xB800
mov es,ax
mov di,0
mov cx,1760 
s1:
	mov word[es:di],0x3320
	add di,2
	cmp di,cx
	jnz s1
pop di
pop cx
pop ax
pop bp
ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					;SCORE PRINTING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 prntscore:
      push bp
       mov  bp,sp
       sub  sp,2					;create space for local variable
       push es
       push ax
       push bx
       push cx
       push dx
       push di
       push si

       mov ax,0xb800
       mov es,ax
       cld							;auto increment method 

 mov ax,0x04b1
 mov di,1156
 mov cx,8
 rep stosw
mov di,1156
mov [es:di+160],ax
mov [es:di+162],ax
mov [es:di+320],ax
mov [es:di+322],ax
mov [es:di+480],ax
mov [es:di+482],ax
add di,480
mov cx,8
rep stosw
mov [es:di+156],ax
mov [es:di+158],ax
mov [es:di+316],ax
mov [es:di+318],ax
mov [es:di+476],ax
mov [es:di+478],ax
add di,478
std
mov cx,8
rep stosw
cld


mov di,1176
mov cx,8
rep stosw
mov di,1176
mov [es:di+160],ax
mov [es:di+162],ax
mov [es:di+320],ax
mov [es:di+322],ax
mov [es:di+480],ax
mov [es:di+482],ax
mov [es:di+640],ax
mov [es:di+642],ax
mov [es:di+800],ax
mov [es:di+802],ax
mov [es:di+960],ax
mov [es:di+962],ax
add di,960
mov cx,8
rep stosw

mov di,1196
mov cx,8
rep stosw
mov di,1196
mov [es:di+160],ax
mov [es:di+162],ax
mov [es:di+320],ax
mov [es:di+322],ax
mov [es:di+480],ax
mov [es:di+482],ax
mov [es:di+640],ax
mov [es:di+642],ax
mov [es:di+800],ax
mov [es:di+802],ax
mov [es:di+960],ax
mov [es:di+962],ax
add di,960
mov cx,8
rep stosw
mov di,1212
mov [es:di],ax
mov [es:di+2],ax
mov [es:di+160],ax
mov [es:di+162],ax
mov [es:di+320],ax
mov [es:di+322],ax
mov [es:di+480],ax
mov [es:di+482],ax
mov [es:di+640],ax
mov [es:di+642],ax
mov [es:di+800],ax
mov [es:di+802],ax
mov [es:di+960],ax
mov [es:di+962],ax


mov di,1220
mov cx,8
rep stosw
mov di,1220
mov [es:di+160],ax
mov [es:di+162],ax
mov [es:di+320],ax
mov [es:di+322],ax
mov [es:di+480],ax
mov [es:di+482],ax
mov [es:di+640],ax
mov [es:di+642],ax
mov [es:di+800],ax
mov [es:di+802],ax
mov [es:di+960],ax
mov [es:di+962],ax
add di,480
mov cx,8
rep stosw
mov di,1236
mov [es:di],ax
mov [es:di+2],ax
mov [es:di+160],ax
mov [es:di+162],ax
mov [es:di+320],ax
mov [es:di+322],ax
mov [es:di+480],ax
mov [es:di+482],ax
mov di,1220
add di,480
add di,12
mov [es:di+160],ax
mov [es:di+162],ax
mov [es:di+320],ax
mov [es:di+322],ax
mov [es:di+480],ax
mov [es:di+482],ax
mov [es:di+484],ax


mov di,1242
mov cx,8
rep stosw
mov di,1242
mov [es:di+160],ax
mov [es:di+162],ax
mov [es:di+320],ax
mov [es:di+322],ax
mov [es:di+480],ax
mov [es:di+482],ax
mov [es:di+640],ax
mov [es:di+642],ax
mov [es:di+800],ax
mov [es:di+802],ax
mov [es:di+960],ax
mov [es:di+962],ax
add di,480
mov cx,8
rep stosw
mov di,1242
add di,480
add di,480
mov cx,8
rep stosw

push es
push ax
push bx
push cx
push dx
push di
mov ax, 0xb800
mov es, ax 
mov ax, [score]
mov bx, 10
mov cx, 0											; initialize count of digits
nextdigit2:
		mov dx, 0									; zero upper half of dividend
		div bx										; divide by 10
		add dl, 0x30								; convert digit into ascii value
		push dx										; save ascii value on stack
		inc cx										; increment count of values
		cmp ax, 0									; is the quotient zero
		jnz nextdigit2								; if no divide it again
		mov di, 3140								; point di to 70th column
	nextpos2: 
	pop dx											; remove a digit from the stack
	mov dh, 0x0e									; use normal attribute
	mov [es:di], dx									; print char on screen
	add di, 2										; move to next screen location
	loop nextpos2									; repeat for all digits on stack
pop di
pop dx
pop cx
pop bx
pop ax 
pop es

       pop si
       pop di
       pop dx
       pop cx
       pop bx
       pop ax
       pop es
       add sp,2
       pop bp

       ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					;PRINTS RESULT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
loadresult:
        push bp
        mov  bp,sp
        push si
        push es
        push ax
        push bx 
        push cx
        push dx
        push di
        push ds
        mov ax,0xb800
        mov es,ax
        cld
        call clrscr
		mov  ax,28                ; load x position
		push ax                   ; push x position
		mov  ax,5                 ; load y position
		push ax                   ; push y position
		mov  ax,0x0004            ; red on black attribute
		push ax                   ; push attribute
		mov  ax,GameEndMsg        ; load string address
		push ax                   ; push string address
		call prntstr              ; FUNCTION CALL:  PRINTING STRING

		call delay
		call delay
		call delay
		call delay
		call delay
		call delay
		call delay
		call delay
		call delay
		call delay
		call delay

		mov  ax,32                ; load x position
		push ax                   ; push x position
		mov  ax,8                 ; load y position
		push ax                   ; push y position
		mov  ax,0x000e            ; red on black attribute
		push ax                   ; push attribute
		mov  ax,FetchData         ; load string address
		push ax                   ; push string address
		call prntstr              ; FUNCTION CALL:  PRINTING STRING

		mov ax,0x0720
		mov di,1374
		xor bx,bx

loopFD:
			push di
			mov cx,4
			rep stosw
			pop di
			call delay
			call delay
			call delay
			call delay
			mov word[es:di],0x0e2e
			call delay
			call delay
			call delay
			call delay
			mov word[es:di+2],0x0e2e
			call delay
			call delay
			call delay
			call delay
			mov word[es:di+4],0x0e2e
			call delay
			call delay
			call delay
			call delay
			inc bx
			cmp bx,4
			jne loopFD
			
			mov  ax,29                ; load x position
			push ax                   ; push x position
			mov  ax,11                ; load y position
			push ax                   ; push y position
			mov  ax,0x0008            ; red on black attribute
			push ax                   ; push attribute
			mov  ax,CalcResult        ; load string address
			push ax                   ; push string address
			call prntstr              ; FUNCTION CALL:  PRINTING STRING
			
			mov ax,0x0720
			mov di,1860
			xor bx,bx
			
loopCR:
			push di
			mov cx,4
			rep stosw
			pop di
			call delay
			call delay
			call delay
			call delay
			call delay
			call delay
			mov word[es:di],0x082e
			call delay
			call delay
			call delay
			call delay
			call delay
			call delay
			mov word[es:di+2],0x082e
			call delay
			call delay
			call delay
			call delay
			call delay
			call delay
			mov word[es:di+4],0x082e
			call delay
			call delay
			call delay
			call delay
			call delay
			call delay
			inc bx
			cmp bx,4
			jne loopCR

			mov  ax,35						 ; load x position
			push ax							 ; push x position
			mov  ax,13						 ; load y position
			push ax							 ; push y position
			mov  ax,0x000c					 ; red on black attribute
			push ax							 ; push attribute
			mov  ax,PrintResult				 ; load string address
			push ax							 ; push string address
			call prntstr					 ; FUNCTION CALL:  PRINTING STRING

			mov di,2172

			call delay
			call delay
			call delay
			call delay
			call delay
			call delay
			mov word[es:di],0x0c2e
			call delay
			call delay
			call delay
			call delay
			call delay
			call delay
			call delay
			mov word[es:di+2],0x0c2e
			call delay
			call delay
			call delay
			call delay
			call delay
			call delay
			call delay
			mov word[es:di+4],0x0c2e
			call delay
			call delay
			call delay
			call delay
			call delay
			call delay
			call delay

			   pop ds
			   pop di
			   pop dx
			   pop cx
			   pop bx
			   pop ax
			   pop es
			   pop si
			   pop bp

			   ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
				;PRINTS LOADING SCREEN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
loadscr:

       push bp
       mov  bp,sp
       push si
       push es
       push ax
       push bx 
       push cx
       push dx
       push di
       push ds

       mov ax,0xb800
       mov es,ax

       cld

       call clrscr

    mov  ax,28                ; load x position
    push ax                   ; push x position
    mov  ax,5                 ; load y position
    push ax                   ; push y position
    mov  ax,0x0004            ; red on black attribute
    push ax                   ; push attribute
    mov  ax,GameSMsg          ; load string address
    push ax                   ; push string address
    call prntstr              ; FUNCTION CALL:  PRINTING STRING

   call delay
   call delay
   call delay
   call delay
   call delay
   call delay
   call delay
   call delay
   call delay
   call delay
   call delay

    mov  ax,32                ; load x position
    push ax                   ; push x position
    mov  ax,8                 ; load y position
    push ax                   ; push y position
    mov  ax,0x000e            ; red on black attribute
    push ax                   ; push attribute
    mov  ax,FetchData         ; load string address
    push ax                   ; push string address
    call prntstr              ; FUNCTION CALL:  PRINTING STRING

    mov ax,0x0720
    mov di,1374
    xor bx,bx

loopFD2:
    push di
    mov cx,4
    rep stosw
    pop di
    call delay
    call delay
    call delay
    call delay
    mov word[es:di],0x0e2e
    call delay
    call delay
    call delay
    call delay
    mov word[es:di+2],0x0e2e
    call delay
    call delay
    call delay
    call delay
    mov word[es:di+4],0x0e2e
    call delay
    call delay
    call delay
    call delay
    inc bx
    cmp bx,4
    jne loopFD2

    mov  ax,29                ; load x position
    push ax                   ; push x position
    mov  ax,11                ; load y position
    push ax                   ; push y position
    mov  ax,0x0008            ; red on black attribute
    push ax                   ; push attribute
    mov  ax,Ready			  ; load string address
    push ax                   ; push string address
    call prntstr              ; FUNCTION CALL:  PRINTING STRING

    mov ax,0x0720
    mov di,1860
    xor bx,bx

loopCR2:
    push di
    mov cx,4
    rep stosw
    pop di
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    mov word[es:di],0x082e
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    mov word[es:di+2],0x082e
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    mov word[es:di+4],0x082e
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    inc bx
    cmp bx,4
    jne loopCR2

  


       pop ds
       pop di
       pop dx
       pop cx
       pop bx
       pop ax
       pop es
       pop si
       pop bp

       ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ;PRINTS THE MOUNTAIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mountain:
       push bp
	   mov bp,sp
	   push ax
	   push di
	   push es
	   push cx
	   push dx
	   mov ax,0xb800
	   mov es,ax
	   mov dx,0
	   mov di,[bp+6]
	   mov cx,[bp+4]
	   outerlp:
	   push di
	   clrlp:                                 ;color loop
	   mov word[es:di],0x6620
	   add di,2
	   cmp di,cx
	   jnz clrlp

	  pop di
	   sub di,158                             ;moving above+2 location i-e start 
	   sub cx,162                             ;moving above-2 location i-e end

	   add dx,1
	   cmp dx,10                              ; we have to run this loop 10 times
	   jnz outerlp

	   pop dx
	   pop cx
	   pop es
	   pop di
	   pop ax
	   pop bp
	   ret 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			  ;PRINTS THE SHIP CHIMNEYS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
shipchimney:
push bp
   mov bp,sp
   push ax
   push es
   push di
   mov di,[bp+4]
   mov ax,0xb800
   mov es,ax

   push di
   mov cx,6
   sc1:
   mov word[es:di],0x0edb
   add di,2
   sub cx,1
   cmp cx,0
   jnz sc1
   pop di

   mov cx,6
   sub di,160
    push di
   sc2:
   mov word[es:di],0x0edb
   add di,2
   sub cx,1
   cmp cx,0
   jnz sc2
   pop di
   pop di
   pop es
   pop ax
   pop bp

   ret 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
				;PRINTS THE SEA SHORE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
shore:
	push bp
	mov bp,sp
	push ax
	push es
	push di
	mov ax,0xB800
	mov es,ax
	mov di,[bp+6]		
	printshore:
		mov word[es:di],0x082d			
		add di,2
		cmp di,[bp+4]		
		jnz printshore

	pop di
	pop es
	pop ax
	pop bp
	ret 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;PRINTS THE BUILDINGS AT TOP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

buildings:
	push bp
	mov bp,sp
	push ax
	push es
	push di
	push cx
	push dx
	mov ax, 0xB800 
	mov es, ax 
    mov di,[bp+14]				    ;L1 START
	mov cx,[bp+12]			    	;L1 END
	
    ;Roof;

	L1:
		mov word[es:di],0xaa20   
		add  di,2
		cmp di,cx
		jne L1
	
		mov di,[bp+12]				           ;L2 START = L1 END
	    mov cx,[bp+10]				           ;L2 END
									        
	;RIGHT WALL;;					        
									        
	L2: 							        
		mov word[es:di],0xaa20 ;|	        
		add di,160					        
		cmp di,cx					        
		jnz L2						        
									        
    	mov di,[bp+14]				            ;L3 START = L1 START
	    mov cx,[bp+8]				            ;L3 END 

	;;LEFT WALL;;

	L3:
		mov word[es:di],0xaa20	;|
		add di,160
		cmp di,cx
		jnz L3
		mov di,[bp+6]							;L4 START
		mov cx,[bp+4]							;L4 END


	;;CENTER WALL;;

	L4:
		
			mov word[es:di],0xaa20
			add di,160
			cmp di,cx
			jnz L4
     mov di,[bp+8]				                 ;L5 START = L3 END
	 mov cx,[bp+10]				                 ;L5 END = L2 END
	 add cx,2		
	 
	 ;BASE OF BUILDING

	 L5:
	 
			mov word[es:di],0xff20
			add di,2
			cmp di,cx
			jnz L5
					
	;filling out 

	;filling left;
			mov di,[bp+14]					;L1 START i.e roof
			add di,162						;next row+2 of roof
			mov cx,[bp+6]					;Ending point i.e. start of Center wall (L4)
			mov ax,di
			mov dx,cx
			sub word[bp+4],160				;Ending of center wall

			outer:
			mov di,ax ;strt
			mov cx,dx ;end
			L6:
			mov word[es:di],0x052D
			add di,2
			cmp di,cx
			jnz L6
			add ax,160
			add dx,160
			cmp cx,[bp+4]					;end of center wall
			jnz outer

			;clearing:

			;filling right;
			xor ax,ax
			xor dx,dx
			mov ax,[bp+6]					;Ending point i.e. start of Center wall (L4)
			add ax,2
			mov dx,[bp+12]					;end of roof loc
			add dx,160
			sub word[bp+10],160				;end loc of left wall-160
			outer2:
				mov di,ax ;strt
				mov cx,dx ;end
			L7:	
				mov word[es:di],0x052D
				add di,2
				cmp di,cx
				jnz L7
		
			add ax,160
			add dx,160
			cmp cx,[bp+10]
			jnz outer2
	 pop dx		
	 pop cx
	 pop di
	 pop es
	 pop ax
	 pop bp
	 ret 12


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
				;PRINTS THE SEA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sea:
	
	push bp
	mov bp,sp
	push ax
	push es
	push di
	mov ax, 0xB800 
	mov es, ax 
	mov di,1920 


printsea:
		
		mov word[es:di],0x1720
		add di,2
		cmp di,4000
		jne printsea

		pop di
		pop es
		pop ax
		pop bp
		ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;MOVING THE PROGRAM FUNCTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

movement: 

       push bp
       mov bp,sp
       push di 
       push ax
       push es
       push cx
       push si
       push ds

       mov ax,0xb800
       mov es,ax  
       mov ds,ax


       cld								 ;auto increment
       mov di,160
       mov si,162
       mov bx,0
       mov cx,0

outerloop1:
       push cx                           ;counts the number of rows
       mov cx,158                     
       mov ax,[es:bx]                    ;start loc to move at the end

   l11: 
        movsw	
        sub cx,2
        add bx,2
        cmp cx,0
        jne  l11
        
        mov [es:bx],ax                       ;copying end loc with start
        add bx,2                             ;come downwards
      
        pop dx 
        inc dx                               ;increment the number of rows done
       mov di,160
       mov si,162
       mov cx,dx
 lx:                                         ;adds til the desired row comes
      add di,160
      add si,160 
      loop lx

      mov cx,dx
      cmp cx,11
      jne outerloop1




;CODE FOR SHIFTING SHIPS TO RIGHT

       std 
       mov di,2078					 ;coordinate of right end below buildings
       mov si,2076					 ;coordinate -2 of right end below buildings
       mov bx,2078					 ;saving the value of first coordinate so that it wont get overwritten
       mov cx,13					 ;the row number is 13th

outerloop2:							 ;THIS LOOP MOVES THE SHIPS TO THE RIGHT
       push cx						 ;for loop that shifts row
       push di						 ;it will run the loop
       push si						 ;for loop running
       mov cx,158					 ;counter for loop
       mov ax,[es:bx]				 ;saved the first coordinate of row to ax register so that it wont get overwritten
	 
   l22: 
        movsw
        sub cx,2 
        sub bx,2					 ;subtracting bx also because we have to place the above saved value in last location loop reaches
        cmp cx,0					 
        jne  l22					 
        							 
        mov [es:bx],ax				 ;placing saved value to last location that loop reached
       pop si						 ;getting back original value of si
       pop di						 ;getting back original value of di
       mov bx,di					 ;for saving first coordinate of respective index
       add di,160					 ;moving down to next row
       add si,160					 ;moving down to next row
       pop cx						 ;getting back value of cx
       inc cx						 ;increments value of cx as 1 row completes
      cmp cx,19						 ;for running the loop to 25th row times
      jne outerloop2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
exit:
       pop ds  
       pop si           
       pop cx
       pop es
       pop ax
       pop di
       pop bp

       ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					;SHIP PRINTING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
shipn:
   push bp
   mov bp,sp
   push ax
   push es
   push di
   push cx
   push bx
   mov di,[bp+6]
   mov cx,[bp+4]
   mov ax,0xb800
   mov es,ax
   push di
   s11:
   mov word[es:di],0xff20
    add di,2
	cmp di,cx
	jnz s11
	pop di
   sub cx,158
   sub di,162
   push di
      s22:
   mov word[es:di],0x4420
    add di,2
	cmp di,cx
	jnz s22
	pop di

	 sub cx,158
	sub di,162
	   push di
      s3:
   mov word[es:di],0x0020
    add di,2
	cmp di,cx
	jnz s3
	pop di

		sub cx,158
	sub di,162
	   push di
      s4:
   mov word[es:di],0x4420
    add di,2
	cmp di,cx
	jnz s4
	pop di


	pop bx
	pop cx
	pop di
	pop es
	pop ax
	pop bp

	ret 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;FUNCTION TO DELAY THE PROGRAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

delay:
       push cx
       mov cx,0xffff
loop1: loop loop1
       mov cx,0xffff
loop2: loop loop2
       pop cx
       ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		    	;CLEARS THE DOSBOX SCREN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clrscr:	
		push ax
		push di
		push es
		mov ax, 0xB800 
		mov es, ax 
		mov di, 0 
	nextchar: 
			mov word [es:di], 0x0720
			add di, 2
			cmp di, 4000 
			jne nextchar 
	popping:
			pop es
			pop di
			pop ax
		ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		    		;SOUND
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



sound:


 mov cx, 5
Sloop1:         mov al, 0b6h
out 43h, al

;load the counter 2 value for d3
mov ax, 1fb4h
out 42h, al
mov al, ah
out 42h, al

;turn the speaker on
in al, 61h
mov ah,al
or al, 3h
out 61h, al
call delay
mov al, ah
out 61h, al

call delay

;load the counter 2 value for a3
mov ax, 152fh
out 42h, al
mov al, ah
out 42h, al

;turn the speaker on
in al, 61h
mov ah,al
or al, 3h
out 61h, al
call delay
mov al, ah
out 61h, al

call delay
	
;load the counter 2 value for a4
mov ax, 0A97h
out 42h, al
mov al, ah
out 42h, al
	
;turn the speaker on
in al, 61h
mov ah,al
or al, 3h
out 61h, al
call delay
mov al, ah
out 61h, al

call delay
 
 loop Sloop1
 ret

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;RED BOX;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

rect:
  push bp
  mov bp,sp
  push ax
  push es
  push di
  push cx
push dx
mov dx,10
mov ax,0xb800
mov es,ax
mov di,[bp+6]
mov cx,[bp+4]

outerrec:
push di
push cx
rec:
mov word[es:di],0x04db
add di,2
cmp di,cx
jne rec
pop cx
pop di
add cx,160
add di,160
dec dx
jnz outerrec

pop dx
pop cx
pop di
pop es
pop ax
pop bp
	

	ret 4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
moveup:
			cmp di,3040
			jl noup
			mov word[es:di],0x1720
			sub di,160
			
			mov word[es:di],0x173e
              ret
                        
noup:
    call sound
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 moveright:
		    cmp di,3038
			je a
			jmp b
			
			a:
			mov word[es:di],0x1720
			sub di,158
			mov word[es:di],0x173e

			b:
			cmp di,3198
			je bb
			jmp c
			
			bb:
			mov word[es:di],0x1720
			sub di,158
			mov word[es:di],0x173e
			c:
			cmp di,3358
			je cc
			jmp d
			
			cc:
			mov word[es:di],0x1720
			sub di,158
			mov word[es:di],0x173e
			d:
			cmp di,3518
			je ddd
			jmp e
			
			ddd:
			mov word[es:di],0x1720
			sub di,158
			mov word[es:di],0x173e
			e:
			cmp di,3678
			je ee
			jmp right
			
			ee:
			mov word[es:di],0x1720
			sub di,158
			mov word[es:di],0x173e
			
   right:
		mov word[es:di],0x1720
		add di,2
		mov word[es:di],0x173e

     move:      
                ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;move left
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
moveleft:
			;call sound
			cmp di,2880
			je la
			jmp lb
			la:
			mov word[es:di],0x1720
			add di,158
			mov word[es:di],0x173e
			
			lb:
			cmp di,3040
			je lbb
			jmp lc
			
			lbb:
			mov word[es:di],0x1720
			add di,158
			mov word[es:di],0x173e
			lc:
			cmp di,3200
			je lcc
			jmp ld
			
			lcc:
			mov word[es:di],0x1720
			add di,158
			mov word[es:di],0x173e
			
			ld:
			cmp di,3360
			je lddd
			jmp lee
			
			lddd:
			mov word[es:di],0x1720
			add di,158
			mov word[es:di],0x173e
			lee:
			cmp di,3520
			je leee
			jmp left
			
			leee:
			mov word[es:di],0x1720
			add di,158
			mov word[es:di],0x173e
			
			
			left:
			mov word[es:di],0x1720
			sub di,2
			mov word[es:di],0x173e
                  ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;move down
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movedown:
			cmp di,3840
			ja nodown
			mov word[es:di],0x1720
			add di,160
			mov word[es:di],0x173e
                       
                        ret

nodown:
			call sound
                        ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;random
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
random:
        push ax
		push di
		push es
		push cx
		push si
        push bx
        push dx
		mov ax, 0xB800 
		mov es, ax 

        cmp word[index],30
        je Restart
        jmp IncIndex
        Restart:
                mov word[index],0
        IncIndex:
          mov si,[index]
          mov di,[arr+si]
		  mov dx,[Current_FishCell]
		  cmp dx,[Current_RedCell]
		  je noWhitespc
          mov word[es:di],0x1720
		  noWhitespc:
          add word[index],2 ;increment the index to next pos
          mov bx,[index]
          mov di,[arr+bx] 

		
		mov word[es:di],0x4420
		mov word[Current_RedCell],di

	

enda:
pop dx
pop bx
pop si
pop cx
pop es
pop di
pop ax
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;random2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
random2:
        push ax
		push di
		push es
		push cx
		push si
        push bx
        push dx
		mov ax, 0xB800 
		mov es, ax 
        cmp word[index2],22
        je Restart2
        jmp IncIndex2
        Restart2:
                mov word[index2],0
        IncIndex2:
          mov si,[index2]
          mov di,[arr2+si]
		  mov dx,[Current_FishCell]
		  cmp dx,[Current_GreenCell]
		  je noWhitespc2
          mov word[es:di],0x1720
		  noWhitespc2:
          mov word[es:di],0x1720
          add word[index2],2		;increment the index to next pos
          mov bx,[index2]
          mov di,[arr2+bx] 

		mov word[es:di],0x2220
		mov word[Current_GreenCell],di

	

end2:
            pop dx
            pop bx
		    pop si
		    pop cx
            pop es
			pop di
			pop ax
		ret

;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
kbisr:
		
     push ax
     push es

     mov ax,0xb800
     mov es,ax

    in al,0x60

    cmp al,0x48               ; SCAN CODE UpArrow
    jne cmpnxtkey1
    call moveup
    jmp keymatched


cmpnxtkey1:
    cmp al,0x50               ; SCAN CODE DownArrow
    jne cmpnxtkey2
    call movedown
    jmp keymatched


cmpnxtkey2:
    cmp al,0x4B               ; SCAN CODE LeftArrow
    jne cmpnxtkey3
    call moveleft
    jmp keymatched


cmpnxtkey3:
    cmp al,0x4D               ; SCAN CODE RightArrow
    jne nokeymatch
    call moveright
    jmp keymatched

nokeymatch:
     mov word[Current_FishCell],di
;;;;;call movement  
      pop es
      pop ax
      jmp far [cs:oldisr]      ; call back the original ISR
	  

keymatched:
	  mov word[Current_FishCell],di
	
		 call CompareScore 
    mov al,0x20
    out 0x20,al                ; send EOI to PIC

    pop es
    pop ax

   iret                       ; return from interrupt

;------------------------------------------------------
; subroutine to print a number at top left of screen
; takes the number to be printed as its parameter
;------------------------------------------------------
printnum: push bp
mov bp, sp
push es
push ax
push bx
push cx
push dx
push di
mov ax, 0xb800
mov es, ax 
mov ax, [bp+4] 
mov bx, 10
mov cx, 0												; initialize count of digits
nextdigit:
		mov dx, 0										; zero upper half of dividend
		div bx											; divide by 10
		add dl, 0x30									; convert digit into ascii value
		push dx											; save ascii value on stack
		inc cx											; increment count of values
		cmp ax, 0										; is the quotient zero
		jnz nextdigit									; if no divide it again
		mov di, 146										; point di to 70th column
	nextpos: pop dx										; remove a digit from the stack
mov dh, 0x0e											; use normal attribute
mov [es:di], dx											; print char on screen
add di, 2												;move to next screen location
loop nextpos											; repeat for all digits on stack
pop di
pop dx
pop cx
pop bx
pop ax 
pop es
pop bp
ret 2
;------------------------------------------------------
; timer interrupt service routine
;------------------------------------------------------
timer:		push ax
            push bx
			push cx
			push dx
            mov bx,[cs:tickcount]
            mov cx,[cs:tickcount2]
            cmp bx,90 ;first cmp
            je FiveSeconds
            jmp SecondCmp

            FiveSeconds:    
                call random							   ;for red
                xor bx,bx	
                mov word[cs:tickcount],bx
			
			SecondCmp:
			cmp cx,180								    ;green
			je TenSecs
			jmp incrementtimer
           
		   TenSecs:
				 call random2							;for green
                xor cx,cx	
                mov word[cs:tickcount2],cx


		   incrementtimer:
						inc word [cs:tickcount]			; increment tick count
						inc word [cs:tickcount2]		; increment tick count
			
call movement 


			mov al, 0x20
			out 0x20, al ; end of interrupt
			pop dx
            pop cx
            pop bx
			pop ax
			iret ; return from interrupt
;------------------------------------------------------
;------------------------------------------------------
;------------------------------------------------------
;------------------------------------------------------
CompareScore:
			mov dx,[Current_FishCell]
			cmp dx,[Current_RedCell]
			je IsRed
			jmp Check2ndColor
			
			IsRed:
			add word[score],10

			Check2ndColor:
			cmp dx,[Current_GreenCell]
			je IsGreen
			jmp NotGreen
			IsGreen:
			add word[score],50
			NotGreen:
			  push word[cs:score]
		   call printnum
		   ret
endconfirm:







push ax
push bx
push es
xor ax,ax
mov es,ax
		mov ax,[cs:oldTimerisr]
	  mov bx,[cs:oldTimerisr+2]
	  cli
	  mov [es:8*4],ax
	  mov [es:8*4+2],bx
	  sti
	   mov ax,[cs:oldisr]				; read old offset in ax
     mov bx,[cs:oldisr+2]				; read old segment in bx
     cli								; disable interrupts
     mov [es:9*4],ax					; store offset at n*4
     mov [es:9*4+2],bx					; store segment at n*4+2
     sti
	  pop es
	  pop bx
	  pop ax
	;;here timer will be unhooked
         mov ah,06h						;bios service
		 mov al,00h						; no of lines to be scrolled up
		 mov bh,33h						; char attribute
		 mov ch,00h						; upper left corner SP VIDEO
		 mov cl,00h						; upper left corner SP VIDEO
 		 mov dh,19h						; lower right corner EP VIDEO
		 mov dl,50h						; lower right corner EP VIDEO
		 int 10h
		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cnfrm:
push ax
push bx
push cx
push dx
push si
push di


 mov ax,674
push ax
mov cx,764
push cx
call rect



mov si,confirm
mov dl,19h ;coloumns

cp2:
mov ah,02h								;cursor movement
mov bh,00h								;pg no
mov dh,06h								;row no 
int 10h									;video bios
add dl,01h								;col no
mov ah,09h								;print str
mov al,[si]								;val
mov bh,00h								;page no
mov bl,4fh								;attributes clr etc
mov cx,01h								;
int 10h									;interrupt 10
add si,01h								;inc 1 char
cmp dl,50								;no of chars +1 (columns)
jne cp2

mov si,endgame
mov dl,19h ;coloumns

cp4:
mov ah,02h								;cursor movement
mov bh,00h								;pg no
mov dh,09h								;row no 
int 10h									;video bios
add dl,01h								;col no
mov ah,09h								;print str
mov al,[si]								;val
mov bh,00h								;page no
mov bl,4eh								;attributes clr etc
mov cx,01h								;
int 10h									;interrupt 10
add si,01h								;inc 1 char
cmp dl,50								;no of chars +1 (columns)
jne cp4

;;CONTINUE
 
mov si,continuegame  ;2. for down
mov dl,19h ;coloumns

cp5:
mov ah,02h								;cursor movement
mov bh,00h								;pg no
mov dh,0Bh								;row no 
int 10h									;video bios
add dl,01h								;col no
mov ah,09h								;print str
mov al,[si]								;val
mov bh,00h								;page no
mov bl,4eh								;attributes clr etc
mov cx,01h								;
int 10h									;interrupt 10
add si,01h								;inc 1 char
cmp dl,52								;no of chars +1 (columns)
jne cp5
end_cursor2:
mov ah,02h								;cursor movement
mov dl,00h
mov bh,00h								;pg no
mov dh,17h								;row no 
int 10h									;video bios
	
	
	checkkey:
            mov ah,1
			int 0x21					; dos services
			cmp al,13					;is enter pressed
			je endprogram1				;yes,Terminate the program
			jmp dontend
endprogram1:
pop di
pop si
pop dx
pop cx
pop bx
pop ax
call clrscr
		   call loadresult
   call delay
   call delay
   call delay
   call delay
   call delay
   call clrscr

call prntscore

mov ax,4c00h
int 21h

dontend:
pop di
pop si
pop dx
pop cx
pop bx
pop ax

			ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					;PRINT STRING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printstr:	
			push bp
			mov bp, sp
			push es
			push ax
			push cx
			push si
			push di

			mov ax, 0xb800
			mov es, ax				; point es to video base
			mov di, 134				; point di to top left column
									; es:di --> b800:0000
			mov si, [bp+6]			; point si to string
			mov cx, [bp+4]			; load length of string in cx
			mov ah, 0x0e			; normal attribute fixed in al
			
nextcharacter:	mov al, [si]		; load next char of string
			mov [es:di], ax			; show this char on screen
			add di, 2				; move to next screen location
			add si, 1				; move to next char in string			
			loop nextcharacter		; repeat the operation cx times
			
			pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;PRINTSTR BY PARAMAETERS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prntstr:
       push bp
       mov  bp,sp
       push es
       push ax
       push cx
       push si
       push di
  
       mov es,[cs:DataSegment]

       mov   di,[bp+4]
       mov   cx,0xffff 
       xor   al,al 
       repne scasb
       mov   ax,0xffff
       sub   ax,cx
       dec   ax 
       
       mov cx,ax
       mov ax,0xb800   
       mov es,ax
       mov al,80 
       mul byte[bp+8]  
       add ax,[bp+10] 
       shl ax,1      
       mov di,ax
       mov si,[bp+4]   
       mov ah,[bp+6]

       cld

nxtcharaa:
       lodsb
       stosw
       loop nxtcharaa
   
      pop di
      pop si
      pop cx
      pop ax
      pop es
      pop bp

      ret 8 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					;Main function 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
main:

		call clrscr		
		call sea 
		call sky 
		mov di,1612	
		push di
		mov di,1668		
		push di
		call mountain
	    mov di,1690	
		push di
		mov di,1756		
		push di
		call mountain
		mov di,324		
		push di 
		mov di,340		
		push di
		mov di,1620    
		push di 
		mov di,1604  
		push di
		mov di,492  
		push di
		mov di,1612		
		push di
		call buildings
		mov di,356    
		push di
		mov di,372   
		push di
		mov di,1652  
		push di
		mov di,1636     
		push di
		mov di,524      
		push di
		mov di,1644		
		push di
		call buildings
		mov di,388  
		push di
		mov di,404 
		push di
		mov di,1684  
		push di
 		mov di,1668  
		push di
		mov di,556 
		push di
		mov di,1676 
		push di
		call buildings
		mov di,420  
		push di
		mov di,436 
		push di
		mov di,1716 
		push di
		mov di,1700  
		push di
		mov di,588   
		push di
		mov di,1708 
		push di
		call buildings
		mov di,452 
		push di
		mov di,468 
		push di
		mov di,1748  
		push di
		mov di,1732  
		push di
		mov di,620 
		push di
		mov di,1740 
		push di
		call buildings
		mov di,2660 
        push di
        mov di,2682 
        push di
		call shipn
		mov di,2024
        push di
        call shipchimney
		mov di,2580
        push di
        mov di,2600
        push di
		call shipn
		mov di,1942           
		push di
		call shipchimney
		mov di,1760 
		push di
		mov di,1920 
		push di
		call shore
		mov di, scr
		push di					
		mov di,7	
		push di
		call printstr
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
						;FISH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		mov di,3740        ;GLOBAL POSITION
		mov ax,0xb800
		mov es,ax
		mov word[es:di],0x173e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
						;START
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

start:
			xor ax, ax
			mov es, ax							; point es to IVT base
			mov ax,[es:8*4]
			mov [cs:oldTimerisr],ax
			mov ax,[es:8*4+2]
			mov [cs:oldTimerisr+2],ax

			cli									; disable interrupts
			mov word [es:8*4], timer			; store offset at n*4
			mov [es:8*4+2], cs					; store segment at n*4+2
			sti									; enable interrupts

			mov word[Current_FishCell],di
			xor ax, ax
			mov es, ax
	  			
			mov ax,[es:9*4]					    ; get  offset  of oldKbISR
			mov [cs:oldisr],ax				    ; save offset  of oldKbISR
			mov ax,[es:9*4+2]				    ; get  segment of oldKbISR
			mov [cs:oldisr+2],ax			    ; save segment of oldKbISR
	        cli								   
		    mov word[es:9*4],kbisr			    ; store offset at n*4
		    mov [es:9*4+2],cs				    ; store segment at n*4+2
            sti
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
						;ESC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
loopesckey:


      mov ah,0            
      int 0x16           
      cmp al,27               
      jne loopesckey
	  call endconfirm				

	  mov ax,[cs:oldTimerisr]
	  mov bx,[cs:oldTimerisr+2]

	  cli
	  mov [es:8*4],ax
	  mov [es:8*4+2],bx
	  sti

     mov ax,[cs:oldisr]        ; read old offset in ax
     mov bx,[cs:oldisr+2]      ; read old segment in bx

     cli                      ; disable interrupts
     mov [es:9*4],ax          ; store offset at n*4
     mov [es:9*4+2],bx        ; store segment at n*4+2
     sti
	 push dx
	 mov dx,[cs:score]
	 mov [cs:score],dx
	 pop dx

		  call main



end:

call clrscr

mov ax,0x4c00
int 0x21

main2:
		call clrscr
		call loadscr

		call delay
		call delay
		call delay
		call delay
		call delay
		call clrscr

		mov dx, msg1	 						; ds:dx points to '$' terminated string
		mov ah, 9 								; service 9 ?  WRITE STRING TO STANDARD OUTPUT
		int 0x21 								; dos services
		
			
	mov cx, [maxlength]				; load maximum length in cx
	mov si, buffer					; point si to start of buffer
	nextchar1:	
			mov ah, 1				; service 1 ? read character


			int 0x21				 ; dos services
			cmp al, 13				 ; is enter pressed
			je exit1				 ; yes, leave input
			mov [si], al			 ; no, save this character
			inc si					 ; increment buffer pointer
			loop nextchar1			 ; repeat for next input char
	exit1:
		mov byte [si], '$'			; append $ to user input
		mov dx, message				; greetings message
		mov ah, 9				    ; service 9 ? write string
		int 0x21				    ; dos services
		mov dx, buffer				; user input buffer
		mov ah, 9				    ;service 9 ? write string
		int 0x21					; dos services
		
		mov ah, 1				    ;service 1 ? read character


			int 0x21			    ;dos services
			cmp al, 13				; is enter pressed
			je exit3				; yes, leave input
			
		exit3:
       
		 mov ah,06h		 ;bios service
		 mov al,00h		 ; no of lines to be scrolled up
		 mov bh,33h		 ; char attribute
		 mov ch,00h		 ; upper left corner SP VIDEO
		 mov cl,00h		 ; upper left corner SP VIDEO
 		 mov dh,19h		 ; lower right corner EP VIDEO
		 mov dl,50h		 ; lower right corner EP VIDEO
		 int 10h
		 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 mov ax,674
push ax
mov cx,764
push cx
call rect




;;wlcm
mov si,Welcome
mov dl,19h ;coloumns

p1:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,02h				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,1fh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,46				 ;no of chars +1 (columns)
jne p1

;;pls flow the instr:
mov si,ins1
mov dl,15h ;coloumns

p2:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,04h				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,4fh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,57				 ;no of chars +1 (columns)
jne p2

;instr 1 fish movements
mov si,ins2
mov dl,12h
p3:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,06h				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,4fh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,33				 ;no of chars +1 (columns)
jne p3

;;;inst up

mov si,ins3
mov dl,19h ;coloumns

p4:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,07h				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,4eh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,36				 ;no of chars +1 (columns)
jne p4

;;inst down
 
mov si,ins4  ;2. for down
mov dl,19h ;coloumns

p5:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,08h				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,4eh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,38				 ;no of chars +1 (columns)
jne p5

;;inst left
mov si,ins5  ;3.A for left
mov dl,19h ;coloumns

p6:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,09h				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,4eh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,38				 ;no of chars +1 (columns)
jne p6

;;inst right


mov si,ins6  ;4.D for left
mov dl,19h ;coloumns

p7:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,0ah				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,4eh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,39				 ;no of chars +1 (columns)
jne p7					 

; coin instruction

mov si,ins7
mov dl,12h
p8:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,0ch				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,4fh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,51				 ;no of chars +1 (columns)
jne p8

; coin instruction 2

mov si,ins8
mov dl,12h
p9:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,0dh				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,4fh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,53				 ;no of chars +1 (columns)
jne p9

;;press enter etc
mov si,ins9
mov dl,19h ;coloumns

pp1:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,0fh				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,9fh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,58				 ;no of chars +1 (columns)
jne pp1


;;developed by:
mov si,dev
mov dl,3eh ;coloumns

pp2:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,15h				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,4eh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,75				 ;no of chars +1 (columns)
jne pp2


;;NAME1:
mov si,name1
mov dl,3ah ;coloumns

pp3:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,17h				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,4fh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,66				 ;no of chars +1 (columns)
jne pp3


;;NAME2:
mov si,name2
mov dl,3ah ;coloumns

pp4:
mov ah,02h				 ;cursor movement
mov bh,00h				 ;pg no
mov dh,18h				 ;row no 
int 10h					 ;video bios
add dl,01h				 ;col no
mov ah,09h				 ;print str
mov al,[si]				 ;val
mov bh,00h				 ;page no
mov bl,4fh				 ;attributes clr etc
mov cx,01h				 ;
int 10h					 ;interrupt 10
add si,01h				 ;inc 1 char
cmp dl,72				 ;no of chars +1 (columns)
jne pp4
end_cursor:
mov ah,02h				 ;cursor movement
mov dl,00h
mov bh,00h				 ;pg no
mov dh,17h				 ;row no 
int 10h					 ;video bios


 mov ah,1
int 0x21				 ; dos services
cmp al, 13				 ; is enter pressed
je main					 ; yes, leave input
	


endprogram:
call clrscr
mov ax,4c00h
int 21h

;BIOS STRINGS:
Welcome :db 'WELCOME TO FISH LAND!'
ins1:db 'Please Follow the Instructions Below'
ins2:db 'Fish Movements:'
ins3:db '1. ^ for UP'
ins4:db '2. v for DOWN'
ins5:db '3. < for LEFT'
ins6:db '4. > for RIGHT'
ins7:db 'Collect RED coin to get 10 points'
ins8:db 'Collect GREEN coin to get 50 points'
ins9:db 'Press ENTER to PLAY and Q to QUIT'
dev: db 'Developed By:' 
name1: db 'ZAIN ALI' ;8
name2: db 'MUKARRAM AHMED' ;14
confirm: db 'ENDING GAME CONFIRMATION:' ;30
continuegame: db '2.PRESS ANY KEY TO CONTINUE'
endgame: db '1.PRESS ENTER KEY TO EXIT'
maxlength: dw 80			; maximum length of input
message: db 10, 13, 'HELLO $'			; greetings message
buffer: times 81 db 0		 ; space for input string
msg1:		db 'ENTER YOUR NAME:$'