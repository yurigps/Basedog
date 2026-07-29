       IDENTIFICATION DIVISION.
       PROGRAM-ID. Prog14.
       AUTHOR. YuriGPS.
      *Programa para estudo de manipulação de arquivos.
      *Objetivo: Utilizar COPY. 
      *          Alterar registros de um arquivo indexado.

       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           
           COPY "SELCLIENTES.cob".
  
       DATA DIVISION. 
       FILE SECTION.
           
           COPY "FDCLIENTES.cob".

       WORKING-STORAGE SECTION.

       77  REGISTRO-ENCONTRADO PIC X.
       77  CHAVE-CLIENTE-ALTERAR PIC 9(2).
       77  QUAL-CAMPO PIC 9.
       
      

       PROCEDURE DIVISION.

           OPEN I-O ARQUIVO-CLIENTE.
           
           PERFORM PEGA-REGISTRO-CLIENTE.

           PERFORM ALTERAR-REGISTRO
               UNTIL CHAVE = ZEROES.
          
              
           CLOSE ARQUIVO-CLIENTE.

           STOP RUN.
       

       PEGA-REGISTRO-CLIENTE.

           MOVE SPACES TO REGISTRO-CLIENTE
           MOVE ZEROS TO CHAVE

           DISPLAY "---digite 0(ZERO) para cancelar.---"
           DISPLAY "INFORME O CÓDIGO DO CLIENTE: ".
           ACCEPT CHAVE-CLIENTE-ALTERAR.
           MOVE CHAVE-CLIENTE-ALTERAR TO CHAVE.

           MOVE "N" TO REGISTRO-ENCONTRADO.

           PERFORM ENCONTRA-REGISTRO-CLIENTE
               UNTIL REGISTRO-ENCONTRADO = "S" OR 
                     CHAVE = ZEROES.

       ENCONTRA-REGISTRO-CLIENTE.
           READ ARQUIVO-CLIENTE RECORD
               KEY IS CHAVE
               INVALID KEY 
                   DISPLAY "--> REGISTRO NÃO ENCONTRADO! <--"
                   DISPLAY "---digite 0(ZERO) para cancelar.---"
                   DISPLAY "INFORME O CÓDIGO DO CLIENTE: "
                   ACCEPT CHAVE-CLIENTE-ALTERAR
                   MOVE CHAVE-CLIENTE-ALTERAR TO CHAVE
               NOT INVALID KEY
                   MOVE "S" TO REGISTRO-ENCONTRADO
           END-READ.
           

       ALTERAR-REGISTRO.
           
           DISPLAY "-------------------------------".
           DISPLAY "CHAVE: " CHAVE.
           DISPLAY "1.NOME: " NOME.
           DISPLAY "2.IDADE: " IDADE.
           DISPLAY "3.E-MAIL: " EMAIL.
           DISPLAY "-------------------------------".

           DISPLAY " ".
           DISPLAY "DIGITE NUMERO DO CAMPO PARA ALTERAR (1-3)".
           DISPLAY "---digite 0(ZERO) para cancelar.---".
           ACCEPT QUAL-CAMPO.
           
           IF QUAL-CAMPO > 0 AND QUAL-CAMPO < 4 

               PERFORM MUDA-E-GRAVA-CAMPO
           ELSE 
               IF QUAL-CAMPO > 3 
                   DISPLAY "CAMPO INVÁLIDO"
               END-IF
           END-IF.
           

           PERFORM PEGA-REGISTRO-CLIENTE.


       MUDA-E-GRAVA-CAMPO.
           IF QUAL-CAMPO = 1
               DISPLAY "INFORME O NOVO NOME: "
               ACCEPT NOME.

           IF QUAL-CAMPO = 2
               DISPLAY "INFORME A NOVA IDADE: "
               ACCEPT IDADE.

           IF QUAL-CAMPO = 3 
               DISPLAY "INFORME O NOVO E-MAIL: "
               ACCEPT EMAIL.


           PERFORM REESCREVER-REGISTRO.

       REESCREVER-REGISTRO.
           REWRITE REGISTRO-CLIENTE
               INVALID KEY
                   DISPLAY "--> ERRO AO REESCREVER O REGISTRO! <--"

               NOT INVALID KEY 
                   DISPLAY "--> REGISTRO ALTERADO COM SUCESSO! <--"
           END-REWRITE.

