import java.io.*;
import java_cup.runtime.*;

public class Main {
    public static void main(String[] args) throws Exception {
        try {
            // Abra o arquivo de entrada
            Reader input = new FileReader("input.txt");
            scanner scanner = new scanner(input);
            parser parse = new parser(scanner);

            System.out.println("Iniciando análise...");

            // Processar a entrada
            parse.parse();

            System.out.println("Análise concluída com sucesso!");

            // Etapa 1
            // Ler todos os tokens do arquivo de entrada
            // while (scanner.next_token().sym != sym.EOF) {
            //     System.out.println(scanner.next_token());
            // }

        } catch (FileNotFoundException e) {
            System.err.println("Arquivo não encontrado: " + e.getMessage());
        }
    }
}