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

lexer grammar Symbol;

AND_:                'AND';
OR_:                 'OR';
NOT_:                'NOT';
TILDE_:              '~';
VERTICAL_BAR_:       '|';
AMPERSAND_:          '&';
SIGNED_LEFT_SHIFT_:  '<<';
SIGNED_RIGHT_SHIFT_: '>>';
CARET_:              '^';
MOD_:                '%';
COLON_:              ':';
PLUS_:               '+';
MINUS_:              '-';
ASTERISK_:           '*';
SLASH_:              '/';
BACKSLASH_:          '\\';
DOT_:                '.';
DEQ_:                '=';
EQ_:                 '=';
NEQ_:                '<>' | '!=';
GT_:                 '>';
GTE_:                '>=';
LT_:                 '<';
LTE_:                '<=';
LP_:                 '(';
RP_:                 ')';
LBT_:                '[';
RBT_:                ']';
COMMA_:              ',' | '\uFF0C';
DQ_:                 '"';
SQ_:                 '\'';
QUESTION_:           '?';
SEMI_:               ';';
DOLLAR_:             '$';
ASSIGNMENT_OPERATOR_:':=';
