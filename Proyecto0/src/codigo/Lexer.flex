package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Tipos de datos */
( byte | int | char | long | float | double ) {lexeme=yytext(); return T_dato;}

/* Tipo de dato String */
( String ) {lexeme=yytext(); return Cadena;}

/* Palabra reservada If */
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}

/* Palabra reservada assingTo */
( assingTo ) {lexeme=yytext(); return assingTo;}

/* Palabra reservada goTo */
( goto ) {lexeme=yytext(); return goTo;}

/* Palabra reservada Move */
( move ) {lexeme=yytext(); return move;}

/* Palabra reservada turn */
( turn ) {lexeme=yytext(); return turn;}

/* Palabra reservada face */
( face ) {lexeme=yytext(); return face;}

/* Palabra reservada put */
( put ) {lexeme=yytext(); return put;}

/* Palabra reservada pick */
( pick ) {lexeme=yytext(); return pick;}

/* Palabra reservada moveToThe */
( moveToThe ) {lexeme=yytext(); return moveToThe;}

/* Palabra reservada moveInDir */
( moveInDir ) {lexeme=yytext(); return moveInDir;}

/* Palabra reservada jumpToThe */
( jumToThe ) {lexeme=yytext(); return jumpToThe;}

/* Palabra reservada jumpInDir */
( jumpInDir ) {lexeme=yytext(); return jumpInDir;}

/* Palabra reservada nop */
( nop ) {lexeme=yytext(); return nop;}

/* Palabra reservada facing */
( facing ) {lexeme=yytext(); return facing;}

/* Palabra reservada canPut */
( canPut ) {lexeme=yytext(); return canPut;}

/* Palabra reservada canPick */
( canPick ) {lexeme=yytext(); return canPick;}

/* Palabra reservada canMoveInDir */
( canMoveInDir ) {lexeme=yytext(); return canMoveInDir;}

/* Palabra reservada canJumpInDir */
( canJumpInDir ) {lexeme=yytext(); return canJumpInDir;}

/* Palabra reservada canMoveToThe */
( canMoveToThe ) {lexeme=yytext(); return canMoveToThe;}

/* Palabra reservada canJumpToThe */
( canJumpToThe ) {lexeme=yytext(); return canJumpToThe;}

/* Palabra reservada not */
( not ) {lexeme=yytext(); return not;}


/* Operador Igual */
( "=" ) {lexeme=yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(true | false)      {lexeme = yytext(); return Op_booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

/* Marcador de inicio de algoritmo */
( "ROBOT_R" ) {lexeme=yytext(); return ROBOT_R;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* 2 Puntos */
( ":" ) {lexeme=yytext(); return DosPuntos;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}
