%include 'in_out.asm' 
SECTION .data 
msg db "Функция: f(x) = 15*x - 9",0 
msg1 db "Результат: ",0 
SECTION .text 
global _start 
_start: 
pop ecx       
pop edx   
sub ecx,1 
mov esi, 0 
next: 
cmp ecx,0h 
jz _end 
pop eax 
call atoi 
call _calcul 
loop next 
_end: 
mov eax, msg 
call sprintLF 
mov eax, msg1 
call sprint 
mov eax, esi 
call iprintLF 
call quit 
 
_calcul: 
mov ebx, 15 
mul ebx ; 
add eax, -9 ; 
add esi, eax
ret
