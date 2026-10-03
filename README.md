# Cadastro de Alunos e Notas em COBOL

Este é um programa simples escrito em COBOL para cadastrar dados de alunos, calcular a média das notas, indicar a situação do aluno (Aprovado ou Reprovado) e salvar os registros em um arquivo de texto estruturado (`LINE SEQUENTIAL`).

---

## 📋 Funcionalidades

- **Entrada via terminal:** Solicita o nome do aluno e duas notas.
- **Cálculo da Média:** Calcula a média aritmética simples das duas notas.
- **Definição de Resultado:** 
  - Média $\ge$ 5.00: **Aprovado**
  - Média < 5.00: **Reprovado**
- **Persistência de Dados:** Salva cada registro no arquivo de saída `alunos.nota`.
- **Loop Interativo:** Permite cadastrar múltiplos alunos em sequência até o usuário decidir encerrar (`S/N`).

---

## 🛠️ Tecnologias e Dependências

- **Linguagem:** COBOL (Dialeto COBOL-85 / COBOL 2002)
- **Compilador recomendado:** [GnuCOBOL](https://gnucobol.sourceforge.io/) (`cobc`)

---

## 📁 Estrutura do Arquivo de Saída (`alunos.nota`)

O arquivo gerado é do tipo `LINE SEQUENTIAL` (uma linha por registro). Cada linha segue o leiaute definido na `FILE SECTION`:

| Campo | Posição / Tamanho | Tipo | Descrição |
| :--- | :--- | :--- | :--- |
| `NOME-ALUNO` | 20 caracteres | Alfanumérico (`PIC X(20)`) | Nome informado do aluno |
| `NOTE-1` | 5 dígitos (3 int, 2 dec) | Numérico (`PIC 9(3)V9(2)`) | Primeira nota do aluno |
| `NOTE-2` | 5 dígitos (3 int, 2 dec) | Numérico (`PIC 9(3)V9(2)`) | Segunda nota do aluno |
| `MEDIA` | 5 dígitos (3 int, 2 dec) | Numérico (`PIC 9(3)V9(2)`) | Média calculada |
| `RESULTADO` | 10 caracteres | Alfanumérico (`PIC X(10)`) | Status (Aprovado / Reprovado) |

---

## 🚀 Como Executar

### 1. Clonar o repositório
```bash
git clone [https://github.com/seu-usuario/seu-repositorio.git](https://github.com/seu-usuario/seu-repositorio.git)
cd seu-repositorio
