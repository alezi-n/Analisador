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
  {TIPO_INT}                 { return new Symbol(sym.TIPO_INT, yytext()); }
  {TIPO_FLOAT}               { return new Symbol(sym.TIPO_FLOAT, yytext()); }
  {TIPO_STRING}              { return new Symbol(sym.TIPO_STRING, yytext()); }
  {TIPO_BOOL}                { return new Symbol(sym.TIPO_BOOL, yytext()); }

  // Palavras-chave
  {KEY_IF}                   { return new Symbol(sym.KEY_IF, yytext()); }
  {KEY_ELSE}                 { return new Symbol(sym.KEY_ELSE, yytext()); }
  {KEY_WHILE}                { return new Symbol(sym.KEY_WHILE, yytext()); }
  {KEY_FOR}                  { return new Symbol(sym.KEY_FOR, yytext()); }
  {KEY_PUBLIC}               { return new Symbol(sym.KEY_PUBLIC, yytext()); }
  {KEY_PRIVATE}              { return new Symbol(sym.KEY_PRIVATE, yytext()); }
  {KEY_RETURN}               { return new Symbol(sym.KEY_RETURN, yytext()); }
  {KEY_VOID}                 { return new Symbol(sym.KEY_VOID, yytext()); }

  // Identificadores (variáveis)
  {IDENTIFICADOR}            { return new Symbol(sym.IDENTIFICADOR, yytext()); }

  // Números inteiros e flutuantes
  {NUMERO_INT}               { return new Symbol(sym.NUMERO_INT, Integer.parseInt(yytext())); }

  {NUMERO_FLOAT}             { return new Symbol(sym.NUMERO_FLOAT, Double.parseDouble(yytext())); }

  // Operadores
  {OP_MAIS}                  { return new Symbol(sym.OP_MAIS, yytext()); }
  {OP_MINUS}                 { return new Symbol(sym.OP_MINUS, yytext()); }
  {OP_MULTI}                 { return new Symbol(sym.OP_MULTI, yytext()); }
  {OP_DIVI}                  { return new Symbol(sym.OP_DIVI, yytext()); }
  {OP_IGUAL}                 { return new Symbol(sym.OP_IGUAL, yytext()); }
  {OP_DIFE}                  { return new Symbol(sym.OP_DIFE, yytext()); }
  {OP_MENORQ}                { return new Symbol(sym.OP_MENORQ, yytext()); }
  {OP_MAIORQ}                { return new Symbol(sym.OP_MAIORQ, yytext()); }
  {OP_MAIOR_IGUAL}           { return new Symbol(sym.OP_MAIOR_IGUAL, yytext()); }
  {OP_MENOR_IGUAL}           { return new Symbol(sym.OP_MAIOR_IGUAL, yytext()); }

  // Atribuição
  {IGUALDADE}                { return new Symbol(sym.IGUALDADE, yytext()); }

  // Delimitadores
  {DL_END}                   { return new Symbol(sym.DL_END, yytext()); }
  {DL_LPAREN}                { return new Symbol(sym.DL_LPAREN, yytext()); }
  {DL_RPAREN}                { return new Symbol(sym.DL_RPAREN, yytext()); }
  {DL_LCHAVE}                { return new Symbol(sym.DL_LCHAVE, yytext()); }
  {DL_RCHAVE}                { return new Symbol(sym.DL_RCHAVE, yytext()); }
  {DL_VIRGUL}                { return new Symbol(sym.DL_VIRGUL, yytext()); }
  
  .                          { System.err.println("Caractere ilegal: " + yytext()); }
}