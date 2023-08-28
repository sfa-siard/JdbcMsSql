package ch.admin.bar.siard2.jdbc;

import ch.enterag.sqlparser.SqlLiterals;

// understands how to get tables, views, table types and system tables of an MS SQL Server Database
class GetTablesQuery {

    private String[] types;
    private String catalog;
    private String schemaPattern;
    private String tableNamePattern;
    private String searchStringEscape;

    public GetTablesQuery(
            String catalog,
            String schemaPattern,
            String tableNamePattern,
            String[] types,
            String searchStringEscape
    ) {
        this.types = types;
        this.catalog = catalog;
        this.schemaPattern = schemaPattern;
        this.tableNamePattern = tableNamePattern;
        this.searchStringEscape = searchStringEscape;

    }

    String build() {
        if (types == null) types = new String[]{"TABLE", "VIEW", "TABLE TYPE", "SYSTEM TABLE"};
        StringBuilder sbCondition = new StringBuilder();
        for (int i = 0; i < types.length; i++) {
            if (i == 0) {
                if (types.length > 1) sbCondition.append(" (");
            } else sbCondition.append("  OR ");
            sbCondition.append("o.type = '");
            if (types[i].equals("TABLE")) sbCondition.append("U");
            else if (types[i].equals("VIEW")) sbCondition.append("V");
            else if (types[i].equals("TABLE TYPE")) sbCondition.append("TT");
            else if (types[i].equals("SYSTEM TABLE")) sbCondition.append("S");
            sbCondition.append("' AND is_ms_shipped = ");
            if (!types[i].equals("SYSTEM TABLE")) sbCondition.append("0");
            else sbCondition.append("1");
            if (i == types.length - 1) {
                if (types.length > 1) sbCondition.append(")");
            }
            sbCondition.append("\r\n");
        }
        if (catalog != null)
            sbCondition.append(" AND DB_NAME() = " + SqlLiterals.formatStringLiteral(catalog) + "\r\n");
        if (schemaPattern != null)
            sbCondition.append(" AND s.name LIKE " + SqlLiterals.formatStringLiteral(schemaPattern) + " ESCAPE '" + searchStringEscape + "'\r\n");
        if (tableNamePattern != null)
            sbCondition.append(" AND o.name LIKE " + SqlLiterals.formatStringLiteral(tableNamePattern) + " ESCAPE '" + searchStringEscape + "'\r\n");
        StringBuilder sbCaseTableType = new StringBuilder("  case o.type\r\n");
        sbCaseTableType.append("    when 'U' then 'TABLE'\r\n");
        sbCaseTableType.append("    when 'V' then 'VIEW'\r\n");
        sbCaseTableType.append("    when 'TT' then 'TABLE TYPE'\r\n");
        sbCaseTableType.append("    else 'SYSTEM TABLE'\r\n");
        sbCaseTableType.append("  end");
        StringBuilder sbSql = new StringBuilder("SELECT\r\n");
        sbSql.append("  DB_NAME() AS TABLE_CAT,\r\n");
        sbSql.append("  s.name AS TABLE_SCHEM,\r\n");
        sbSql.append("  o.name AS TABLE_NAME,\r\n");
        sbSql.append(sbCaseTableType.toString());
        sbSql.append(" AS TABLE_TYPE,\r\n");
        sbSql.append(" STUFF((SELECT DISTINCT '| ' + CONVERT(VARCHAR, p.value)\r\n");
        sbSql.append(" FROM sys.extended_properties p\r\n");
        sbSql.append(" WHERE (p.major_id = o.object_id and p.minor_id = 0 and p.class = 1)\r\n");
        sbSql.append(" FOR XML PATH ('')), 1, 2, '') AS REMARKS,\r\n");
        sbSql.append("  NULL AS TYPE_CAT,\r\n");
        sbSql.append("  NULL AS TYPE_SCHEM,\r\n");
        sbSql.append("  NULL AS TYPE_NAME,\r\n");
        sbSql.append("  NULL AS SELF_REFERENCING_COL_NAME,\r\n");
        sbSql.append("  NULL AS REF_GENERATION,\r\n");
        sbSql.append("  m.definition as " + MsSqlDatabaseMetaData._sQUERY_TEXT + "\r\n");
        sbSql.append("FROM sys.all_objects o\r\n");
        sbSql.append("  JOIN sys.schemas s\r\n");
        sbSql.append("    ON (o.schema_id = s.schema_id)\r\n");
        sbSql.append("  LEFT JOIN sys.sql_modules m\r\n");
        sbSql.append("    ON (m.object_id = o.object_id)\r\n");
        sbSql.append("WHERE\r\n");
        sbSql.append(sbCondition.toString());
        sbSql.append("ORDER BY TABLE_TYPE, TABLE_CAT, TABLE_SCHEM, TABLE_NAME");
        return sbSql.toString();
    }
}