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

grammar DMLStatement;

import BaseRule;

insert
    : INSERT INTO? tableName (insertValuesClause | insertSelectClause)
    ;

insertValuesClause
    : VALUES LP_ value (COMMA_ value)* RP_ (COMMA_ LP_ value (COMMA_ value)* RP_)*
    ;

literalValue
    : STRING_LITERAL
    | NUMERIC_LITERAL
    ;

value
  : literals
  ;

insertSelectClause
    : selectStatement
    ;

deleteStatement
    : DELETE FROM tableName (WHERE whereClause)? (CASCADE | RESTRICT)?
    ;

deleteWithSubquery
    : DELETE FROM LP_ subquery RP_ (WHERE whereClause)? (CASCADE | RESTRICT)?
    ;

delete
    : deleteStatement
    | deleteWithSubquery
    ;

condition
    : predicate
    | subqueryCondition
    | aggregateFunction operator value
    ;

predicate
    : columnName operator literals
    ;

whereClause
    : condition ( (AND | OR) condition)*
    ;

operator
    : DEQ_ | NEQ_ | LT_ | LTE_ | GT_ | GTE_
    ;

columnList
    : columnName (COMMA_ columnName)*
    ;

selectStatement
    : SELECT distinctSpecification?  selectList fromClause? (WHERE whereClause)? (GROUP BY groupByClause)? (HAVING havingClause)? (ORDER BY orderByClause)?
    ;

fromClause
    : FROM tableSource (AS aliasName)?
    ;

tableSource
    : tableName (joinClause)*
    | subquery
    ;

joinClause
    : (CROSS | INNER | LEFT | RIGHT | FULL)? JOIN tableName (ON condition | WHERE whereClause)?
    | (CROSS | INNER | LEFT | RIGHT | FULL)? JOIN LP_ subquery RP_ (ON condition | WHERE whereClause)?
    ;

groupByClause
    : columnName (COMMA_ columnName)*
    ;

havingClause
    : condition
    ;

subquery
    : LP_ selectStatement RP_ (AS aliasName)?
    ;

cet : ID_ AS LP_ selectStatement RP_
    ;

withOptions
    : WITH option (COMMA_ option)* selectStatement
    ;

selectList
    : ASTERISK_
    | selectItem (COMMA_ selectItem)*
    ;

distinctSpecification
    :  DISTINCT
    ;

selectItem
    : columnName (AS aliasName)?
    | rowNumberFunction
    | subqueryField
    ;

subqueryField
    : subquery
    ;

argumentList
    : literals (COMMA_ literals)*
    ;

option
    : cet
    ;

updateMode
    : FOR UPDATE OF columnName (COMMA_ columnName)*
    ;

orderList
    : orderItem (COMMA_ orderItem)*
    ;

orderItem
    : columnName (ASC | DESC)?
    ;

orderByClause
    : ORDER BY orderItem (COMMA_ orderItem)*
    ;

rowNumberFunction
    : ROW_NUMBER LP_ OVER LP_ partitionByClause? orderByClause? RP_ RP_ AS ID_
    ;

partitionByClause
    : PARTITION BY columnName (COMMA_ columnName)*
    ;

unionClause
    : (UNION | 'UNION ALL') selectStatement
    ;

subqueryCondition
    : columnName IN LP_ selectStatement RP_
    ;

aliasName
    : ID_
    ;

setAssignment
    : columnName EQ_ (value | subquery)
    ;

setAssignmentsClause
    : SET setAssignment (COMMA_ setAssignment)*
    ;

expression
    : literals
    | columnName
    ;

qualifiedShorthand
    : (identifier DOT_)? identifier DOT_ ASTERISK_
    ;

projection
    : columnName (AS? aliasName)? | qualifiedShorthand
    ;

projections
    : (unqualifiedShorthand | projection) (COMMA_ projection)*
    ;

unqualifiedShorthand
    : ASTERISK_
    ;

updateStatement
    : UPDATE tableName setAssignmentsClause  (WHERE whereClause)?
    ;

aggregateFunction
    : COUNT LP_ columnName RP_
    | SUM LP_ columnName RP_
    | AVG LP_ columnName RP_
    | MAX LP_ columnName RP_
    | MIN LP_ columnName RP_
    ;

update
    : updateStatement
    ;

select
    : selectStatement
    ;

truncateTable
    : truncationStatement
    ;