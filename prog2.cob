       IDENTIFICATION DIVISION.
       PROGRAM-ID. prog2.
       AUTHOR. YuriGPS.
      *    Programa para estudo de variáveis núméricas.
      *    Objetivo: somar 2 números e exibir o resultado.
      

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  NUM1 PIC 9(2).
       01  NUM2 PIC 9(2).
       01  RESULTADO PIC 9(3).
       01  RESULTADO-ED PIC ZZ9.
       

       PROCEDURE DIVISION.
           
      
      *    Mensagem do inicio.             
           DISPLAY "-----------------------------------------"                           
           DISPLAY "Ihanin Viado! :)".
           DISPLAY "Esse programa diz a soma de dois numeros."
           DISPLAY "-----------------------------------------"

      *    Recebendo os números.
           DISPLAY "Informe o primeiro numero: "
           ACCEPT NUM1.

           DISPLAY "Informe o segundo numero: "
           ACCEPT NUM2.
           
      *    Realizando cálculo.     
           COMPUTE RESULTADO = NUM1 + NUM2.

      *    Movendo resultado para variável editada.
           MOVE RESULTADO TO RESULTADO-ED.

      *    Mensagem do final. 
           DISPLAY "-----------------------------------------".
           DISPLAY "O primeiro número informado foi: " NUM1.
           DISPLAY "O segundo número informado foi: " NUM2.
           DISPLAY "O resultado da soma  é: " RESULTADO-ED.
           DISPLAY "-----------------------------------------".
           DISPLAY "Fim do programa."
           DISPLAY "-----------------------------------------".



           STOP RUN.
