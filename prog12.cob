       IDENTIFICATION DIVISION.
       PROGRAM-ID. Prog12.
       AUTHOR. YuriGPS.
      *Programa para estudo de manipulação de arquivos.
      *Objetivo: Ler e exibir dados de um arquivo indexado.

       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           
           SELECT ARQUIVO-CLIENTE
               ASSIGN TO "clientes.index.dat"
               ORGANIZATION IS INDEXED
               RECORD KEY IS CHAVE
               ACCESS MODE IS DYNAMIC.
       

       DATA DIVISION. 
       FILE SECTION.
       FD ARQUIVO-CLIENTE.
       
       01  REGISTRO-CLIENTE.
           05 NOME   PIC X(20).
           05 IDADE  PIC 9(3).
           05 EMAIL  PIC X(20).
           05 CHAVE PIC X(2).

       WORKING-STORAGE SECTION.
       01  EOF          PIC X VALUE "N".
           

       PROCEDURE DIVISION.

           OPEN INPUT ARQUIVO-CLIENTE. 

           PERFORM LER-REGISTROS 
               UNTIL EOF = "S".
              
           CLOSE ARQUIVO-CLIENTE.

           STOP RUN.
       

       LER-REGISTROS.

           READ ARQUIVO-CLIENTE
           AT END MOVE "S" TO EOF.
           IF EOF = "N"
               PERFORM EXIBIR-CAMPOS
               ELSE 
                  DISPLAY "***************"
                  DISPLAY "FIM DE ARQUIVO"
                  DISPLAY "***************"
           END-IF.

       EXIBIR-CAMPOS.

           DISPLAY "Chave do cliente: " CHAVE.

           DISPLAY "Nome: " NOME.

           DISPLAY "Idade: " IDADE.

           DISPLAY "Email: " EMAIL.

           DISPLAY "----------------------------".

           
       
         

     
  