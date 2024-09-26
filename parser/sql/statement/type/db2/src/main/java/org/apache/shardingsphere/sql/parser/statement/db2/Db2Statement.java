package org.apache.shardingsphere.sql.parser.statement.db2;

import org.apache.shardingsphere.infra.database.core.type.DatabaseType;
import org.apache.shardingsphere.infra.spi.type.typed.TypedSPILoader;
import org.apache.shardingsphere.sql.parser.statement.core.statement.SQLStatement;

/**
 * db2 statement.
 */
public interface Db2Statement extends SQLStatement {

    @Override
    default DatabaseType getDatabaseType() {
        return TypedSPILoader.getService(DatabaseType.class, "Db2");
    }
}
