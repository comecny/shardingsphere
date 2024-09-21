package org.apache.shardingsphere.sql.parser.db2.parser;

import org.apache.shardingsphere.sql.parser.api.parser.SQLLexer;
import org.apache.shardingsphere.sql.parser.api.parser.SQLParser;
import org.apache.shardingsphere.sql.parser.spi.DialectSQLParserFacade;

/**
 * SQL parser facade for DB2.
 */
public final class DB2ParserFacade implements DialectSQLParserFacade {

    @Override
    public Class<? extends SQLLexer> getLexerClass() {
        return DB2Lexer.class;
    }

    @Override
    public Class<? extends SQLParser> getParserClass() {
        return DB2Parser.class;
    }

    @Override
    public String getDatabaseType() {
        return "Db2";
    }
}
