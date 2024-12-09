package org.apache.shardingsphere.sql.parser.db2.vistor.statement;

import lombok.AccessLevel;
import lombok.Getter;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.shardingsphere.infra.database.core.metadata.database.enums.NullsOrderType;
import org.apache.shardingsphere.sql.parser.api.ASTNode;
import org.apache.shardingsphere.sql.parser.autogen.Db2StatementBaseVisitor;
import org.apache.shardingsphere.sql.parser.autogen.Db2StatementParser;
import org.apache.shardingsphere.sql.parser.statement.core.enums.OrderDirection;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.column.ColumnSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.expr.ListExpression;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.expr.complex.CommonExpressionSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.expr.subquery.SubqueryExpressionSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.expr.subquery.SubquerySegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.item.*;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.order.GroupBySegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.order.OrderBySegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.order.item.ColumnOrderByItemSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.order.item.OrderByItemSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.pagination.rownum.NumberLiteralRowNumberValueSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.pagination.top.TopProjectionSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.predicate.HavingSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.predicate.WhereSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.generic.AliasSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.generic.table.*;
import org.apache.shardingsphere.sql.parser.statement.core.statement.dml.DeleteStatement;
import org.apache.shardingsphere.sql.parser.statement.core.value.identifier.IdentifierValue;
import org.apache.shardingsphere.sql.parser.statement.db2.ddl.Db2TruncateStatement;
import org.apache.shardingsphere.sql.parser.statement.db2.dml.Db2DeleteStatement;
import org.apache.shardingsphere.sql.parser.statement.db2.dml.Db2SelectStatement;

import java.util.LinkedList;
import java.util.List;

/**
 * Statement visitor for db2.
 */
@Getter(AccessLevel.PROTECTED)
public class Db2StatementVisitor extends Db2StatementBaseVisitor<ASTNode> {

    @Override
    public ASTNode visitExecute(Db2StatementParser.ExecuteContext ctx) {
        return super.visitExecute(ctx);
    }

    @Override
    public ASTNode visitInsert(Db2StatementParser.InsertContext ctx) {
        return super.visitInsert(ctx);
    }

    @Override
    public ASTNode visitInsertValuesClause(Db2StatementParser.InsertValuesClauseContext ctx) {
        return super.visitInsertValuesClause(ctx);
    }

    @Override
    public ASTNode visitLiteralValue(Db2StatementParser.LiteralValueContext ctx) {
        if ( null != ctx.NUMERIC_LITERAL()) {
            return visit(ctx.NUMERIC_LITERAL());
        }
        if (null != ctx.STRING_LITERAL()) {
            return visit(ctx.STRING_LITERAL());
        }
        throw new IllegalStateException("Literals must have string, number or null.");
    }

    @Override
    public ASTNode visitValue(Db2StatementParser.ValueContext ctx) {
        return super.visitValue(ctx);
    }

    @Override
    public ASTNode visitInsertSelectClause(Db2StatementParser.InsertSelectClauseContext ctx) {
        return super.visitInsertSelectClause(ctx);
    }

    @Override
    public ASTNode visitDeleteStatement(Db2StatementParser.DeleteStatementContext ctx) {
        Db2DeleteStatement db2DeleteStatement = new Db2DeleteStatement();
        db2DeleteStatement.setTable(new SimpleTableSegment(new TableNameSegment(ctx.tableName().start.getStartIndex(), ctx.tableName().stop.getStopIndex(), new IdentifierValue(ctx.tableName().getText()))));
        db2DeleteStatement.setWhere((WhereSegment) visit(ctx.whereClause()));
        return db2DeleteStatement;
    }

    @Override
    public ASTNode visitDeleteWithSubquery(Db2StatementParser.DeleteWithSubqueryContext ctx) {
        return super.visitDeleteWithSubquery(ctx);
    }

    @Override
    public ASTNode visitDelete(Db2StatementParser.DeleteContext ctx) {
        Db2StatementParser.DeleteStatementContext deleteStatementContext = ctx.deleteStatement();
        if (null != deleteStatementContext) {
            return visit(deleteStatementContext);
        }

        DeleteMultiTableSegment deleteMultiTableSegment = new DeleteMultiTableSegment();
        return  null;
    }

