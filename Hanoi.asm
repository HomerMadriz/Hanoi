# Nombres: Jose Luis Torrentera Arroniz; Omar Antonio Madriz Almanza
# Fecha: 07 de Junio de 2018
# Descripción: Torres de Hanoi

.data
<<<<<<< HEAD
	TorreA: .word 1 2 3 4 5 6 7 8
	TorreB: .word 0 0 0 0 0 0 0 0
	TorreC: .word 0 0 0 0 0 0 0 0 
	
.text
	addi $t0, $zero, 4097
	sll $t0, $t0, 16		# Se carga a t0 la direccion inicial 
=======
	TorreA: .word 1 2 3 4 0 0 0 0 
	TorreB: .word 0 0 0 0 0 0 0 0 
	TorreC: .word 0 0 0 0 0 0 0 0 
	
.text
	addi $t0, $zero, 4097	
	sll $t0, $t0, 16	# Se carga a t0 la direccion inicial 
>>>>>>> 8f7cde7cfa630b8f0eb0f68eb31e673d765040b8
	ori $s0, $t0, 0		# s0 apunta a la direccion donde se ubica la TorreA 
	ori $s1, $t0, 32	# s1 apunta a la direccion donde se ubica la TorreB 
	ori $s2, $t0, 64	# s2 apunta a la direccion donde se ubica la TorreC
	
<<<<<<< HEAD
	addi $a0, $zero, 8	# a0 representa "n" que es el numero de discos 
=======
	addi $a0, $zero, 4	# a0 representa "n" que es el numero de discos 
>>>>>>> 8f7cde7cfa630b8f0eb0f68eb31e673d765040b8
	add $a1, $zero, $s0	# a1 representa la torre source
	add $a2, $zero, $s2	# a2 representa la torre target
	add $a3, $zero, $s1	# a3 representa la torre auxiliar
	add $t1, $zero, 0	# Indicará la posición del disco que este hasta arriba de la Torre
	add $t2, $zero, 0	# Temporal que será utilizada como indice para acceder a la torre
	jal Hanoi		# Función recursiva que realizará movimientos entre torres
	j Exit
	
Hanoi:
	bne $a0,$zero,Loop	# Condición de paro si n != 0 entra a la recursión 
	jr $ra			# Salida de la recursión por condición de paro

<<<<<<< HEAD
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
=======
Loop:	addi $sp,$sp,-20	# Se almacenan en stack 5 elementos
	sw $ra, 0($sp)		# Direccion de retorno
	sw $a0, 4($sp)		# n
	sw $a1, 8($sp)		# Source 
	sw $a2, 12($sp)		# Target
	sw $a3, 16($sp)		# Aux
	addi $a0, $a0, -1	# Se reduce n 
	addi $t4, $a2, 0	# Temporal para realizar swap en torres
	addi $a2, $a3, 0	# Cambio de argumentos target <- aux
	addi $a3, $t4, 0	# Cambio de argumentos aux <- target
	jal Hanoi		# Llamada recursiva a Hanoi 
	lw $ra, 0($sp)		# Se recupera la dirección de retorno por salida de recursión
	lw $a0, 4($sp)		# Se recupera n por salida de recursión 
	lw $a1, 8($sp)		# Se recupera el Source anterior a la entrada recursiva  
	lw $a2, 12($sp)		# Se recupera el Target anterior a la entrada recursiva
	lw $a3, 16($sp)		# Se recupera el Aux anterior a la entrada recursiva
	jal UpdateTop		# Llamada a función encargada de mover los discos
	addi $a0, $a0, -1	# Se reduce n preparando la segunda llamada recursiva
	addi $t4, $a1, 0	# Temporal para realizar swap de argumentos
	addi $a1, $a3, 0	# Cambio de argumentos para 2da llamada recursiva: Source <- Aux
	addi $a3, $t4, 0	# Aux <- Source 
	jal Hanoi		# Segunda llamada recursiva 
	lw $ra, 0($sp)		# Se recupera la dirección de retorno 
	lw $a0, 4($sp)		# Recuperación de n 
	lw $a1, 8($sp)		# Se recupera el Source anterior a la entrada recursiva 
	lw $a2, 12($sp)		# Se recupera el Target anterior a la entrada recursiva
	lw $a3, 16($sp)		# Se recupera el Aux anterior a la entrada recursiva
	addi $sp,$sp,20		# Ajuste de stack pointer necesario por pop
	jr $ra			# Salida de la llamada recursiva
>>>>>>> 8f7cde7cfa630b8f0eb0f68eb31e673d765040b8
	 	 	 	 
UpdateTop:
 	addi $t1, $zero, 0	# Se limpia la variable temporal que indica el disco que se encuentra en el tope de la torre
 	addi $t2, $zero, 0	# Se limpia i 
Loop2: 	sll $t1, $t2, 2		# Se recorre dos posiciones para entrar a la direccion que corresponde al sig. disco
 	add $t1, $t1, $a1	# t1 contiene la direccion de la siguiente posicion a validar en la torre Source
 	lw $t3, 0($t1)		# Se toma el valor correspondiente a la posición seleccionada
 	bne $t3, $zero, Load	# Si el valor es distinto a cero, se convierte en el Top y se procede a realizar el cambio de torre
 	addi $t2, $t2, 1	# Se aumenta el valor de i para pasar a validar la sig direccion. 
 	j Loop2			# Iteración 
 	
Load:	sll $t2, $t2, 2		# Se recorre el valor de i que contiene la posicion correspondiente al tope de la torre.
	add $t1, $t2, $a2	# Se le suma a t1 la direccion de la torre target
	sw $t3, 0($t1)		# Se pone el disco en la torre target
	add $t1, $t2, $a1	# Se le suma a t1 la direccion de la torre source
	sw $zero, 0($t1)	# Se indica que se quito el disco de la torre source
	jr $ra 	 		# Continua el proceso de recursión 
Exit: 
	 
