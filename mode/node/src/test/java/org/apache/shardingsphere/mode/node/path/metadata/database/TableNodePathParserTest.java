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

package org.apache.shardingsphere.mode.node.path.metadata.database;

import org.junit.jupiter.api.Test;

import java.util.Optional;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class TableNodePathParserTest {
    
    @Test
    void assertFindTableName() {
        Optional<String> actual = TableNodePathParser.findTableName("/metadata/foo_db/schemas/foo_schema/tables/foo_tbl");
        assertTrue(actual.isPresent());
        assertThat(actual.get(), is("foo_tbl"));
    }
    
    @Test
    void assertFindTableNameIfNotFound() {
        assertFalse(TableNodePathParser.findTableName("/xxx/foo_db/schemas/foo_schema/tables/foo_tbl").isPresent());
    }
    
    @Test
    void assertIsTablePath() {
        assertTrue(TableNodePathParser.isTablePath("/metadata/foo_db/schemas/foo_schema/tables/foo_tbl"));
    }
}