    @Override
    public ASTNode visitCondition(Db2StatementParser.ConditionContext ctx) {
        return super.visitCondition(ctx);
    }

    @Override
    public ASTNode visitWhereClause(Db2StatementParser.WhereClauseContext ctx) {
        ListExpression listExpression = new ListExpression(ctx.start.getStartIndex(), ctx.stop.getStopIndex());
        for (Db2StatementParser.ConditionContext conditionContext : ctx.condition()) {
            if (null != conditionContext.predicate()){
                CommonExpressionSegment commonExpressionSegment = (CommonExpressionSegment) visit(conditionContext.predicate());
                listExpression.getItems().add(commonExpressionSegment);
            }
           else if (null != conditionContext.subqueryCondition()){
                SubqueryExpressionSegment subqueryExpressionSegment = new SubqueryExpressionSegment( (SubquerySegment) visit(conditionContext.subqueryCondition()));
                listExpression.getItems().add(subqueryExpressionSegment);
           }
          else  if (null != conditionContext.aggregateFunction()){
                AggregationProjectionSegment aggregationProjectionSegment = (AggregationProjectionSegment) visit(conditionContext.aggregateFunction());
                listExpression.getItems().add(aggregationProjectionSegment);
           }
        }
        return new WhereSegment(ctx.start.getStartIndex(), ctx.stop.getStopIndex(), listExpression);
    }

    @Override
    public ASTNode visitPredicate(Db2StatementParser.PredicateContext ctx) {
        return   new CommonExpressionSegment(ctx.start.getStartIndex(), ctx.stop.getStopIndex(), ctx.getText());
    }

    @Override
    public ASTNode visitOperator(Db2StatementParser.OperatorContext ctx) {
        return super.visitOperator(ctx);
    }

    @Override
    public ASTNode visitColumnList(Db2StatementParser.ColumnListContext ctx) {
        return super.visitColumnList(ctx);
    }

    @Override
    public ASTNode visitTruncationOption(Db2StatementParser.TruncationOptionContext ctx) {
        return super.visitTruncationOption(ctx);
    }

    @Override
    public ASTNode visitTruncationStatement(Db2StatementParser.TruncationStatementContext ctx) {
        Db2TruncateStatement db2TruncateStatement = new Db2TruncateStatement();
        Db2StatementParser.TableNameContext tableNameContext = ctx.tableName();
        TableNameSegment tableNameSegment = new TableNameSegment(
                tableNameContext.start.getStartIndex(),
                tableNameContext.stop.getStopIndex(),
                new IdentifierValue(ctx.tableName().getText())
        );
        db2TruncateStatement.getTables().add(new SimpleTableSegment(tableNameSegment));
        return db2TruncateStatement;
    }

    @Override
    public ASTNode visitTruncation(Db2StatementParser.TruncationContext ctx) {
        return  visit(ctx.truncationStatement());
    }

    @Override
    public ASTNode visitSelect(Db2StatementParser.SelectContext ctx) {
        return visit(ctx.selectStatement());
    }

    @Override
    public ASTNode visitSelectList(Db2StatementParser.SelectListContext ctx) {
        ProjectionsSegment projectionsSegment = new ProjectionsSegment(ctx.start.getStartIndex(), ctx.stop.getStopIndex());
        List<ProjectionSegment> results = new LinkedList<>();
        for (Db2StatementParser.SelectItemContext selectItemContext : ctx.selectItem()) {
            Db2StatementParser.ColumnNameContext columnNameContext = selectItemContext.columnName();
            if (null != columnNameContext){
                ColumnSegment columnSegment = (ColumnSegment) visit(selectItemContext);
                ColumnProjectionSegment columnProjectionSegment = new ColumnProjectionSegment(
                        columnSegment
                );
                results.add(columnProjectionSegment);
            }
            if (null != selectItemContext.rowNumberFunction()){
                NumberLiteralRowNumberValueSegment numberLiteralRowNumberValueSegment = (NumberLiteralRowNumberValueSegment) visit(selectItemContext.rowNumberFunction());
                String rowNumberAliasName = selectItemContext.rowNumberFunction().ID_().getText();
                TopProjectionSegment topProjectionSegment = new TopProjectionSegment(
                        numberLiteralRowNumberValueSegment.getStartIndex(),
                        numberLiteralRowNumberValueSegment.getStopIndex(),
                        numberLiteralRowNumberValueSegment,rowNumberAliasName
                );
                results.add(topProjectionSegment);
            }
            if (null != selectItemContext.subqueryField()){
                SubquerySegment subquerySegment = (SubquerySegment) visit(selectItemContext.subqueryField());
                SubqueryProjectionSegment subqueryProjectionSegment = new SubqueryProjectionSegment(subquerySegment,subquerySegment.getText());
                results.add(subqueryProjectionSegment);
            }
        }
        projectionsSegment.getProjections().addAll(results);
        return projectionsSegment;
    }

