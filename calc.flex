import java_cup.runtime.*;
%%

%class scanner
%unicode
%cup

// Definição de padrões regulares
ESPACO_BRANCO = [ \t\r\n\f ]+
DIGITO = [0-9]
LETRA = [a-zA-Z_]
IDENTIFICADOR = {LETRA}({LETRA}|{DIGITO})*
NUMERO_INT = {DIGITO}+
NUMERO_FLOAT = {DIGITO}+"."+{DIGITO}+

// TIPOS
TIPO_INT = "int"
TIPO_FLOAT = "float"
TIPO_STRING = "string"
TIPO_BOOL = "bool"

// PALAVRAS-CHAVE
KEY_PUBLIC = "public"
KEY_PRIVATE = "private"
KEY_VOID = "void"
KEY_IF = "if"
KEY_ELSE = "else"
KEY_FOR = "for"
KEY_WHILE = "while"
KEY_CLASS = "class"
KEY_RETURN = "return"

// OPERADORES MATH
OP_MAIS = "+"
OP_MINUS = "-"
OP_MULTI = "*"
OP_DIVI = "/"

// OPERADORES
OP_IGUAL = "=="
OP_DIFE = "!="
OP_MENORQ = "<"
OP_MAIORQ = ">"
OP_MAIOR_IGUAL = ">="
OP_MENOR_IGUAL = "<="
IGUALDADE = "="

// DELIMITADORES
DL_END = ";"
DL_LPAREN = "("
DL_RPAREN = ")"
DL_LCHAVE = "{"
DL_RCHAVE = "}"
DL_VIRGUL = ","

// Comentários
COMENT_SINGLE = "//".*?[\r\n]
COMENT_MULTI = "/\\*([^*]|\\*+[^*/])*\\*+/"


%%

