# Compilador Básico
## Descrição
  Este projeto implementa um analisador léxico (scanner) e um analisador sintático (parser) utilizando JFlex e CUP. 
  Este guia explica como compilar e executar as diferentes etapas do projeto, usando o script run.bat fornecido como suporte.

## Requisitos
  Certifique-se de que você tem os seguintes itens instalados e configurados no seu sistema:
  - Java Development Kit (JDK): Certifique-se de que a variável de ambiente JAVA_HOME está configurada corretamente.
  - JFlex: Biblioteca para gerar o analisador léxico.
  - CUP (Construction of Useful Parsers): Biblioteca para gerar o analisador sintático.
  - Um sistema operacional compatível com scripts .bat: Windows.
  - Os arquivos necessários, incluindo as bibliotecas JFlex e CUP, devem estar organizados conforme a seguinte estrutura:
  ```cmd
    |-- lib/
    |   |-- jflex-full-1.9.1.jar
    |   |-- java-cup-11b.jar
    |   |-- java-cup-11b-runtime.jar
    |-- calc.flex
    |-- calc.cup
    |-- Main.java
    |-- run.bat
    |-- cleanup.bat
  ```

## Estrutura do Projeto
 - calc.flex: Definição das regras do analisador léxico (scanner).
 - calc.cup: Definição da gramática para o analisador sintático (parser).
 - Main.java: Classe principal para executar a solução integrada.
 - run.bat: Script para compilar e executar o scanner, o parser e a solução.
 - cleanup.bat: Script para limpar arquivos gerados automaticamente.

## Como Compilar e Executar
  Siga os passos abaixo para compilar e executar o projeto:
  #### 1. Configuração Inicial
  - Certifique-se de que todos os arquivos e bibliotecas estão na estrutura descrita acima. Em seguida, abra um terminal ou prompt de comando no diretório raiz do projeto.
  #### 2. Execute o Script run.bat 
  - No terminal, digite o comando abaixo para iniciar o script:
  ```cmd
  .\run.bat
  ```
  #### 3. O Que o Script Faz
  - O arquivo run.bat realiza as seguintes etapas automaticamente:
    ### Geração do Scanner:
      Usa o arquivo calc.flex para gerar o código do analisador léxico.
      Comando: java -jar lib\jflex-full-1.9.1.jar calc.flex
    
    ### Geração do Parser:
      Usa o arquivo calc.cup para gerar o código do analisador sintático.
      Comando: java -jar lib\java-cup-11b.jar -parser parser -symbols sym calc.cup
    
    ### Compilação:
      Compila todos os arquivos .java, incluindo os gerados por JFlex e CUP.
      Comando: javac -cp ".;lib\java-cup-11b.jar;lib\java-cup-11b-runtime.jar;lib\jflex-1.8.2.jar" *.java

    ### Execução:
      Executa a classe principal Main.
      Comando: java -cp ".;lib\java-cup-11b.jar;lib\java-cup-11b-runtime.jar;lib\jflex-1.8.2.jar" Main

  #### 4. Limpeza dos Arquivos Gerados
  - O script também chama o arquivo cleanup.bat para limpar arquivos intermediários, caso seja necessário. Você pode configurar o cleanup.bat para excluir arquivos como:
    *.class
    parser.java
    sym.java

    Se preferir, você pode rodar o cleanup.bat manualmente:
    ```cmd
    .\cleanup.bat
    ```

## Personalização
### Se você precisar modificar o projeto:
  - Atualize o arquivo calc.flex para adicionar ou alterar regras do analisador léxico.
  - Atualize o arquivo calc.cup para modificar a gramática do analisador sintático.
  - Reexecute o script run.bat para gerar e compilar os arquivos novamente.
