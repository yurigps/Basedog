       IDENTIFICATION DIVISION.
       PROGRAM-ID. Prog11.
       AUTHOR. YuriGPS.
      *Programa para estudo de manipulação de arquivos.
      *Objetivo:Inserir dados num arquivo indexado.

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
       01  OPCAO          PIC X VALUE "S".
           

       PROCEDURE DIVISION.

           OPEN I-O ARQUIVO-CLIENTE. 

           PERFORM INCLUI-REGISTROS 
               UNTIL OPCAO = "N" OR OPCAO = "n".
              
           CLOSE ARQUIVO-CLIENTE.

           STOP RUN.
       

       INCLUI-REGISTROS.

           INITIALIZE REGISTRO-CLIENTE.

           DISPLAY "Informe o nome do cliente: "
           ACCEPT NOME.

           DISPLAY "Informe a idade do cliente: "
           ACCEPT IDADE.

           DISPLAY "Informe o email do cliente: "
           ACCEPT EMAIL.

           DISPLAY "Informe a chave do cliente: "
           ACCEPT CHAVE.
       
           WRITE REGISTRO-CLIENTE
               INVALID KEY 
                   DISPLAY "------------------------------"
                   DISPLAY "Chave " CHAVE " ja cadastrada!".

           DISPLAY "------------------------------".
           DISPLAY "Deseja adicionar outro cliente? (S/N)"
           ACCEPT OPCAO.

     
  