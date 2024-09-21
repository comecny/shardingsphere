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

lexer grammar Db2Keyword;

import Alphabet, Number;

WS
    : [ \t\r\n\u3000] + ->skip
    ;

ACTIVATE
    : A C T I V A T E
    ;

ADD
    : A D D
    ;

AFTER
    : A F T E R
    ;

ALIAS
    : A L I A S
    ;

ALL
    : A L L
    ;

ALLOCATE
    : A L L O C A T E
    ;

ALLOW
    : A L L O W
    ;

ALTER
    : A L T E R
    ;

AND
    : A N D
    ;

ANY
    : A N Y
    ;

AS
    : A S
    ;

ASENSITIVE
    : A S E N S I T I V E
    ;

ASSOCIATE
    : A S S O C I A T E
    ;

ASUTIME
    : A S U T I M E
    ;

AT
    : A T
    ;

ATTRIBUTES
    : A T T R I B U T E S
    ;

AUDIT
    : A U D I T
    ;

AUTHORIZATION
    : A U T H O R I Z A T I O N
    ;

AUX
    : A U X
    ;

AUXILIARY
    : A U X I L I A R Y
    ;

BEFORE
    : B E F O R E
    ;

BEGIN
    : B E G I N
    ;

BETWEEN
    : B E T W E E N
    ;

BINARY
    : B I N A R Y
    ;

BUFFERPOOL
    : B U F F E R P O O L
    ;

BY
    : B Y
    ;

CACHE
    : C A C H E
    ;

CALL
    : C A L L
    ;

CALLED
    : C A L L E D
    ;

CAPTURE
    : C A P T U R E
    ;

CARDINALITY
    : C A R D I N A L I T Y
    ;

CASCADED
    : C A S C A D E D
    ;

CASE
    : C A S E
    ;

CAST
    : C A S T
    ;

CCSID
    : C C S I D
    ;

CHAR
    : C H A R
    ;

CHARACTER
    : C H A R A C T E R
    ;

CHECK
    : C H E C K
    ;

CLONE
    : C L O N E
    ;

CLOSE
    : C L O S E
    ;

CLUSTER
    : C L U S T E R
    ;

COLLECTION
    : C O L L E C T I O N
    ;

COLLID
    : C O L L I D
    ;

COLUMN
    : C O L U M N
    ;

COMMENT
    : C O M M E N T
    ;

COMMIT
    : C O M M I T
    ;

CONCAT
    : C O N C A T
    ;

CONDITION
    : C O N D I T I O N
    ;

CONNECT
    : C O N N E C T
    ;

CONNECTION
    : C O N N E C T I O N
    ;

CONSTRAINT
    : C O N S T R A I N T
    ;

CONTAINS
    : C O N T A I N S
    ;

CONTINUE
    : C O N T I N U E
    ;

COUNT
    : C O U N T
    ;

COUNT_BIG
    : C O U N T UL_ B I G
    ;

CREATE
    : C R E A T E
    ;

CROSS
    : C R O S S
    ;

CURRENT
    : C U R R E N T
    ;

CURRENT_DATE
    : C U R R E N T UL_ D A T E
    ;

CURRENT_LC_CTYPE
    : C U R R E N T UL_ L C UL_ C T Y P E
    ;

CURRENT_PATH
    : C U R R E N T UL_ P A T H
    ;

CURRENT_SCHEMA
    : C U R R E N T UL_ S C H E M A
    ;

CURRENT_SERVER
    : C U R R E N T UL_ S E R V E R
    ;

CURRENT_TIME
    : C U R R E N T UL_ T I M E
    ;

CURRENT_TIMESTAMP
    : C U R R E N T UL_ T I M E S T A M P
    ;

CURRENT_TIMEZONE
    : C U R R E N T UL_ T I M E Z O N E
    ;

CURRENT_USER
    : C U R R E N T UL_ U S E R
    ;

CURSOR
    : C U R S O R
    ;

CYCLE
    : C Y C L E
    ;

DATA
    : D A T A
    ;

DATABASE
    : D A T A B A S E
    ;

