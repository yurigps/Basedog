       IDENTIFICATION DIVISION.
       PROGRAM-ID. prog3.
       AUTHOR. YuriGPS.
      *    Programa para estudo de variáveis literais.
      *    Objetivo: aceitar e imprimir nome e sobrenome na tela.
      

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  NOME PIC X(10).
       01  SOBRENOME PIC X(30).
       01  NOMECOMPLETO PIC X(40).
       

       PROCEDURE DIVISION.
           DISPLAY "Informe seu primeiro nome: ".
           ACCEPT NOME.

           DISPLAY "Informe seu sobrenome: ".
           ACCEPT SOBRENOME.

           STRING 
               FUNCTION TRIM(NOME)
               " "
               FUNCTION TRIM(SOBRENOME)
               INTO NOMECOMPLETO
           END-STRING.

           DISPLAY "Seu nome completo é: " NOMECOMPLETO.
      
           STOP RUN.
