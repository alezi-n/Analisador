import java.io.*;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) throws Exception {
        try {
            // Abra o arquivo de entrada
            Reader input1 = new FileReader("input.txt");
            Reader input2 = new FileReader("input.txt");
            // Scanner
            scanner scannerEtapa1 = new scanner(input1);
            
            // Etapa 1
            // Ler todos os tokens do arquivo de entrada
            Symbol s = scannerEtapa1.next_token();
            while (s.sym != sym.EOF) {
                System.out.println("Token(<" + getSymbolName(s.sym) + ">): " + s.value);
                s = scannerEtapa1.next_token();
            }
            
            // ETAPA 2
            scanner scannerEtapa2 = new scanner(input2);
            // Parser
            parser parse = new parser(scannerEtapa2);
            // Processar a entrada
            System.out.println("Iniciando processoo...");

            parse.parse();

            System.out.println("Análise concluída com sucesso!");

        } catch (FileNotFoundException e) {
            System.err.println("Arquivo não encontrado: " + e.getMessage());
        }
    }

    public static String getSymbolName(int symNumber) {
        // Verifica se o número está dentro dos limites do array terminalNames
        if (symNumber >= 0 && symNumber < sym.terminalNames.length) {
            return sym.terminalNames[symNumber];
        }
        // Retorna "UNKNOWN" para números fora do intervalo
        return "UNKNOWN";
    }
}