DATAPARTITIONNAME
    : D A T A P A R T I T I O N N A M E
    ;

DATAPARTITIONNUM
    : D A T A P A R T I T I O N N U M
    ;

DATE
    : D A T E
    ;

DAY
    : D A Y
    ;

DAYS
    : D A Y S
    ;

DB2GENERAL
    : 'D' 'B2' 'G' 'E' 'N' 'E' 'R' 'A' 'L'
    ;

DB2GENRL
    : 'D' 'B2' 'G' 'E' 'N' 'R' 'L'
    ;

DB2SQL
    : 'D' 'B2' 'S' 'Q' 'L'
    ;

DBINFO
    : D B I N F O
    ;

DBPARTITIONNAME
    : D B P A R T I T I O N N A M E
    ;

DBPARTITIONNUM
    : D B P A R T I T I O N N U M
    ;

DEALLOCATE
    : D E A L L O C A T E
    ;

DECLARE
    : D E C L A R E
    ;

DEFAULT
    : D E F A U L T
    ;

DEFAULTS
    : D E F A U L T S
    ;

DEFINITION
    : D E F I N I T I O N
    ;

DELETE
    : D E L E T E
    ;

DENSERANK
    : D E N S E R A N K
    ;

DENSE_RANK
    : D E N S E UL_ R A N K
    ;

DESCRIBE
    : D E S C R I B E
    ;

DESCRIPTOR
    : D E S C R I P T O R
    ;

DETERMINISTIC
    : D E T E R M I N I S T I C
    ;

DIAGNOSTICS
    : D I A G N O S T I C S
    ;

DISABLE
    : D I S A B L E
    ;

DISALLOW
    : D I S A L L O W
    ;

DISCONNECT
    : D I S C O N N E C T
    ;

DISTINCT
    : D I S T I N C T
    ;

DO
    : D O
    ;

DOCUMENT
    : D O C U M E N T
    ;

DROP
    : D R O P
    ;

DSSIZE
    : D S S I Z E
    ;

EDITPROC
    : E D I T P R O C
    ;

ELSE
    : E L S E
    ;

ELSEIF
    : E L S E I F
    ;

ENABLE
    : E N A B L E
    ;

ENCODING
    : E N C O D I N G
    ;

ENCRYPTION
    : E N C R Y P T I O N
    ;

END
    : E N D
    ;

ENDING
    : E N D I N G
    ;

ENHANCED
    : E N H A N C E D
    ;

ESCAPE
    : E S C A P E
    ;

EXCEPT
    : E X C E P T
    ;

EXCLUSIVE
    : E X C L U S I V E
    ;

EXCLUDE
    : E X C L U D E
    ;

EXISTS
    : E X I S T S
    ;

EXIT
    : E X I T
    ;

EXPLAIN
    : E X P L A I N
    ;

EXTENDED
    : E X T E N D E D
    ;

EXTERNAL
    : E X T E R N A L
    ;

FENCED
    : F E N C E D
    ;

FIELDPROC
    : F I E L D P R O C
    ;

FINAL
    : F I N A L
    ;

FIRST1
    : 'F' 'I' 'R' 'S' 'T1'
    ;

FREE
    : F R E E
    ;

FROM
    : F R O M
    ;

FUNCTION
    : F U N C T I O N
    ;

FULL
    : F U L L
    ;

GENERATED
    : G E N E R A T E D
    ;

GENERAL
    : G E N E R A L
    ;

GET
    : G E T
    ;

GO
    : G O
    ;

GLOBAL
    : G L O B A L
    ;

GO_TO
    : G O UL_ T O
    ;

GRANT
    : G R A N T
    ;

GRAPHIC
    : G R A P H I C
    ;

GROUP
    : G R O U P
    ;

HANDLER
    : H A N D L E R
    ;

HASH
    : H A S H
    ;

HAVING
    : H A V I N G
    ;

HINT
    : H I N T
    ;

HOLD
    : H O L D
    ;

HOURS
    : H O U R S
    ;

IDENTITY
    : I D E N T I T Y
    ;

IF
    : I F
    ;

IMMEDIATE
    : I M M E D I A T E
    ;

