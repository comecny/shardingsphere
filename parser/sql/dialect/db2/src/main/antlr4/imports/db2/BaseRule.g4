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

grammar BaseRule;

import Symbol, Keyword, Db2Keyword, Literals;

parameterMarker
    : QUESTION_
    ;

literals
    : stringLiterals
    | numberLiterals
    | hexadecimalLiterals
    | bitValueLiterals
    | booleanLiterals
    | nullValueLiterals
    | intervalLiterals
    | bindLiterals
    ;

STRING_
    : DOUBLE_QUOTED_TEXT | SINGLE_QUOTED_TEXT
    ;

stringLiterals
    : STRING_
     ;

numberLiterals
    : (PLUS_ | MINUS_)? NUMBER_
    ;

hexadecimalLiterals
    : HEX_DIGIT_
    ;

booleanLiterals
    : TRUE | FALSE
    ;

nullValueLiterals
    : NULL
    ;

bitValueLiterals
    : BIT_NUM_
    ;

intervalLiterals
    : INTERVAL_LITERAL_
    ;

bindLiterals
    : QUESTION_ | IDENTIFIER_
    ;

identifier
    : IDENTIFIER_
    | reservedWord
    | DOUBLE_QUOTED_TEXT
    ;

reservedWord
    : identifierKeyword
    | capacityUnit
    | timeUnit
    ;

identifierKeyword
    : ACTIVATE | ADD | AFTER | ALIAS | ALL | ALLOCATE | ALLOW | ALTER | AND | ANY
      | AS | ASENSITIVE | ASSOCIATE | ASUTIME | AT | ATTRIBUTES | AUDIT | AUTHORIZATION
      | AUX | AUXILIARY | BEFORE | BEGIN | BETWEEN | BINARY | BUFFERPOOL | BY | CACHE
      | CALL | CALLED | CAPTURE | CARDINALITY | CASCADED | CASE | CAST | CCSID
      | CHAR | CHARACTER | CHECK | CLONE | CLOSE | CLUSTER | COLLECTION | COLLID
      | COLUMN | COMMENT | COMMIT | CONCAT | CONDITION | CONNECT | CONNECTION
      | CONSTRAINT | CONTAINS | CONTINUE | COUNT | COUNT_BIG | CREATE | CROSS | CURRENT
      | CURRENT_DATE | CURRENT_LC_CTYPE | CURRENT_PATH | CURRENT_SCHEMA | CURRENT_SERVER
      | CURRENT_TIME | CURRENT_TIMESTAMP | CURRENT_TIMEZONE | CURRENT_USER | CURSOR
      | CYCLE | DATA | DATABASE | DATAPARTITIONNAME | DATAPARTITIONNUM | DATE
      | DAY | DAYS | DB2GENERAL | DB2GENRL | DB2SQL | DBINFO | DBPARTITIONNAME
      | DBPARTITIONNUM | DEALLOCATE | DECLARE | DEFAULT | DEFAULTS | DEFINITION | DELETE
      | DENSERANK | DENSE_RANK | DESCRIBE | DESCRIPTOR | DETERMINISTIC | DIAGNOSTICS
      | DISABLE | DISALLOW | DISCONNECT | DISTINCT | DO | DOCUMENT | DOUBLE | DROP
      | DSSIZE | DYNAMIC | EACH | EDITPROC | ENABLE | ENCODING | ENCRYPTION | END
      | END-EXEC | ENDING | ERASE | ESCAPE | EVERY | EXCEPT | EXCEPTION | EXCLUDING
      | EXECUTE | EXISTS | EXIT | EXP | EXPLAIN | EXTENDED | EXTERNAL | FIELDPROC
      | FINAL | FIRST1 | FOR | FOREIGN | FREE | FROM | FULL | FUNCTION | GENERAL
      | GENERATED | GET | GLOBAL | GO | GOTO | GRANT | GRAPHIC | GROUP | HANDLER
      | HASH | HASHED_VALUE | HAVING | HINT | HOLD | HOUR | HOURS | IF | IMMEDIATE
      | IMPORT | IN | INCLUDING | INCLUSIVE | INDEX | INDICATOR | INDICATORS | INHERIT
      | INNER | INSERT | INSENSITIVE | INTERSECT | INTO | IS | ISNULL | ISOBID
      | ISOLATION | ITERATE | JAR | JAVA | JOIN | KEEP | KEY | LABEL | LANGUAGE
      | LC_CTYPE | LEAVE | LIMIT | LINKTYPE | LOCAL | LOCALDATE | LOCALTIMESTAMP
      | LOCK | LOCKMAX | LOCKSIZE | LOOP | MAINTAINED | MAXVALUE | MATERIALIZED
      | MEMBER | MICROSECOND | MICROSECONDS | MINUTE | MINUTES | MINVALUE | MODE
      | MONTH | MONTHS | NAN | NOCACHE | NOCYCLE | NODENAME | NODENUMBER | NOMAXVALUE
      | NOMINVALUE | NONE | NORMALIZED | NOT2 | NOTNULL | NULL | NULLS | OBID
      | OF | OLD | OLD_TABLE | ON | ONLY | OPTION | OR | ORDER | OUT | OUTER
      | OVER | OVERLAPS | OVERRIDING | PACKAGE | PADDED | PARAMETER | PART
      | PARTITION | PARTITIONED | PARTITIONING | PARTITIONS | PASSWORD | PERCENT
      | PERCENT_RANK | PERCENTILE_CONT | PERCENTILE_DISC | POSITION | PRECISION
      | PREPARE | PREVVAL | PRIMARY | PRIQTY | PRIVILEGES | PROGRAM | PSID
      | PUBLIC | QUERY | QUERYNO | RANGE | RANK | READ | READS | RECURSIVE | REF
      | REFERENCES | REFERENCING | REFRESH | RELEASE | RENAME | RESTRICT | RESULT
      | RESULT_SET_LOCATOR | REVOKE | RIGHT | ROLE | ROLLBACK | RUN | SAVEPOINT
      | SCHEMA | SCRATCHPAD | SEARCH | SECOND | SECONDS | SECQTY | SECURITY
      | SELECT | SESSION | SESSION_USER | SET | SIGNAL | SIMPLE | SOURCE | SPECIFIC
      | SQL | SQLID | STACKED | STANDARD | START | STARTING | STATEMENT | STATIC
      | STAY | STOGROUP | STORES | STYLE | SUBSTRING | SUMMARY | SYNONYM | SYSFUN
      | SYSIBM | SYSPROC | SYSTEM | SYSTEM_USER | TABLE | TABLESPACE | TIME
      | TIMESTAMP | TO | TRANSACTION | TRIGGER | TRIM | TRUNCATE | TYPE | UNDO
      | UNION | UNIQUE | UNTIL | UPDATE | USAGE | USER | USING | VALIDPROC
      | VALUE | VALUES | VARIABLE | VARIANT | VCAT | VIEW | VOLATILE | VOLUMES
      | WHEN | WHENEVER | WHERE | WHILE | WITH | WITHOUT
    ;

