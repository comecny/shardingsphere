package org.apache.shardingsphere.infra.database.db2.type;

import com.google.common.collect.Lists;
import org.apache.shardingsphere.infra.database.core.type.DatabaseType;

import java.util.Collection;
import java.util.List;

/**
 * Database type of db2.
 */
public final class DB2DatabaseType implements DatabaseType {

    @Override
    public Collection<String> getJdbcUrlPrefixes() {
        return Lists.newArrayList("jdbc:db2:");
    }

    @Override
    public String getType() {
        return "Db2";
    }
}
