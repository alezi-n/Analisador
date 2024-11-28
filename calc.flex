import java_cup.runtime.*;

%%

%class scanner // Nome da classe gerada
%unicode
%cup // Integração com CUP
%line // Informação da linha para depuração
%column // Informação da coluna para depuração

// Definição de padrões regulares
ESPACO_BRANCO = [ \t\r\n\f]+
DIGITO = [0-9]
LETRA = [a-zA-Z_]
IDENTIFICADOR = {LETRA}({LETRA}|{DIGITO})*
NUMERO_INT = {DIGITO}+
NUMERO_FLOAT = {DIGITO}+"."+{DIGITO}+
KEYWORDS = "if" | "else" | "while" | "return" | "int" | "float" | "for" | "class" | "public" | "private"
OPERADORES = \+|\-|\*|\/|\=\=|\!\=|\<|\>|\<\=|\>\=
DELIMITADORES = \;|\,|\{|\}|\(|\)
COMENTARIO_SINGLE = "//".*?[\r\n]
COMENTARIO_MULTI = "/\\*([^*]|\\*+[^*/])*\\*+/"

%%

// Regras de correspondência de padrões
<YYINITIAL> {
  {ESPACO_BRANCO}            { /* Ignorar espaços em branco */ }
  {COMENTARIO_SINGLE}        { /* Ignorar comentários de uma linha */ }
  {COMENTARIO_MULTI}         { /* Ignorar comentários multilinha */ }
  {KEYWORDS}                 { System.out.println("KEYWORD encontrado no parser!");
    return new Symbol(sym.KEYWORD, yytext()); }
  {IDENTIFICADOR}            { return new Symbol(sym.IDENTIFICADOR, yytext()); }
  {NUMERO_FLOAT}             { return new Symbol(sym.NUMERO_FLOAT, Double.parseDouble(yytext())); }
  {NUMERO_INT}               { return new Symbol(sym.NUMERO_INT, Integer.parseInt(yytext())); }
  {OPERADORES}               { return new Symbol(sym.OPERADOR, yytext()); }
  {DELIMITADORES}            { return new Symbol(sym.DELIMITADOR, yytext()); }
  .                          { System.err.println("Caractere ilegal: " + yytext()); }
}