    @Override
    public ASTNode visitSelectItem(Db2StatementParser.SelectItemContext ctx) {
        return super.visitSelectItem(ctx);
    }

    @Override
    public ASTNode visitSelectStatement(Db2StatementParser.SelectStatementContext ctx) {
        Db2SelectStatement db2SelectStatement = new Db2SelectStatement();
        ProjectionsSegment projectionsSegment = (ProjectionsSegment) visit(ctx.selectList());
        if (null != ctx.distinctSpecification()) {
            projectionsSegment.setDistinctRow(true);
        }
        TableSegment tableSegment = (TableSegment) visit(ctx.fromClause());
        db2SelectStatement.setFrom(tableSegment);
        Db2StatementParser.WhereClauseContext whereClauseContext = ctx.whereClause();
        if (null != whereClauseContext) {
            WhereSegment whereSegment = (WhereSegment) visit(whereClauseContext);
            db2SelectStatement.setWhere(whereSegment);
        }
        Db2StatementParser.GroupByClauseContext groupByClauseContext = ctx.groupByClause();
        if (null != groupByClauseContext){
            GroupBySegment groupBySegment = (GroupBySegment) visit(groupByClauseContext);
            db2SelectStatement.setGroupBy(groupBySegment);
        }
        Db2StatementParser.HavingClauseContext havingClauseContext = ctx.havingClause();
        if (null != havingClauseContext){
            if (!db2SelectStatement.getGroupBy().isPresent()){
                throw new IllegalStateException("Having clause must have group by clause.");
            }
            db2SelectStatement.setHaving((HavingSegment) visit(havingClauseContext));
        }
        Db2StatementParser.OrderByClauseContext orderByClauseContext = ctx.orderByClause();
        if (null != orderByClauseContext){
            db2SelectStatement.setOrderBy((OrderBySegment) visit(orderByClauseContext));
        }
        db2SelectStatement.setProjections(projectionsSegment);
        return db2SelectStatement;
    }

    @Override
    public ASTNode visitFromClause(Db2StatementParser.FromClauseContext ctx) {
        return  visit(ctx.tableSource());
    }

    @Override
    public ASTNode visitTableSource(Db2StatementParser.TableSourceContext ctx) {
        SimpleTableSegment simpleTableSegment = null;
        if (null != ctx.tableName()){
            simpleTableSegment = new SimpleTableSegment(new TableNameSegment(ctx.tableName().start.getStartIndex(), ctx.tableName().stop.getStopIndex(), new IdentifierValue(ctx.tableName().getText())));
        }
        if (null == ctx.joinClause()) {
            return simpleTableSegment;
        }
        if (null != ctx.joinClause()) {
            // TODO: 2024/10/13
            JoinTableSegment joinTableSegment = new JoinTableSegment();
            joinTableSegment.setLeft(simpleTableSegment);
            List<Db2StatementParser.JoinClauseContext> joinClauseContexts = ctx.joinClause();
            for (Db2StatementParser.JoinClauseContext joinClauseContext : joinClauseContexts) {
                 joinTableSegment = (JoinTableSegment) visit(joinClauseContext);
            }
            return joinTableSegment;
        }
        if (null != ctx.subquery()) {
            SubquerySegment subquerySegment = (SubquerySegment) visit(ctx.subquery());
            return new SubqueryTableSegment(subquerySegment.getStartIndex(),subquerySegment.getStopIndex(),subquerySegment);
        }
        throw new IllegalStateException("Table source must have table name or subquery or join clause.");
    }

    @Override
    public ASTNode visitJoinClause(Db2StatementParser.JoinClauseContext ctx) {
        return super.visitJoinClause(ctx);
    }

