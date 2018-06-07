# Nombres: Jose Luis Torrentera Arroniz; Omar Antonio Madriz Almanza
# Fecha: 07 de Junio de 2018
# Descripción: Torres de Hanoi

.data
	TorreA: .word 1 2 3 0 0 0 0 0
	TorreB: .word 4 5 6 0 0 0 0 0
	TorreC: .word 7 8 9 0 0 0 0 0
	
.text
	lui $t0, 4097		# Se carga a t0 la direccion inicial 
	ori $s0, $t0, 0		# s0 apunta a la direccion donde se ubica la TorreA 
	ori $s1, $t0, 32	# s1 apunta a la direccion donde se ubica la TorreB 
	ori $s2, $t0, 64	# s2 apunta a la direccion donde se ubica la TorreC
	
	addi $a0, $zero, 3	# a0 representa "n" que es el numero de discos 
	add $a1, $zero, $s0	# a1 representa la torre source
	add $a2, $zero, $s1	# a2 representa la torre target
	add $a3, $zero, $s2	# a3 representa la torre auxiliar
	add $t1, $zero, 0	# Indicará la posición del disco que este hasta arriba de la Torre
	jal Hanoi		# Función recursiva que realizará movimientos entre torres
	j Exit
	
Hanoi:

	 
	 	 

	 	 	 
UpdateTop:
 	 	 
Exit: 
	 