IMPORT
    : I M P O R T
    ;

IN
    : I N
    ;

INCLUDING
    : I N C L U D I N G
    ;

INCLUSIVE
    : I N C L U S I V E
    ;

INDEX
    : I N D E X
    ;

INHERIT
    : I N H E R I T
    ;

INITIALLY
    : I N I T I A L L Y
    ;

INSERT
    : I N S E R T
    ;

INSENSITIVE
    : I N S E N S I T I V E
    ;

INTERSECT
    : I N T E R S E C T
    ;

INTO
    : I N T O
    ;

IS
    : I S
    ;

ISNULL
    : I S N U L L
    ;

ISOBID
    : I S O B I D
    ;

ISOLATION
    : I S O L A T I O N
    ;

ITERATE
    : I T E R A T E
    ;

JAR
    : J A R
    ;

JAVA
    : J A V A
    ;

JOIN
    : J O I N
    ;

KEEP
    : K E E P
    ;

KEY
    : K E Y
    ;

LABEL
    : L A B E L
    ;

LANGUAGE
    : L A N G U A G E
    ;

LAST3
    : 'L' 'A' 'S' 'T3'
    ;

LC_CTYPE
    : L C UL_ C T Y P E
    ;

LEAVE
    : L E A V E
    ;

LIMIT
    : L I M I T
    ;

LINKTYPE
    : L I N K T Y P E
    ;

LOCAL
    : L O C A L
    ;

LOCALDATE
    : L O C A L D A T E
    ;

LOCALTIMESTAMP
    : L O C A L T I M E S T A M P
    ;

LOOP
    : L O O P
    ;

MAINTAINED
    : M A I N T A I N E D
    ;

MAXVALUE
    : M A X V A L U E
    ;

MINUTE
    : M I N U T E
    ;

MINUTES
    : M I N U T E S
    ;

MODE
    : M O D E
    ;

MONTH
    : M O N T H
    ;

MONTHS
    : M O N T H S
    ;

NAN
    : N A N
    ;

NOCACHE
    : N O C A C H E
    ;

NOCYCLE
    : N O C Y C L E
    ;

NODENAME
    : N O D E N A M E
    ;

NODENUMBER
    : N O D E N U M B E R
    ;

NONE
    : N O N E
    ;

NORMALIZED
    : N O R M A L I Z E D
    ;

NOTNULL
    : N O T N U L L
    ;

NOT2
    : 'N' 'O' 'T2'
    ;

NULL
    : N U L L
    ;

NULLS
    : N U L L S
    ;

OBID
    : O B I D
    ;

OF
    : O F
    ;

OLD
    : O L D
    ;

OLD_TABLE
    : O L D UL_ T A B L E
    ;

ON
    : O N
    ;

OPTION
    : O P T I O N
    ;

OR
    : O R
    ;

ORDER
    : O R D E R
    ;

OUT
    : O U T
    ;

OUTER
    : O U T E R
    ;

OVER
    : O V E R
    ;

PACKAGE
    : P A C K A G E
    ;

PADDED
    : P A D D E D
    ;

PARAMETER
    : P A R A M E T E R
    ;

PART
    : P A R T
    ;

PARTITION
    : P A R T I T I O N
    ;

PARTITIONED
    : P A R T I T I O N E D
    ;

PARTITIONING
    : P A R T I T I O N I N G
    ;

PASSWORD
    : P A S S W O R D
    ;

PRECISION
    : P R E C I S I O N
    ;

PREPARE
    : P R E P A R E
    ;

PREVVAL
    : P R E V V A L
    ;

PRIMARY
    : P R I M A R Y
    ;

PRIQTY
    : P R I Q T Y
    ;

PROCEDURE
    : P R O C E D U R E
    ;

PROGRAM
    : P R O G R A M
    ;

PUBLIC
    : P U B L I C
    ;

QUERY
    : Q U E R Y
    ;

QUERYNO
    : Q U E R Y N O
    ;

RANGE
    : R A N G E
    ;

RANK
    : R A N K
    ;

READ
    : R E A D
    ;

READS
    : R E A D S
    ;

