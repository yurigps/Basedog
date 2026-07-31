       IDENTIFICATION DIVISION.
       PROGRAM-ID. Prog15.
       AUTHOR. YuriGPS.
      *Programa para estudo de manipulação de arquivos.
      *Objetivo: Utilizar COPY. 
      *          Excluir registros de um arquivo indexado.

       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           
           COPY "SELCLIENTES.cob".
  
       DATA DIVISION. 
       FILE SECTION.
           
           COPY "FDCLIENTES.cob".

       WORKING-STORAGE SECTION.
       
       77  REGISTRO-ENCONTRADO PIC X.

       77  CHAVE-CLIENTE-EXCLUIR PIC 9(5).

       77  CONFIRMAR-EXCLUSAO PIC X.
       
      

       PROCEDURE DIVISION.
       
           OPEN I-O ARQUIVO-CLIENTE.

           PERFORM PEGA-REGISTRO-CLIENTE.

           PERFORM DELETAR-REGISTRO
               UNTIL CHAVE = ZEROES.
               

           CLOSE ARQUIVO-CLIENTE.

           STOP RUN.       


       PEGA-REGISTRO-CLIENTE.

           MOVE SPACES TO REGISTRO-CLIENTE
           MOVE ZEROS TO CHAVE

           DISPLAY "---digite 0(ZERO) para fechar o programa.---"
           DISPLAY "INFORME O CÓDIGO DO CLIENTE: ".
           ACCEPT CHAVE-CLIENTE-EXCLUIR.
           MOVE CHAVE-CLIENTE-EXCLUIR TO CHAVE.

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
                   DISPLAY " "
                   DISPLAY "INFORME O CÓDIGO DO CLIENTE: "
                   ACCEPT CHAVE-CLIENTE-EXCLUIR
                   MOVE CHAVE-CLIENTE-EXCLUIR TO CHAVE
               NOT INVALID KEY
                   MOVE "S" TO REGISTRO-ENCONTRADO
           END-READ.


       DELETAR-REGISTRO.    
           
           DISPLAY "-------------------------------".
           DISPLAY "CHAVE: " CHAVE.
           DISPLAY "NOME: " NOME.
           DISPLAY "IDADE: " IDADE.
           DISPLAY "E-MAIL: " EMAIL.
           DISPLAY "-------------------------------".

           
           MOVE "X" TO CONFIRMAR-EXCLUSAO.

           PERFORM PERGUNTA-EXCLUIR
               UNTIL CONFIRMAR-EXCLUSAO = "S" OR "N".


           IF CONFIRMAR-EXCLUSAO = "S"
               DISPLAY " "
               DISPLAY "REGISTRO EXCLUIDO COM SUCESSO!"
               DISPLAY " "
               DELETE ARQUIVO-CLIENTE RECORD
                   INVALID KEY
                   DISPLAY " "
                   DISPLAY "ERRO AO EXCLUIR O REGISTRO".
           
           PERFORM PEGA-REGISTRO-CLIENTE.


       PERGUNTA-EXCLUIR.
           DISPLAY " "
           DISPLAY "DESEJA EXCLUIR ESTE REGISTRO(S/N)?".
           ACCEPT CONFIRMAR-EXCLUSAO.
           IF CONFIRMAR-EXCLUSAO ="s"
               MOVE "S" TO CONFIRMAR-EXCLUSAO.
           IF CONFIRMAR-EXCLUSAO = "n"
               MOVE "N" TO CONFIRMAR-EXCLUSAO.
           IF CONFIRMAR-EXCLUSAO NOT EQUAL "S" AND    
              CONFIRMAR-EXCLUSAO NOT EQUAL "N" 
              DISPLAY " "
              DISPLAY "VOCE DEVE ESCOLHER SIM OU NAO".
           