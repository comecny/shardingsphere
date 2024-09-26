package org.apache.shardingsphere.sql.parser.db2.vistor.statement;

import lombok.AccessLevel;
import lombok.Getter;
import org.apache.shardingsphere.sql.parser.api.ASTNode;
import org.apache.shardingsphere.sql.parser.autogen.Db2StatementBaseVisitor;
import org.apache.shardingsphere.sql.parser.autogen.Db2StatementParser;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.item.ProjectionsSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.generic.table.SimpleTableSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.generic.table.TableNameSegment;
import org.apache.shardingsphere.sql.parser.statement.db2.dml.Db2SelectStatement;

/**
 * Statement visitor for db2.
 */
@Getter(AccessLevel.PROTECTED)
public class Db2StatementVisitor extends Db2StatementBaseVisitor<ASTNode> {

    @Override
    public ASTNode visitSelectList(final Db2StatementParser.SelectListContext ctx) {
        Db2SelectStatement db2SelectStatement = new Db2SelectStatement();
        db2SelectStatement.setProjections(new ProjectionsSegment(ctx.start.getStartIndex(), ctx.stop.getStopIndex()));
        return db2SelectStatement;
    }

    @Override
    public ASTNode visitFromClause(final Db2StatementParser.FromClauseContext ctx) {
        Db2SelectStatement db2SelectStatement = new Db2SelectStatement();
        db2SelectStatement.setProjections(new ProjectionsSegment(ctx.start.getStartIndex(), ctx.stop.getStopIndex()));
        db2SelectStatement.setFrom(new SimpleTableSegment(
                new TableNameSegment(ctx.start.getStartIndex(), ctx.stop.getStopIndex(), null)));
        return db2SelectStatement;
    }

    @Override
    public ASTNode visitSelect(Db2StatementParser.SelectContext ctx) {
        return super.visitSelect(ctx);
    }
}
