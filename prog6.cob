       IDENTIFICATION DIVISION.
       PROGRAM-ID. prog6.
       AUTHOR. YuriGPS.
      *    Programa para estudo do comando IF-ELSE.
      *    Objetivo: Exibir mensagem a depender da resposta do usuário.
      

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  DADOS.
           05  TXT-MENSAGEM        PIC X(80).
           05  OPCAO               PIC X(1).
       

       PROCEDURE DIVISION.

           INITIALIZE DADOS. *> isso reseta o valor da variáveis

           PERFORM SAUDACAO.

           PERFORM MENSAGEM.



           STOP RUN.
       
       SAUDACAO.
           
           DISPLAY "--------------------------".
           DISPLAY "Você gosta de hotdog? (S/N)".
           DISPLAY "--------------------------".
           
           ACCEPT OPCAO.

       MENSAGEM.
           
           IF OPCAO = "S" OR OPCAO = "s"                 
           MOVE "Hotdog é bom demais!"
           TO TXT-MENSAGEM
           ELSE 
               IF OPCAO = "N" OR OPCAO = "n"
               MOVE "Que pena, não podemos ser amigues..."
               TO TXT-MENSAGEM
               ELSE 
                   MOVE "IDIOTA! Digite S ou N" 
                   TO TXT-MENSAGEM
               END-IF
           END-IF.

        
           
           DISPLAY "--------------------------".
           DISPLAY TXT-MENSAGEM.
           DISPLAY "--------------------------".
