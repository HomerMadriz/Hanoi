# Nombres: Jose Luis Torrentera Arroniz; Omar Antonio Madriz Almanza
# Fecha: 07 de Junio de 2018
# Descripción: Torres de Hanoi

.data
	TorreA: .word 1 2 3 4 5 6 7 8
	TorreB: .word 0 0 0 0 0 0 0 0
	TorreC: .word 0 0 0 0 0 0 0 0 
	
.text
	addi $t0, $zero, 4097
	sll $t0, $t0, 16		# Se carga a t0 la direccion inicial 
	ori $s0, $t0, 0		# s0 apunta a la direccion donde se ubica la TorreA 
	ori $s1, $t0, 32	# s1 apunta a la direccion donde se ubica la TorreB 
	ori $s2, $t0, 64	# s2 apunta a la direccion donde se ubica la TorreC
	
	addi $a0, $zero, 8	# a0 representa "n" que es el numero de discos 
	add $a1, $zero, $s0	# a1 representa la torre source
	add $a2, $zero, $s2	# a2 representa la torre target
	add $a3, $zero, $s1	# a3 representa la torre auxiliar
	add $t1, $zero, 0	# Indicará la posición del disco que este hasta arriba de la Torre
	add $t2, $zero, 0	# Temporal que será utilizada como indice para acceder a la torre
	jal Hanoi		# Función recursiva que realizará movimientos entre torres
	j Exit
	
Hanoi:
	bne $a0,$zero,Loop
	jr $ra

Loop:	addi $sp,$sp,-20
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a2, 12($sp)
	sw $a3, 16($sp)
	addi $a0, $a0, -1
	addi $t4, $a2, 0
	addi $a2, $a3, 0
	addi $a3, $t4, 0
	jal Hanoi
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $a2, 12($sp)
	lw $a3, 16($sp)
	jal UpdateTop
	addi $a0, $a0, -1
	addi $t4, $a1, 0
	addi $a1, $a3, 0
	addi $a3, $t4, 0
	jal Hanoi
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $a2, 12($sp)
	lw $a3, 16($sp)
	addi $sp,$sp,20
	jr $ra
	 	 	 	 
UpdateTop:
 	addi $t1, $zero, 0
 	addi $t2, $zero, 0
Loop2: 	sll $t1, $t2, 2
 	add $t1, $t1, $a1
 	lw $t3, 0($t1)
 	bne $t3, $zero, Load
 	addi $t2, $t2, 1
 	j Loop2
 	
Load:	sll $t2, $t2, 2
	add $t1, $t2, $a2
	sw $t3, 0($t1)
	add $t1, $t2, $a1
	sw $zero, 0($t1)

	jr $ra 	 
Exit: 
	 