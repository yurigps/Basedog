       IDENTIFICATION DIVISION.
       PROGRAM-ID. prog5.
       AUTHOR. YuriGPS.
      *    Programa para estudo do comando PERFORM.
      *    Objetivo: Exibir uma mensagem na tela cinco vezes.
      

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  DADOS.
           05  MENSAGEM        PIC X(80).
           05  CONTADOR        PIC 9(2).
       

       PROCEDURE DIVISION.

           INITIALIZE DADOS. *> isso reseta o valor da variáveis

           PERFORM MINHA-MENSAGEM UNTIL CONTADOR >= 05. 



           STOP RUN.

       MINHA-MENSAGEM.
           
           PERFORM TRATA-CONTADOR.
           PERFORM TRATA-MENSAGEM.

       TRATA-CONTADOR.
       
           ADD 1 TO CONTADOR.    

       TRATA-MENSAGEM.
                     
           MOVE "Essa é uma mensagem teste!"
           TO MENSAGEM.
       
           DISPLAY CONTADOR " " MENSAGEM.
