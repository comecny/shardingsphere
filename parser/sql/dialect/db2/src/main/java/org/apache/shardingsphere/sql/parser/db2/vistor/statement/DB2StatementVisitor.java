package org.apache.shardingsphere.sql.parser.db2.vistor.statement;

import lombok.AccessLevel;
import lombok.Getter;
import org.apache.shardingsphere.sql.parser.api.ASTNode;
import org.apache.shardingsphere.sql.parser.autogen.Db2StatementBaseVisitor;

/**
 * Statement visitor for MySQL.
 */
@Getter(AccessLevel.PROTECTED)
public class DB2StatementVisitor extends Db2StatementBaseVisitor<ASTNode> {
}
