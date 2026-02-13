       IDENTIFICATION DIVISION.
       PROGRAM-ID. prog1.
       AUTHOR. YuriGPS.
      *    Programa para estudo da estrutura básica do Cobol
      *    Objetivo: Exibir um "hello world" e um número separado com vírgula.
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.

       PROCEDURE DIVISION.
           
      *exemplo de comentário.     
                                              
           DISPLAY "Ihanin Viado! :)".
           DISPLAY 12,56.
           
           
           STOP RUN.