// Regras de correspondência de padrões
<YYINITIAL> {
  {ESPACO_BRANCO}            { /**/ }
  {COMENT_SINGLE}            { /**/ }
  {COMENT_MULTI}             { /**/ }
  
  // Tipos de dados
  {TIPO_INT}                 { //System.out.println("<TIPO_INT> __ " + yytext()); 
                               return new Symbol(sym.TIPO_INT, yytext()); }
  {TIPO_FLOAT}               { //System.out.println("<TIPO_FLOAT> __ " + yytext()); 
                               return new Symbol(sym.TIPO_FLOAT, yytext()); }
  {TIPO_STRING}               { //System.out.println("<TIPO_STRING> __ " + yytext()); 
                               return new Symbol(sym.TIPO_STRING, yytext()); }
  {TIPO_BOOL}               { //System.out.println("<TIPO_BOOL> __ " + yytext()); 
                               return new Symbol(sym.TIPO_BOOL, yytext()); }

  // Palavras-chave
  {KEY_IF}                   { //System.out.println("<KEYWORD_IF> __ " + yytext());
                               return new Symbol(sym.KEY_IF, yytext()); }
  {KEY_ELSE}                 { //System.out.println("<KEYWORD_ELSE> __ " + yytext());
                               return new Symbol(sym.KEY_ELSE, yytext()); }

  {KEY_WHILE}                { //System.out.println("<KEYWORD_WHILE> __ " + yytext());
                               return new Symbol(sym.KEY_WHILE, yytext()); }
  {KEY_FOR}                  { //System.out.println("<KEYWORD_FOR> __ " + yytext());
                               return new Symbol(sym.KEY_FOR, yytext()); }
  {KEY_CLASS}                { //System.out.println("<KEYWORD_CLASS> __ " + yytext());
                               return new Symbol(sym.KEY_CLASS, yytext()); }
  {KEY_PUBLIC}               { //System.out.println("<KEYWORD_PUBLIC> __ " + yytext());
                               return new Symbol(sym.KEY_PUBLIC, yytext()); }
  {KEY_PRIVATE}              { //System.out.println("<KEYWORD_PRIVATE> __ " + yytext());
                               return new Symbol(sym.KEY_PRIVATE, yytext()); }
  {KEY_RETURN}               { //System.out.println("<KEYWORD_RETURN> __ " + yytext());
                               return new Symbol(sym.KEY_RETURN, yytext()); }
  {KEY_VOID}               { //System.out.println("<KEYWORD_VOID> __ " + yytext());
                               return new Symbol(sym.KEY_VOID, yytext()); }

  // Identificadores (variáveis)
  {IDENTIFICADOR}            { //System.out.println("<IDENTIFICADOR> __ " + yytext());
                               return new Symbol(sym.IDENTIFICADOR, yytext()); }

  // Números inteiros e flutuantes
  {NUMERO_INT}               { //System.out.println("<NUMERO_INT> __ " + yytext());
                               return new Symbol(sym.NUMERO_INT, Integer.parseInt(yytext())); }

  {NUMERO_FLOAT}             { //System.out.println("<NUMERO_FLOAT> __ " + yytext());
                               return new Symbol(sym.NUMERO_FLOAT, Double.parseDouble(yytext())); }

  // Operadores
  {OP_MAIS}                  { //System.out.println("<OPERADOR_MAIS> __ " + yytext());
                               return new Symbol(sym.OP_MAIS, yytext()); }
  {OP_MINUS}                 { //System.out.println("<OPERADOR_MINUS> __ " + yytext());
                               return new Symbol(sym.OP_MINUS, yytext()); }
  {OP_MULTI}                 { //System.out.println("<OPERADOR_MULTI> __ " + yytext());
                               return new Symbol(sym.OP_MULTI, yytext()); }
  {OP_DIVI}                  { //System.out.println("<OPERADOR_DIVI> __ " + yytext());
                               return new Symbol(sym.OP_DIVI, yytext()); }
  {OP_IGUAL}                 { //System.out.println("<OPERADOR_IGUAL> __ " + yytext());
                               return new Symbol(sym.OP_IGUAL, yytext()); }
  {OP_DIFE}                  { //System.out.println("<OPERADOR_DIFE> __ " + yytext());
                               return new Symbol(sym.OP_DIFE, yytext()); }
  {OP_MENORQ}                  { //System.out.println("<OPOERADOR_MENORQ> __ " + yytext());
                               return new Symbol(sym.OP_MENORQ, yytext()); }
  {OP_MAIORQ}                 { //System.out.println("<OPOERADOR_MAIORQ> __ " + yytext());
                               return new Symbol(sym.OP_MAIORQ, yytext()); }
  {OP_MAIOR_IGUAL}            { //System.out.println("<OPOERADOR_MAIOR_IGUAL> __ " + yytext());
                               return new Symbol(sym.OP_MAIOR_IGUAL, yytext()); }
  {OP_MENOR_IGUAL}            { //System.out.println("<OPOERADOR_MAIOR_IGUAL> __ " + yytext());
                               return new Symbol(sym.OP_MAIOR_IGUAL, yytext()); }

  // Atribuição
  {IGUALDADE}                { //System.out.println("<ATRIBUICAO> __ " + yytext());
                               return new Symbol(sym.IGUALDADE, yytext()); }

  // Delimitadores
  {DL_END}                   { //System.out.println("<DELIMITADOR_END> __ " + yytext());
                               return new Symbol(sym.DL_END, yytext()); }
  {DL_LPAREN}                { //System.out.println("<DELIMITADOR_LPAREN> __ " + yytext());
                               return new Symbol(sym.DL_LPAREN, yytext()); }
  {DL_RPAREN}                { //System.out.println("<DELIMITADOR_RPAREN> __ " + yytext());
                               return new Symbol(sym.DL_RPAREN, yytext()); }
  {DL_LCHAVE}                { //System.out.println("<DELIMITADOR_LCHAVE> __ " + yytext());
                               return new Symbol(sym.DL_LCHAVE, yytext()); }
  {DL_RCHAVE}                 { //System.out.println("<DELIMITADOR_RCHAVE> __ " + yytext());
                               return new Symbol(sym.DL_RCHAVE, yytext()); }
  {DL_VIRGUL}                 { //System.out.println("<DELIMITADOR_VIRGULA> __ " + yytext());
                               return new Symbol(sym.DL_VIRGUL, yytext()); }
  
  .                           { System.err.println("Caractere ilegal: " + yytext()); }
}