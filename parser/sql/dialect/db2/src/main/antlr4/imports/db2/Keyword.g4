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

lexer grammar Keyword;

import Alphabet, Number;

WS
    : [ \t\r\n\u3000] + ->skip
    ;

ABS
    : A B S
    ;

ARE
    : A R E
    ;

ARRAY
    : A R R A Y
    ;

ASYMMETRIC
    : A S Y M M E T R I C
    ;

ATOMIC
    : A T O M I C
    ;

AVG
    : A V G
    ;

BIGINT
    : B I G I N T
    ;

BLOB
    : B L O B
    ;

BOOLEAN
    : B O O L E A N
    ;

BOTH
    : B O T H
    ;

CEIL
    : C E I L
    ;

CEILING
    : C E I L I N G
    ;

CHAR_LENGTH
    : C H A R UL_ L E N G T H
    ;

CHARACTER_LENGTH
    : C H A R A C T E R UL_ L E N G T H
    ;

CLOB
    : C L O B
    ;

COALESCE
    : C O A L E S C E
    ;

COLLATE
    : C O L L A T E
    ;

COLLECT
    : C O L L E C T
    ;

CONVERT
    : C O N V E R T
    ;

CORR
    : C O R R
    ;

CORRESPONDING
    : C O R R E S P O N D I N G
    ;

COVAR_POP
    : C O V A R UL_ P O P
    ;

COVAR_SAMP
    : C O V A R UL_ S A M P
    ;

CUBE
    : C U B E
    ;

CUME_DIST
    : C U M E UL_ D I S T
    ;

CURRENT_DEFAULT_TRANSFORM_GROUP
    : C U R R E N T UL_ D E F A U L T UL_ T R A N S F O R M UL_ G R O U P
    ;

CURRENT_ROLE
    : C U R R E N T UL_ R O L E
    ;

CURRENT_TRANSFORM_GROUP_FOR_TYPE
    : C U R R E N T UL_ T R A N S F O R M UL_ G R O U P UL_ F O R UL_ T Y P E
    ;

DEC
    : D E C
    ;

DECIMAL
    : D E C I M A L
    ;

DEREF
    : D E R E F
    ;

ELEMENT
    : E L E M E N T
    ;

EXEC
    : E X E C
    ;

EXP
    : E X P
    ;

FALSE
    : F A L S E
    ;

FILTER
    : F I L T E R
    ;

FLOAT
    : F L O A T
    ;

FLOOR
    : F L O O R
    ;

FUSION
    : F U S I O N
    ;

GROUPING
    : G R O U P I N G
    ;

INT
    : I N T
    ;

INTEGER
    : I N T E G E R
    ;

INTERSECTION
    : I N T E R S E C T I O N
    ;

INTERVAL
    : I N T E R V A L
    ;

LARGE
    : L A R G E
    ;

LEADING
    : L E A D I N G
    ;

LN
    : L N
    ;

LOWER
    : L O W E R
    ;

MATCH
    : M A T C H
    ;

MAX
    : M A X
    ;

MEMBER
    : M E M B E R
    ;

MERGE
    : M E R G E
    ;

METHOD
    : M E T H O D
    ;

MIN
    : M I N
    ;

MOD
    : M O D
    ;

MODULE
    : M O D U L E
    ;

MULTISET
    : M U L T I S E T
    ;

NATIONAL
    : N A T I O N A L
    ;

NATURAL
    : N A T U R A L
    ;

NCHAR
    : N C H A R
    ;

NCLOB
    : N C L O B
    ;

NORMALIZE
    : N O R M A L I Z E
    ;

NULLIF
    : N U L L I F
    ;

NUMERIC
    : N U M E R I C
    ;

OCTET_LENGTH
    : O C T E T UL_ L E N G T H
    ;

ONLY
    : O N L Y
    ;

OVERLAPS
    : O V E R L A P S
    ;

OVERLAY
    : O V E R L A Y
    ;

PERCENT_RANK
    : P E R C E N T UL_ R A N K
    ;

PERCENTILE_CONT
    : P E R C E N T I L E UL_ C O N T
    ;

PERCENTILE_DISC
    : P E R C E N T I L E UL_ D I S C
    ;

POWER
    : P O W E R
    ;

REAL
    : R E A L
    ;

RECURSIVE
    : R E C U R S I V E
    ;

REF
    : R E F
    ;

REGR_AVGX
    : R E G R UL_ A V G X
    ;

REGR_AVGY
    : R E G R UL_ A V G Y
    ;

REGR_COUNT
    : R E G R UL_ C O U N T
    ;

REGR_INTERCEPT
    : R E G R UL_ I N T E R C E P T
    ;

REGR_SLOPE
    : R E G R UL_ S L O P E
    ;

REGR_SXX
    : R E G R UL_ S X X
    ;

REGR_SXY
    : R E G R UL_ S X Y
    ;

REGR_SYY
    : R E G R UL_ S Y Y
    ;

ROLLUP
    : R O L L U P
    ;

SCOPE
    : S C O P E
    ;

SIMILAR
    : S I M I L A R
    ;

SMALLINT
    : S M A L L I N T
    ;

SPECIFICTYPE
    : S P E C I F I C UL_ T Y P E
    ;

SQLEXCEPTION
    : S Q L E X C E P T I O N
    ;

SQLSTATE
    : S Q L S T A T E
    ;

SQLWARNING
    : S Q L W A R N I N G
    ;

SQRT
    : S Q R T
    ;

STDDEV_POP
    : S T D D E V UL_ P O P
    ;

STDDEV_SAMP
    : S T D D E V UL_ S A M P
    ;

SUBMULTISET
    : S U B M U L T I S E T
    ;

SUM
    : S U M
    ;

SYMMETRIC
    : S Y M M E T R I C
    ;

TABLESAMPLE
    : T A B L E S A M P L E
    ;

TIMEZONE_HOUR
    : T I M E Z O N E UL_ H O U R
    ;

TIMEZONE_MINUTE
    : T I M E Z O N E UL_ M I N U T E
    ;

TRAILING
    : T R A I L I N G
    ;

TRANSLATE
    : T R A N S L A T E
    ;

TRANSLATION
    : T R A N S L A T I O N
    ;

TREAT
    : T R E A T
    ;

TRUE
    : T R U E
    ;

UESCAPE
    : U E S C A P E
    ;

UNKNOWN
    : U N K N O W N
    ;

UNNEST
    : U N N E S T
    ;

UPPER
    : U P P E R
    ;

VAR_POP
    : V A R UL_ P O P
    ;

VAR_SAMP
    : V A R UL_ S A M P
    ;

VARBINARY
    : V A R B I N A R Y
    ;

VARCHAR
    : V A R C H A R
    ;

VARYING
    : V A R Y I N G
    ;

WIDTH_BUCKET
    : W I D T H UL_ B U C K E T
    ;

WINDOW
    : W I N D O W
    ;

WITHIN
    : W I T H I N
    ;