    @Override
    public ASTNode visitGroupByClause(Db2StatementParser.GroupByClauseContext ctx) {
        List<OrderByItemSegment> orderByItemSegmentList = new LinkedList<>();
        for (Db2StatementParser.ColumnNameContext columnNameContext : ctx.columnName()) {
            ColumnOrderByItemSegment columnOrderByItemSegment = new ColumnOrderByItemSegment(new ColumnSegment(
                    columnNameContext.start.getStartIndex(),
                    columnNameContext.stop.getStopIndex(),
                    new IdentifierValue(columnNameContext.getText())
            ), null, null);
            orderByItemSegmentList.add(columnOrderByItemSegment);
        }
        return new GroupBySegment(ctx.start.getStartIndex(), ctx.stop.getStopIndex(), orderByItemSegmentList);
    }

    @Override
    public ASTNode visitHavingClause(Db2StatementParser.HavingClauseContext ctx) {
        Db2StatementParser.ConditionContext condition = ctx.condition();
        ASTNode visit = visit(condition);
        if (visit instanceof  CommonExpressionSegment){
            CommonExpressionSegment commonExpressionSegment = (CommonExpressionSegment) visit;
            return new HavingSegment(commonExpressionSegment.getStartIndex(),commonExpressionSegment.getStopIndex(),commonExpressionSegment);
        }
        if (visit instanceof SubquerySegment){
            SubquerySegment subquerySegment = (SubquerySegment) visit;
            return new HavingSegment(subquerySegment.getStartIndex(),subquerySegment.getStopIndex(),subquerySegment);
        }
        if (visit instanceof  AggregationProjectionSegment){
            AggregationProjectionSegment aggregationProjectionSegment = (AggregationProjectionSegment) visit;
            return new HavingSegment(aggregationProjectionSegment.getStartIndex(),aggregationProjectionSegment.getStopIndex(),aggregationProjectionSegment);
        }
        throw new IllegalStateException("Having clause must have condition or subquery or aggregation function.");
    }

    @Override
    public ASTNode visitSubquery(Db2StatementParser.SubqueryContext ctx) {
        Db2SelectStatement db2SelectStatement = (Db2SelectStatement) visit(ctx.selectStatement());
        if (null == ctx.aliasName()){
           ctx.selectStatement().getText();
        }
        return new SubquerySegment(ctx.start.getStartIndex(), ctx.stop.getStopIndex(), db2SelectStatement, ctx.aliasName() == null ? ctx.getText() : ctx.aliasName().getText());
    }

    @Override
    public ASTNode visitCet(Db2StatementParser.CetContext ctx) {
        return super.visitCet(ctx);
    }

    @Override
    public ASTNode visitWithOptions(Db2StatementParser.WithOptionsContext ctx) {
        return super.visitWithOptions(ctx);
    }

    @Override
    public ASTNode visitSubqueryField(Db2StatementParser.SubqueryFieldContext ctx) {
        return  visit(ctx.subquery());
    }

    @Override
    public ASTNode visitArgumentList(Db2StatementParser.ArgumentListContext ctx) {
        return super.visitArgumentList(ctx);
    }

    @Override
    public ASTNode visitOption(Db2StatementParser.OptionContext ctx) {
        return super.visitOption(ctx);
    }

    @Override
    public ASTNode visitUpdateMode(Db2StatementParser.UpdateModeContext ctx) {
        return super.visitUpdateMode(ctx);
    }

    @Override
    public ASTNode visitOrderList(Db2StatementParser.OrderListContext ctx) {
        return super.visitOrderList(ctx);
    }

    @Override
    public ASTNode visitOrderItem(Db2StatementParser.OrderItemContext ctx) {
        return super.visitOrderItem(ctx);
    }

    @Override
    public ASTNode visitOrderByClause(Db2StatementParser.OrderByClauseContext ctx) {
        List<OrderByItemSegment>  orderByItemSegmentList = new LinkedList<>();
        for (Db2StatementParser.OrderItemContext orderItemContext : ctx.orderItem()) {
            OrderDirection orderDirection;
            if (null != orderItemContext.ASC()){
                orderDirection = OrderDirection.ASC;
            }
            else {
                orderDirection = OrderDirection.DESC;
            }
            ColumnSegment  columnSegment = (ColumnSegment) visit(orderItemContext.columnName());
            ColumnOrderByItemSegment columnOrderByItemSegment = new ColumnOrderByItemSegment(columnSegment, orderDirection, NullsOrderType.valueOf(orderDirection.name()));
            orderByItemSegmentList.add(columnOrderByItemSegment);
        }
        return new OrderBySegment(ctx.start.getStartIndex(),ctx.stop.getStopIndex(),orderByItemSegmentList);
    }

