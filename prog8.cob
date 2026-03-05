       IDENTIFICATION DIVISION.
       PROGRAM-ID. Prog8.
       AUTHOR. YuriGPS.
      *Programa para estudo de manipulação de arquivo.
      *Objetivo:Usar arquivo já criado para um registro de clientes.      

       ENVIRONMENT DIVISION. *> onde o arquivo é definido externamente
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           
           SELECT OPTIONAL ARQUIVO-CLIENTE
               ASSIGN TO "clientes.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION. *> onde o layout do registro é definido
       FILE SECTION.
       FD ARQUIVO-CLIENTE.
       01 REGISTRO-CLIENTE.
           05 NOME  PIC X(20).
           05 IDADE PIC 9(3).
           05 EMAIL PIC X(20).

       WORKING-STORAGE SECTION.
       01 OPCAO        PIC X VALUE "S".
           

       PROCEDURE DIVISION. *> onde se abre, lê, grava e fecha o arquivo.

           OPEN EXTEND ARQUIVO-CLIENTE.

           PERFORM ADICIONA-REGISTROS 
               UNTIL OPCAO = "N" OR OPCAO = "n".



           CLOSE ARQUIVO-CLIENTE.

           STOP RUN.



       ADICIONA-REGISTROS. 

           INITIALIZE REGISTRO-CLIENTE.

           DISPLAY "Informe o nome do cliente: "
           ACCEPT NOME.

           DISPLAY "Informe a idade do cliente: "
           ACCEPT IDADE.

           DISPLAY "Informe o email do cliente: "
           ACCEPT EMAIL.
       
           WRITE REGISTRO-CLIENTE.

           DISPLAY "----------------------------".
           DISPLAY "Deseja adicionar outro cliente? (S/N)"
           ACCEPT OPCAO.
