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

package org.apache.shardingsphere.mode.node.path.metadata.storage;

import org.apache.shardingsphere.mode.node.path.version.VersionNodePathGenerator;
import org.junit.jupiter.api.Test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;

class StorageNodeNodePathGeneratorTest {
    
    @Test
    void assertGetRootPath() {
        assertThat(new StorageNodeNodePathGenerator("foo_db").getRootPath(), is("/metadata/foo_db/data_sources/nodes"));
    }
    
    @Test
    void assertGetPath() {
        assertThat(new StorageNodeNodePathGenerator("foo_db").getPath("foo_ds"), is("/metadata/foo_db/data_sources/nodes/foo_ds"));
    }
    
    @Test
    void assertGetVersion() {
        VersionNodePathGenerator versionNodePathGenerator = new StorageNodeNodePathGenerator("foo_db").getVersion("foo_ds");
        assertThat(versionNodePathGenerator.getActiveVersionPath(), is("/metadata/foo_db/data_sources/nodes/foo_ds/active_version"));
        assertThat(versionNodePathGenerator.getVersionsPath(), is("/metadata/foo_db/data_sources/nodes/foo_ds/versions"));
        assertThat(versionNodePathGenerator.getVersionPath(0), is("/metadata/foo_db/data_sources/nodes/foo_ds/versions/0"));
    }
}
