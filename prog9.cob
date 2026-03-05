       IDENTIFICATION DIVISION.
       PROGRAM-ID. Prog9.
       AUTHOR. YuriGPS.
      *Programa para estudo de manipulação de arquivo.
      *Objetivo:Criar um programa para leitura de arquivos já criados.

       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           
           SELECT OPTIONAL ARQUIVO-CLIENTE
               ASSIGN TO "clientes.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
       

       DATA DIVISION. 
       FILE SECTION.
       FD ARQUIVO-CLIENTE.
       
       01  REGISTRO-CLIENTE.
           05 NOME  PIC X(20).
           05 IDADE PIC 9(3).
           05 EMAIL PIC X(20).

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
           AT END 
               MOVE "S" TO EOF.
           IF EOF = "N"
               PERFORM EXIBA-CAMPOS.
           
       EXIBA-CAMPOS.

           DISPLAY "Nome: " NOME.
           DISPLAY "Idade: " IDADE.
           DISPLAY "Email: " EMAIL.
           DISPLAY "----------------------------".

