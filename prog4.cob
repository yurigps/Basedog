       IDENTIFICATION DIVISION.
       PROGRAM-ID. prog4.
       AUTHOR. YuriGPS.
      *    Programa para estudo do comando ADD e MOVE.
      *    Objetivo: aceitar um número, somar 2 , editar e imprimir
      *              valores na tela.
      

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  VALOR1 PIC 9(3).
       01  VALOR-EDIT PIC Z(3).
   
       

       PROCEDURE DIVISION.
                      
           DISPLAY "Informe um valor de 1 até 999: ".
           ACCEPT VALOR1.

           ADD 2 TO VALOR1.

           MOVE VALOR1 TO VALOR-EDIT.

           DISPLAY "Seu valor, somado com 2: " VALOR-EDIT.
      
           STOP RUN.
