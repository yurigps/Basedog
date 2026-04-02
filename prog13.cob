       IDENTIFICATION DIVISION.
       PROGRAM-ID. Prog13.
       AUTHOR. YuriGPS.
      *Programa para estudo de manipulação de arquivos.
      *Objetivo: Utilizar COPY. 
      *          Ler e exibir dados de um arquivo indexado.

       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           
           COPY "SELCLIENTES.cob".
  
       DATA DIVISION. 
       FILE SECTION.
           
           COPY "FDCLIENTES.cob".

       WORKING-STORAGE SECTION.
       77  EOF          PIC X VALUE "N".
           

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

           
       
         

     
  