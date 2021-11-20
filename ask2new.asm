## $t0 --> Αριθμος που εδωσε ο χρηστης
## $t1 --> μετρητης (i) --> 1
## $t2 --> 0
## $t3 --> 1
.data
  str2:.asciiz "Enter the number you want:"
  newline: .asciiz " ,"
.text
          main:
    
           #Enter the number you want:
           li $v0, 4
           la $a0, str2
           syscall
           
           #perimeni ton arithmo apo ton xristi
           li $v0, 5
           syscall
           
           move $t0, $v0
           
           li $t2, 0 ## dio proti ori --> einai panta idioi
           li $t3, 1
           
           addi $t0, $t0, 1 ## n+1 auzanoume tin timi pou edose o xristis kata 1, dioti ama den to kanoume auto tha tiponi mexri to 2, opote to auzanoume kata 1 oste na kani ali mia fora tin loupa
                            ## tha mporousame na baloume ton metriti i=0 alla tote den tha empane stin proti loopa gia na tiposi to 0 tou kataxoriti $t2...
           
           li $t1, 1 ## metritis i = 1
           loop_for:
            bge $t1, $t0, exit ## an o metritis einai >= h isos apo to arithmo pou eose o xristis tote pigene sto label exit
            loop_if_1:
             bne $t1, 1, loop_if_2 ## an to t1 diladi o metritis einai diaforos tou 1 pigene sto loop_if_2...
             
             move $a0, $t2
             li $v0, 1 ## tiposi arithmou
             syscall
             li $v0, 4 ## timposi kommas
             la $a0, newline
             syscall
             
             addi $t1, $t1, 1 ## i++ (auzisi metriti)
            
            loop_if_2:
             bne $t1, 2,  loop_for_sinexia ## an to t1 diladi o metritis einai diaforos tou 2 pigene sto loop_for_sinexia...
             
             li $v0, 1 
             move $a0, $t3
             syscall
             li $v0, 4
             la $a0, newline
             syscall
             
             addi $t1, $t1, 1 ## i++ (auzisi metriti)
            
           loop_for_sinexia: 
            add $t4, $t2, $t3 ## sto nextTerm dld ston $t4, kane + tou $t2 me to $t3, 
            move $t2, $t3 ## $t2 == $t3
            move $t3, $t4 ## $t3 == $t4
            
            li $v0, 1 ## tiposi arithmou
            move $a0, $t4 ## $a0 == $t4(nextTerm)
            syscall
            li $v0, 4 ## tiposi kommas
            la $a0, newline
            syscall 
          
          addi $t1, $t1, 1 ## i++ (auzisi metriti)
          
          j loop_for ## pida pali stin loop_for
          
          exit:
           li $v0, 10 ## telos programmatos
           syscall 