    @Override
    public ASTNode visitRowNumberFunction(Db2StatementParser.RowNumberFunctionContext ctx) {
        Long l = (long) ctx.getText().length();
        return  new NumberLiteralRowNumberValueSegment(ctx.getStart().getStartIndex(), ctx.getStop().getStopIndex(), (long) ctx.getText().length(), true);
    }

    @Override
    public ASTNode visitPartitionByClause(Db2StatementParser.PartitionByClauseContext ctx) {
        return super.visitPartitionByClause(ctx);
    }

    @Override
    public ASTNode visitUnionClause(Db2StatementParser.UnionClauseContext ctx) {
        return super.visitUnionClause(ctx);
    }

    @Override
    public ASTNode visitSubqueryCondition(Db2StatementParser.SubqueryConditionContext ctx) {
        return visit(ctx.selectStatement());
    }

    @Override
    public ASTNode visitAliasName(Db2StatementParser.AliasNameContext ctx) {
        return new AliasSegment(ctx.start.getStartIndex(), ctx.stop.getStopIndex(), new IdentifierValue(ctx.getText()));
    }

    @Override
    public ASTNode visitSetAssignment(Db2StatementParser.SetAssignmentContext ctx) {
        return super.visitSetAssignment(ctx);
    }

    @Override
    public ASTNode visitSetAssignmentsClause(Db2StatementParser.SetAssignmentsClauseContext ctx) {
        return super.visitSetAssignmentsClause(ctx);
    }

    @Override
    public ASTNode visitExpression(Db2StatementParser.ExpressionContext ctx) {
        return super.visitExpression(ctx);
    }

    @Override
    public ASTNode visitUpdateStatement(Db2StatementParser.UpdateStatementContext ctx) {
        return super.visitUpdateStatement(ctx);
    }

    @Override
    public ASTNode visitAggregateFunction(Db2StatementParser.AggregateFunctionContext ctx) {
        return super.visitAggregateFunction(ctx);
    }

    @Override
    public ASTNode visitUpdate(Db2StatementParser.UpdateContext ctx) {
        return super.visitUpdate(ctx);
    }

    @Override
    public ASTNode visitTruncateTable(Db2StatementParser.TruncateTableContext ctx) {
        return super.visitTruncateTable(ctx);
    }

    @Override
    public ASTNode visitParameterMarker(Db2StatementParser.ParameterMarkerContext ctx) {
        return super.visitParameterMarker(ctx);
    }

    @Override
    public ASTNode visitLiterals(Db2StatementParser.LiteralsContext ctx) {
        return super.visitLiterals(ctx);
    }

    @Override
    public ASTNode visitStringLiterals(Db2StatementParser.StringLiteralsContext ctx) {
        return super.visitStringLiterals(ctx);
    }

    @Override
    public ASTNode visitNumberLiterals(Db2StatementParser.NumberLiteralsContext ctx) {
        return super.visitNumberLiterals(ctx);
    }

    @Override
    public ASTNode visitHexadecimalLiterals(Db2StatementParser.HexadecimalLiteralsContext ctx) {
        return super.visitHexadecimalLiterals(ctx);
    }

    @Override
    public ASTNode visitBooleanLiterals(Db2StatementParser.BooleanLiteralsContext ctx) {
        return super.visitBooleanLiterals(ctx);
    }

    @Override
    public ASTNode visitNullValueLiterals(Db2StatementParser.NullValueLiteralsContext ctx) {
        return super.visitNullValueLiterals(ctx);
    }

    @Override
    public ASTNode visitBitValueLiterals(Db2StatementParser.BitValueLiteralsContext ctx) {
        return super.visitBitValueLiterals(ctx);
    }

    @Override
    public ASTNode visitIntervalLiterals(Db2StatementParser.IntervalLiteralsContext ctx) {
        return super.visitIntervalLiterals(ctx);
    }

