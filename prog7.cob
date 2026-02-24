       IDENTIFICATION DIVISION.
       PROGRAM-ID. prog7.
       AUTHOR. YuriGPS.
      *    Programa para estudo do comando IF-ELSE.
      *    Objetivo: Receber um número e dizer e exibir uma mensagem
      

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  DADOS.
           05  NUM1         PIC 9(3).
           05  TXT-MENSAGEM PIC X(80).
       

       PROCEDURE DIVISION.

           INITIALIZE DADOS. *> isso reseta o valor da variáveis

           PERFORM PERGUNTA.

           PERFORM MENSAGEM.



           STOP RUN.
       
       PERGUNTA.
           
           DISPLAY "--------------------------".
           DISPLAY "Digite um número entre 1 e 200: ".
           DISPLAY "--------------------------".
           
           ACCEPT NUM1.

       MENSAGEM.
           
           IF NUM1 >= 1 AND <= 200
           MOVE "O número está dentro do intervalo"
           TO TXT-MENSAGEM
           ELSE
               MOVE "O número está fora do intervalo!"
               TO TXT-MENSAGEM
           END-IF.

        
           
           DISPLAY "--------------------------".
           DISPLAY TXT-MENSAGEM.
           DISPLAY "--------------------------".
