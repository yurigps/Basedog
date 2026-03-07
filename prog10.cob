       IDENTIFICATION DIVISION.
       PROGRAM-ID. Prog10.
       AUTHOR. YuriGPS.
      *Programa para estudo de manipulação de arquivos.
      *Objetivo:Programa para CRIAR num arquivo indexado.

       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           
           SELECT OPTIONAL ARQUIVO-CLIENTE
               ASSIGN TO "clientes.index.dat"
               ORGANIZATION IS INDEXED
               RECORD KEY IS CODIGO
               FILE STATUS IS WS-STATUS
               ACCESS MODE IS DYNAMIC.
       

       DATA DIVISION. 
       FILE SECTION.
       FD ARQUIVO-CLIENTE.
       
       01  REGISTRO-CLIENTE.
           05 NOME   PIC X(20).
           05 IDADE  PIC 9(3).
           05 EMAIL  PIC X(20).
           05 CODIGO PIC X(2).

       WORKING-STORAGE SECTION.

       01  WS-STATUS PIC XX.
           

       PROCEDURE DIVISION.

      *    Se o arquivo já estiver criado, o programa não sobrescreve.
      *    Se já tiver não tiver criado, o programa cria o arquivo.
      
           OPEN I-O ARQUIVO-CLIENTE. 
           IF WS-STATUS = "35"
                OPEN OUTPUT ARQUIVO-CLIENTE
                CLOSE ARQUIVO-CLIENTE
                OPEN I-O ARQUIVO-CLIENTE
           END-IF.            
           CLOSE ARQUIVO-CLIENTE.

           STOP RUN.
       

  
  