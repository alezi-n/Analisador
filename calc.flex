import java_cup.runtime.*;

%%

%class scanner // Nome da classe gerada
%unicode
%cup // Integração com CUP

// Definição de padrões regulares
ESPACO_BRANCO = [ \t\r\n\f]+
DIGITO = [0-9]
LETRA = [a-zA-Z_]
IDENTIFICADOR = {LETRA}({LETRA}|{DIGITO})*
NUMERO_INT = {DIGITO}+
NUMERO_FLOAT = {DIGITO}+"."+{DIGITO}+
TIPO = "int" | "float"
KEYWORDS = "if" | "else" | "while" | "return" | "for" | "class" | "public" | "private"
OPERADORES = \+|\-|\*|\/|\=\=|\!\=|\<|\>|\<\=|\>\=
IGUALDADE = \=
DELIMITADORES = \;|\,|\{|\}|\(|\)
COMENTARIO_SINGLE = "//".*?[\r\n]
COMENTARIO_MULTI = "/\\*([^*]|\\*+[^*/])*\\*+/"

%%

// Regras de correspondência de padrões
<YYINITIAL> {
  {ESPACO_BRANCO}            { /**/ }
  {COMENTARIO_SINGLE}        { /**/ }
  {COMENTARIO_MULTI}         { /**/ }
  {TIPO}                     { System.out.println("<TIPO> __ " + yytext());
                                return new Symbol(sym.TIPO, yytext()); }
  {KEYWORDS}                 { System.out.println("<KEYWORD> __ " + yytext());
                                return new Symbol(sym.KEYWORD, yytext()); }

  {IDENTIFICADOR}            { System.out.println("<IDENTIFICADOR> __ " + yytext());
                                return new Symbol(sym.IDENTIFICADOR, yytext()); }
 
  {NUMERO_FLOAT}                 { System.out.println("<NUMERO_FLOAT> __ " + yytext());
                                return new Symbol(sym.NUMERO_FLOAT, yytext()); }

  {NUMERO_INT}                 { System.out.println("<NUMERO_INT> __ " + yytext());
                                return new Symbol(sym.NUMERO_INT, yytext()); }

  {OPERADORES}                 { System.out.println("<OPERADOR> __ " + yytext());
                                return new Symbol(sym.OPERADOR, yytext()); }

  {IGUALDADE}                 { System.out.println("<IGUALDADE> __ " + yytext());
                                return new Symbol(sym.IGUALDADE, yytext()); }

  {DELIMITADORES}             { System.out.println("<DELIMITADOR> __ " + yytext());
                                return new Symbol(sym.DELIMITADOR, yytext()); }
                 
  .                          { System.err.println("Caractere ilegal: " + yytext()); }
}