    @Override
    public ASTNode visitBindLiterals(Db2StatementParser.BindLiteralsContext ctx) {
        return super.visitBindLiterals(ctx);
    }

    @Override
    public ASTNode visitIdentifier(Db2StatementParser.IdentifierContext ctx) {
        return super.visitIdentifier(ctx);
    }

    @Override
    public ASTNode visitReservedWord(Db2StatementParser.ReservedWordContext ctx) {
        return super.visitReservedWord(ctx);
    }

    @Override
    public ASTNode visitIdentifierKeyword(Db2StatementParser.IdentifierKeywordContext ctx) {
        return super.visitIdentifierKeyword(ctx);
    }

    @Override
    public ASTNode visitCapacityUnit(Db2StatementParser.CapacityUnitContext ctx) {
        return super.visitCapacityUnit(ctx);
    }

    @Override
    public ASTNode visitTimeUnit(Db2StatementParser.TimeUnitContext ctx) {
        return super.visitTimeUnit(ctx);
    }

    @Override
    public ASTNode visitSchemaName(Db2StatementParser.SchemaNameContext ctx) {
        return super.visitSchemaName(ctx);
    }

    @Override
    public ASTNode visitOwner(Db2StatementParser.OwnerContext ctx) {
        return super.visitOwner(ctx);
    }

    @Override
    public ASTNode visitProfileName(Db2StatementParser.ProfileNameContext ctx) {
        return super.visitProfileName(ctx);
    }

    @Override
    public ASTNode visitRollbackSegmentName(Db2StatementParser.RollbackSegmentNameContext ctx) {
        return super.visitRollbackSegmentName(ctx);
    }

    @Override
    public ASTNode visitConstraintName(Db2StatementParser.ConstraintNameContext ctx) {
        return super.visitConstraintName(ctx);
    }

    @Override
    public ASTNode visitContextName(Db2StatementParser.ContextNameContext ctx) {
        return super.visitContextName(ctx);
    }

    @Override
    public ASTNode visitSavepointName(Db2StatementParser.SavepointNameContext ctx) {
        return super.visitSavepointName(ctx);
    }

    @Override
    public ASTNode visitSynonymName(Db2StatementParser.SynonymNameContext ctx) {
        return super.visitSynonymName(ctx);
    }

    @Override
    public ASTNode visitName(Db2StatementParser.NameContext ctx) {
        return super.visitName(ctx);
    }

    @Override
    public ASTNode visitTablespaceName(Db2StatementParser.TablespaceNameContext ctx) {
        return super.visitTablespaceName(ctx);
    }

    @Override
    public ASTNode visitNewTablespaceName(Db2StatementParser.NewTablespaceNameContext ctx) {
        return super.visitNewTablespaceName(ctx);
    }

    @Override
    public ASTNode visitSubprogramName(Db2StatementParser.SubprogramNameContext ctx) {
        return super.visitSubprogramName(ctx);
    }

    @Override
    public ASTNode visitMethodName(Db2StatementParser.MethodNameContext ctx) {
        return super.visitMethodName(ctx);
    }

    @Override
    public ASTNode visitTablespaceSetName(Db2StatementParser.TablespaceSetNameContext ctx) {
        return super.visitTablespaceSetName(ctx);
    }

    @Override
    public ASTNode visitServiceName(Db2StatementParser.ServiceNameContext ctx) {
        return super.visitServiceName(ctx);
    }

    @Override
    public ASTNode visitIlmPolicyName(Db2StatementParser.IlmPolicyNameContext ctx) {
        return super.visitIlmPolicyName(ctx);
    }

    @Override
    public ASTNode visitPolicyName(Db2StatementParser.PolicyNameContext ctx) {
        return super.visitPolicyName(ctx);
    }

    @Override
    public ASTNode visitConnectionQualifier(Db2StatementParser.ConnectionQualifierContext ctx) {
        return super.visitConnectionQualifier(ctx);
    }

    @Override
    public ASTNode visitFunctionName(Db2StatementParser.FunctionNameContext ctx) {
        return super.visitFunctionName(ctx);
    }

    @Override
    public ASTNode visitCursorName(Db2StatementParser.CursorNameContext ctx) {
        return super.visitCursorName(ctx);
    }

