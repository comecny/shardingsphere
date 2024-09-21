package org.apache.shardingsphere.sql.parser.db2.vistor.statement;

import org.apache.shardingsphere.sql.parser.api.visitor.statement.type.*;
import org.apache.shardingsphere.sql.parser.db2.vistor.statement.type.DB2DMLStatementVisitor;
import org.apache.shardingsphere.sql.parser.spi.SQLStatementVisitorFacade;

/**
 * Statement visitor facade for db2.
 */
public final class DB2StatementVisitorFacade implements SQLStatementVisitorFacade {

    @Override
    public Class<? extends DMLStatementVisitor> getDMLVisitorClass() {
        return DB2DMLStatementVisitor.class;
    }

    @Override
    public Class<? extends DDLStatementVisitor> getDDLVisitorClass() {
        throw new UnsupportedOperationException("");
    }

    @Override
    public Class<? extends TCLStatementVisitor> getTCLVisitorClass() {
        throw new UnsupportedOperationException("");
    }

    @Override
    public Class<? extends DCLStatementVisitor> getDCLVisitorClass() {
        throw new UnsupportedOperationException("");
    }

    @Override
    public Class<? extends DALStatementVisitor> getDALVisitorClass() {
        throw new UnsupportedOperationException("");
    }

    @Override
    public Class<? extends RLStatementVisitor> getRLVisitorClass() {
        throw new UnsupportedOperationException("");
    }

    @Override
    public String getDatabaseType() {
        return "Db2";
    }
}
