IDENTIFICATION DIVISION.
       PROGRAM-ID. ALUNOS.
       AUTHOR. ERIC VARJAO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQUIVO-ALUNOS ASSIGN TO "alunos.nota"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD ARQUIVO-ALUNOS.
       01 REGISTRO-ALUNO.
          05 NOME-ALUNO     PIC X(20).
          05 NOTE-1         PIC 9(3)V9(2).
          05 NOTE-2         PIC 9(3)V9(2).
          05 MEDIA          PIC 9(3)V9(2).
          05 RESULTADO      PIC X(10).

       WORKING-STORAGE SECTION.
       01 WS-NOME-ALUNO    PIC X(20).
       01 WS-NOTA-1        PIC 9(3)V9(2).
       01 WS-NOTA-2        PIC 9(3)V9(2).
       01 WS-MEDIA         PIC 9(3)V9(2).
       01 WS-RESULTADO     PIC X(20).
       01 WS-OPCAO         PIC X VALUE SPACE.

       PROCEDURE DIVISION.
       PRINCIPAL.
           DISPLAY "==============================".
           DISPLAY "Cadastro de Alunos e Notas".
           DISPLAY "==============================".
           
           OPEN OUTPUT ARQUIVO-ALUNOS.
           PERFORM ATE-FINALIZAR UNTIL WS-OPCAO = "N" OR WS-OPCAO = "n".
           CLOSE ARQUIVO-ALUNOS.
           
           DISPLAY "==============================".
           DISPLAY "Processo finalizado. Arquivo Criado.".
           DISPLAY "==============================".
           STOP RUN.

       ATE-FINALIZAR.
           PERFORM SOLICITAR-DADOS.
           PERFORM CALCULAR-MEDIA.
           PERFORM GRAVAR-ARQUIVO.
           
           DISPLAY "Deseja cadastrar outro aluno ? (S/N): " WITH NO ADVANCING.
           ACCEPT WS-OPCAO.

       SOLICITAR-DADOS.
           DISPLAY "Informe o nome do aluno: " WITH NO ADVANCING.
           ACCEPT WS-NOME-ALUNO.
           DISPLAY "Informe a primeira nota: " WITH NO ADVANCING.
           ACCEPT WS-NOTA-1.
           DISPLAY "Informe a segunda nota: " WITH NO ADVANCING.
           ACCEPT WS-NOTA-2.

  CALCULAR-MEDIA.
           COMPUTE WS-MEDIA = (WS-NOTA-1 + WS-NOTA-2) / 2.
           IF WS-MEDIA >= 5.00
               MOVE "Aprovado" TO WS-RESULTADO
           ELSE
               MOVE "Reprovado" TO WS-RESULTADO
           END-IF.

           DISPLAY "Média: " WS-MEDIA.
           DISPLAY "Resultado: " WS-RESULTADO.

       GRAVAR-ARQUIVO.
           MOVE WS-NOME-ALUNO TO NOME-ALUNO.
           MOVE WS-NOTA-1     TO NOTE-1.
           MOVE WS-NOTA-2     TO NOTE-2.
           MOVE WS-MEDIA      TO MEDIA.
           MOVE WS-RESULTADO  TO RESULTADO.
           WRITE REGISTRO-ALUNO.
