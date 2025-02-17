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

package org.apache.shardingsphere.sqlfederation.optimizer.context.parser;

import com.cedarsoftware.util.CaseInsensitiveMap;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.apache.shardingsphere.infra.database.core.type.DatabaseType;
import org.apache.shardingsphere.infra.metadata.database.ShardingSphereDatabase;
import org.apache.shardingsphere.sqlfederation.optimizer.context.parser.dialect.OptimizerSQLPropertiesBuilder;

import java.util.Collection;
import java.util.Map;

/**
 * Optimizer parser context factory.
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public final class OptimizerParserContextFactory {
    
    /**
     * Create optimizer parser context map.
     *
     * @param databases databases
     * @return created optimizer parser context map
     */
    public static Map<String, OptimizerParserContext> create(final Collection<ShardingSphereDatabase> databases) {
        Map<String, OptimizerParserContext> result = new CaseInsensitiveMap<>();
        for (ShardingSphereDatabase each : databases) {
            DatabaseType databaseType = each.getProtocolType();
            result.put(each.getName(), new OptimizerParserContext(databaseType, new OptimizerSQLPropertiesBuilder(databaseType).build()));
        }
        return result;
    }
}
