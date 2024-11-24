import java.io.*;
import java_cup.runtime.*;

public class Main {
    public static void main(String[] args) {
        try {
            // Abra o arquivo de entrada
            Reader input = new FileReader("input.txt");

            // Inicialize o Scanner gerado pelo JFlex
            scanner scanner = new scanner(input);

            // Leia todos os tokens do arquivo de entrada
            Symbol token;
            while ((token = scanner.next_token()).sym != sym.EOF) {
                System.out.println("Token: " + token.sym + ", Valor: " + token.value);
            }

        } catch (FileNotFoundException e) {
            System.err.println("Arquivo não encontrado: " + e.getMessage());
        } catch (IOException e) {
            System.err.println("Erro ao ler o arquivo: " + e.getMessage());
        }
    }
}
