package org.apache.shardingsphere.sql.parser.db2.parser;

import org.antlr.v4.runtime.CharStream;
import org.apache.shardingsphere.sql.parser.api.parser.SQLLexer;
import org.apache.shardingsphere.sql.parser.autogen.Db2StatementLexer;

/**
 * SQL lexer for DB2.
 */
public final class Db2Lexer extends Db2StatementLexer implements SQLLexer {

    public Db2Lexer(final CharStream input) {
        super(input);
    }
}
