import java.io.*;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) throws Exception {
        try {
            // Abra o arquivo de entrada
            Reader input = new FileReader("input.txt");
            scanner scanner = new scanner(input);
            parser parse = new parser(scanner);

            System.out.println("Iniciando processoo...");

            // Processar a entrada
            parse.parse();

            System.out.println("Análise concluída com sucesso!");

            // Etapa 1
            // Ler todos os tokens do arquivo de entrada
            // Symbol s = scanner.next_token();
            // while (s.sym != sym.EOF) {
            // System.out.println(s.value);
            // s = scanner.next_token();
            // }

        } catch (FileNotFoundException e) {
            System.err.println("Arquivo não encontrado: " + e.getMessage());
        }
    }
}