package org.apache.shardingsphere.sql.parser.db2.parser;

import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.TokenStream;
import org.apache.shardingsphere.sql.parser.api.ASTNode;
import org.apache.shardingsphere.sql.parser.api.parser.SQLParser;
import org.apache.shardingsphere.sql.parser.autogen.Db2StatementParser;
import org.apache.shardingsphere.sql.parser.core.ParseASTNode;

/**
 * SQL SQLParser for DB2.
 */
public final class Db2Parser extends Db2StatementParser implements SQLParser {

    public Db2Parser(final TokenStream input) {
        super(input);
    }

    @Override
    public ASTNode parse() {
        return new ParseASTNode(execute(), (CommonTokenStream) getTokenStream());
    }
}