RECURSIVE
    : R E C U R S I V E
    ;

REFERENCES
    : R E F E R E N C E S
    ;

REFRESH
    : R E F R E S H
    ;

RELEASE
    : R E L E A S E
    ;

RENAME
    : R E N A M E
    ;

RESTRICT
    : R E S T R I C T
    ;

RESULT
    : R E S U L T
    ;

RESULT_SET_LOCATOR
    : R E S U L T UL_ S E T UL_ L O C A T O R
    ;

REVOKE
    : R E V O K E
    ;

RIGHT
    : R I G H T
    ;

ROLE
    : R O L E
    ;

ROLLBACK
    : R O L L B A C K
    ;

RUN
    : R U N
    ;

SAVEPOINT
    : S A V E P O I N T
    ;

SCHEMA
    : S C H E M A
    ;

SCRATCHPAD
    : S C R A T C H P A D
    ;

SEARCH
    : S E A R C H
    ;

SECOND
    : S E C O N D
    ;

SECONDS
    : S E C O N D S
    ;

SECQTY
    : S E C Q T Y
    ;

SECURITY
    : S E C U R I T Y
    ;

SELECT
    : S E L E C T
    ;

SESSION
    : S E S S I O N
    ;

SESSION_USER
    : S E S S I O N UL_ U S E R
    ;

SET
    : S E T
    ;

SIGNAL
    : S I G N A L
    ;

SIMPLE
    : S I M P L E
    ;

SOURCE
    : S O U R C E
    ;

SPECIFIC
    : S P E C I F I C
    ;

SQL
    : S Q L
    ;

SQLID
    : S Q L I D
    ;

STACKED
    : S T A C K E D
    ;

STANDARD
    : S T A N D A R D
    ;

START
    : S T A R T
    ;

STARTING
    : S T A R T I N G
    ;

STATEMENT
    : S T A T E M E N T
    ;

STATIC
    : S T A T I C
    ;

STAY
    : S T A Y
    ;

STOGROUP
    : S T O G R O U P
    ;

STORES
    : S T O R E S
    ;

STYLE
    : S T Y L E
    ;

SUBSTRING
    : S U B S T R I N G
    ;

SUMMARY
    : S U M M A R Y
    ;

SYNONYM
    : S Y N O N Y M
    ;

SYSFUN
    : S Y S F U N
    ;

SYSIBM
    : S Y S I B M
    ;

SYSPROC
    : S Y S P R O C
    ;

SYSTEM
    : S Y S T E M
    ;

SYSTEM_USER
    : S Y S T E M UL_ U S E R
    ;

TABLE
    : T A B L E
    ;

TABLESPACE
    : T A B L E S P A C E
    ;

TIME
    : T I M E
    ;

TIMESTAMP
    : T I M E S T A M P
    ;

TO
    : T O
    ;

TRANSACTION
    : T R A N S A C T I O N
    ;

TRIGGER
    : T R I G G E R
    ;

TRIM
    : T R I M
    ;

TRUNCATE
    : T R U N C A T E
    ;

TYPE
    : T Y P E
    ;

UNDO
    : U N D O
    ;

UNION
    : U N I O N
    ;

UNIQUE
    : U N I Q U E
    ;

UNTIL
    : U N T I L
    ;

UPDATE
    : U P D A T E
    ;

USAGE
    : U S A G E
    ;

USER
    : U S E R
    ;

USING
    : U S I N G
    ;

VALIDPROC
    : V A L I D P R O C
    ;

VALUE
    : V A L U E
    ;

VALUES
    : V A L U E S
    ;

VARIABLE
    : V A R I A B L E
    ;

VARIANT
    : V A R I A N T
    ;

VCAT
    : V C A T
    ;

VIEW
    : V I E W
    ;

VOLATILE
    : V O L A T I L E
    ;

VOLUMES
    : V O L U M E S
    ;

WHEN
    : W H E N
    ;

WHENEVER
    : W H E N E V E R
    ;

WHERE
    : W H E R E
    ;

WHILE
    : W H I L E
    ;

WITH
    : W I T H
    ;

WITHOUT
    : W I T H O U T
    ;