capacityUnit
    : ('K' | 'M' | 'G' | 'T' | 'P' | 'E' | 'k' | 'm' | 'g' | 't' | 'p' | 'e')
    ;

timeUnit
    : 'M' | 'H' | 'm' | 'h'
    ;

schemaName
    : identifier
    ;

owner
    : identifier
    ;

profileName
    : identifier
    ;

rollbackSegmentName
    : identifier
    ;

constraintName
    : identifier
    ;

contextName
    : identifier
    ;

savepointName
    : identifier
    ;

synonymName
    : identifier
    ;

owner
    : identifier
    ;

name
    : identifier
    ;

tablespaceName
    : identifier
    ;

newTablespaceName
    : identifier
    ;

subprogramName
    : identifier
    ;

methodName
    : identifier
    ;

tablespaceSetName
    : identifier
    ;

serviceName
    : identifier
    ;

ilmPolicyName
    : identifier
    ;

policyName
    : identifier
    ;

connectionQualifier
    : identifier
    ;

functionName
    : identifier
    ;

cursorName
    : identifier
    ;

tableName
    : (owner DOT_)? name
    ;

viewName
    : (owner DOT_)? name
    ;

triggerName
    : (owner DOT_)? name
    ;

materializedViewName
    : (owner DOT_)? name
    ;

columnName
    : (owner? DOT_)? name (DOT_ nestedItem)*
    ;

objectName
    : (owner DOT_)? name
    ;

clusterName
    : (owner DOT_)? name
    ;

indexName
    : (owner DOT_)? name
    ;

statisticsTypeName
    : (owner DOT_)? name
    ;

function
    : (owner DOT_)? name
    ;

packageName
    : (owner DOT_)? name
    ;

typeName
    : (owner DOT_)? name
    ;

indexTypeName
    : (owner DOT_)? name
    ;

modelName
    : (owner DOT_)? name
    ;

operatorName
    : (owner DOT_)? name
    ;

dimensionName
    : (owner DOT_)? name
    ;

directoryName
    : (owner DOT_)? name
    ;

constraintName
    : identifier
    ;

featureId
    : numberLiterals
    ;

elementName
    : identifier
    ;

roleName
    : identifier
    ;

username
    : identifier | STRING_
    ;

password
    : identifier | STRING_
    ;

andOperator
    : AND | AND_
    ;

orOperator
    : OR | OR_
    ;

notOperator
    : NOT | NOT_
    ;

dataTypeName
    : CHARACTER | CHAR | NCHAR | RAW | VARCHAR | VARCHAR2 | NVARCHAR2 | LONG | LONG RAW | BLOB | CLOB | NCLOB | BINARY_FLOAT | BINARY_DOUBLE
    | BOOLEAN | PLS_INTEGER | BINARY_INTEGER | INTEGER | NUMBER | NATURAL | NATURALN | POSITIVE | POSITIVEN | SIGNTYPE
    | SIMPLE_INTEGER | BFILE | MLSLABEL | UROWID | DATE | TIMESTAMP | TIMESTAMP WITH TIME ZONE | TIMESTAMP WITH LOCAL TIME ZONE
    | INTERVAL DAY TO SECOND | INTERVAL YEAR TO MONTH | JSON | FLOAT | REAL | DOUBLE PRECISION | INT | SMALLINT
    | DECIMAL | NUMERIC | DEC | IDENTIFIER_ | XMLTYPE | ROWID | ANYDATA | ANYTYPE | ANYDATASET
    ;