    @Override
    public ASTNode visitTableName(Db2StatementParser.TableNameContext ctx) {
        return super.visitTableName(ctx);
    }

    @Override
    public ASTNode visitViewName(Db2StatementParser.ViewNameContext ctx) {
        return super.visitViewName(ctx);
    }

    @Override
    public ASTNode visitTriggerName(Db2StatementParser.TriggerNameContext ctx) {
        return super.visitTriggerName(ctx);
    }

    @Override
    public ASTNode visitMaterializedViewName(Db2StatementParser.MaterializedViewNameContext ctx) {
        return super.visitMaterializedViewName(ctx);
    }

    @Override
    public ASTNode visitColumnName(Db2StatementParser.ColumnNameContext ctx) {
        return new ColumnSegment(
                ctx.start.getStartIndex(),
                ctx.stop.getStopIndex(),
                new IdentifierValue(ctx.getText())
        );
    }

    @Override
    public ASTNode visitObjectName(Db2StatementParser.ObjectNameContext ctx) {
        return super.visitObjectName(ctx);
    }

    @Override
    public ASTNode visitClusterName(Db2StatementParser.ClusterNameContext ctx) {
        return super.visitClusterName(ctx);
    }

    @Override
    public ASTNode visitIndexName(Db2StatementParser.IndexNameContext ctx) {
        return super.visitIndexName(ctx);
    }

    @Override
    public ASTNode visitStatisticsTypeName(Db2StatementParser.StatisticsTypeNameContext ctx) {
        return super.visitStatisticsTypeName(ctx);
    }

    @Override
    public ASTNode visitFunction(Db2StatementParser.FunctionContext ctx) {
        return super.visitFunction(ctx);
    }

    @Override
    public ASTNode visitPackageName(Db2StatementParser.PackageNameContext ctx) {
        return super.visitPackageName(ctx);
    }

    @Override
    public ASTNode visitTypeName(Db2StatementParser.TypeNameContext ctx) {
        return super.visitTypeName(ctx);
    }

    @Override
    public ASTNode visitIndexTypeName(Db2StatementParser.IndexTypeNameContext ctx) {
        return super.visitIndexTypeName(ctx);
    }

    @Override
    public ASTNode visitModelName(Db2StatementParser.ModelNameContext ctx) {
        return super.visitModelName(ctx);
    }

    @Override
    public ASTNode visitOperatorName(Db2StatementParser.OperatorNameContext ctx) {
        return super.visitOperatorName(ctx);
    }

    @Override
    public ASTNode visitDimensionName(Db2StatementParser.DimensionNameContext ctx) {
        return super.visitDimensionName(ctx);
    }

    @Override
    public ASTNode visitDirectoryName(Db2StatementParser.DirectoryNameContext ctx) {
        return super.visitDirectoryName(ctx);
    }

    @Override
    public ASTNode visitFeatureId(Db2StatementParser.FeatureIdContext ctx) {
        return super.visitFeatureId(ctx);
    }

    @Override
    public ASTNode visitElementName(Db2StatementParser.ElementNameContext ctx) {
        return super.visitElementName(ctx);
    }

    @Override
    public ASTNode visitRoleName(Db2StatementParser.RoleNameContext ctx) {
        return super.visitRoleName(ctx);
    }

    @Override
    public ASTNode visitUsername(Db2StatementParser.UsernameContext ctx) {
        return super.visitUsername(ctx);
    }

    @Override
    public ASTNode visitPassword(Db2StatementParser.PasswordContext ctx) {
        return super.visitPassword(ctx);
    }

    @Override
    public ASTNode visitAndOperator(Db2StatementParser.AndOperatorContext ctx) {
        return super.visitAndOperator(ctx);
    }

    @Override
    public ASTNode visitOrOperator(Db2StatementParser.OrOperatorContext ctx) {
        return super.visitOrOperator(ctx);
    }

    @Override
    public ASTNode visitNotOperator(Db2StatementParser.NotOperatorContext ctx) {
        return super.visitNotOperator(ctx);
    }

    @Override
    public ASTNode visitNestedItem(Db2StatementParser.NestedItemContext ctx) {
        return super.visitNestedItem(ctx);
    }

    @Override
    public ASTNode visitDataTypeName(Db2StatementParser.DataTypeNameContext ctx) {
        return super.visitDataTypeName(ctx);
    }
}
