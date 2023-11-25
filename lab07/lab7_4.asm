%include 'in_out.asm'
SECTION .data
msg1 db 'Введите x: ', 0h
msg2 db 'Введите a: ', 0h
msg3 db 'Результат: ', 0h

SECTION .bss
x resb 11
a resb 11
res resb 12

SECTION .text
global _start
_start:
; ---------- Вывод сообщения 'Введите x: '
mov eax, msg1
call sprint
; ---------- Ввод 'x'
mov ecx, x
mov edx, 10
call sread
; ---------- Вывод сообщения 'Введите a: '
mov eax, msg2
call sprint
; ---------- Ввод 'a'
mov ecx, a
mov edx, 10
call sread
; ---------- Преобразование 'x' из символа в число
mov eax, x
call atoi ; Вызов подпрограммы перевода символа в число
mov [x], eax ; запись преобразованного числа в 'x'
; ---------- Преобразование 'a' из символа в число
mov eax, a
call atoi ; Вызов подпрограммы перевода символа в число
mov [a], eax ; запись преобразованного числа в 'a'
; ---------- Сравниваем 'x' и '5' (как числа)
mov eax, [a]
mov ecx, [x]
cmp ecx, 5 ; Сравниваем 'x' и '5'
jl less_xa ; если 'x<5', то переход на метку 'less_xa'
add ecx, -5;
mov [res], ecx ; 'res = x-5'
jmp _res
; ---------- Записываем 'a*x' в переменную 'res'
less_xa:
mov eax, [a]
mul ecx ;
mov [res], eax 
;jmp _res
; ---------- Вывод результата
_res:
mov eax, msg3
call sprint ; Вывод сообщения 'Результат: '
mov eax, [res]
call iprintLF ; Вывод
call quit ; Вызов подпрограммы завершения
