package org.apache.shardingsphere.sql.parser.statement.db2.dml;

import lombok.Setter;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.pagination.limit.LimitSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.dml.predicate.LockSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.generic.WindowSegment;
import org.apache.shardingsphere.sql.parser.statement.core.segment.generic.table.SimpleTableSegment;
import org.apache.shardingsphere.sql.parser.statement.core.statement.dml.SelectStatement;
import org.apache.shardingsphere.sql.parser.statement.db2.Db2Statement;

import java.util.Optional;

/**
 * db2 select statement.
 */
@Setter
public final class Db2SelectStatement extends SelectStatement implements Db2Statement {

    private LimitSegment limit;

    private LockSegment lock;

    private WindowSegment window;

    @Override
    public Optional<LimitSegment> getLimit() {
        return Optional.ofNullable(limit);
    }

    @Override
    public Optional<LockSegment> getLock() {
        return Optional.ofNullable(lock);
    }

    @Override
    public Optional<WindowSegment> getWindow() {
        return Optional.ofNullable(window);
    }
}
