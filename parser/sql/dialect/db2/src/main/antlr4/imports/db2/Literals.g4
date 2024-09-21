/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

lexer grammar Literals;

import Alphabet, Symbol;

FILESIZE_LITERAL
    : INT_NUM_ ('K'|'M'|'G'|'T')
    ;

SINGLE_QUOTED_TEXT
    : '\'' ( '\\'. | '\'' '\'' | ~('\'' | '\\') )* '\''
    ;

DOUBLE_QUOTED_TEXT
    : '"' ( '\\'. | '""' | ~('"' | '\\') )* '"'
    ;

BQUOTA_STRING
    : '`' ( '\\'. | '``' | ~('`' | '\\') )* '`'
    ;

NUMBER_
    : INT_NUM_
    | FLOAT_NUM_
    | DECIMAL_NUM_
    ;

fragment INT_NUM_
    : DIGIT+
    ;

fragment FLOAT_NUM_
    : INT_NUM_? '.' DIGIT* ( EXPONENT_PART )?
    | '.' DIGIT+ ( EXPONENT_PART )?
    | INT_NUM_ EXPONENT_PART
    ;

fragment DECIMAL_NUM_
    : INT_NUM_? '.' DIGIT+
    ;

fragment HEX_DIGIT_
    : 'X' '\'' HEX_DIGIT+ '\''
    | 'X' '"' HEX_DIGIT+ '"'
    ;

IDENTIFIER_
    : [A-Za-z_$][A-Za-z0-9_$]*
    | '"' (~["] | '""')* '"'
    ;

BIT_NUM_
    : 'B' '\'' [01]+ '\''
    | 'B' '"' [01]+ '"'
    ;

IP_ADDRESS
    : INT_NUM_ '.' INT_NUM_ '.' INT_NUM_ '.' INT_NUM_
    ;

fragment DIGIT
    : [0-9]
    ;

fragment HEX_DIGIT
    : [0-9a-fA-F]
    ;

fragment EXPONENT_PART
    : [eE] [+-]? DIGIT+
    ;

fragment SPACES
    : [ \t\r\n]+ -> skip
    ;

fragment INTERVAL_VALUE
    : DIGIT+ ('.' DIGIT*)?
    ;

fragment INTERVAL_UNIT
    : 'YEAR' | 'MONTH' | 'DAY' | 'HOUR' | 'MINUTE' | 'SECOND'
    ;

INTERVAL_LITERAL_
    : 'INTERVAL' SPACES? '\'' INTERVAL_VALUE SPACES? INTERVAL_UNIT '\''
    | 'INTERVAL' SPACES? '"' INTERVAL_VALUE SPACES? INTERVAL_UNIT '"'
    ;

STRING_LITERAL
    : '\'' (~['\\] | '\\' .)* '\''
    ;

NUMERIC_LITERAL
    : [0-9]+ ('.' [0-9]+)?
    ;

ID_
    : [a-zA-Z_] [a-zA-Z0-9_]*
   ;