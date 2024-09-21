package org.apache.shardingsphere.infra.database.db2.type;


import org.apache.shardingsphere.infra.database.core.type.DatabaseType;
import org.apache.shardingsphere.infra.spi.type.typed.TypedSPILoader;
import org.junit.jupiter.api.Test;

import java.util.Collections;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;

public class Db2DatabaseTypeTest {

    @Test
    void assertGetJdbcUrlPrefixes() {
        assertThat(TypedSPILoader.getService(DatabaseType.class, "Db2").getJdbcUrlPrefixes(), is(Collections.singletonList("jdbc:db2:")));
    }
}
