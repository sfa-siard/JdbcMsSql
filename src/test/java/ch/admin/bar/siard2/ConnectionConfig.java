package ch.admin.bar.siard2;

import ch.admin.bar.siard2.jdbc.MsSqlConnection;
import ch.admin.bar.siard2.jdbcx.MsSqlDataSource;

import java.sql.SQLException;

public class ConnectionConfig {

    private ConnectionUrl connectionUrl;
    private Credentials credentials;

    public ConnectionConfig(ConnectionUrl connectionUrl, Credentials credentials) {
        this.connectionUrl = connectionUrl;
        this.credentials = credentials;
    }

    public MsSqlConnection connect() throws SQLException {
        MsSqlDataSource dsMsSql = new MsSqlDataSource();
        dsMsSql.setUrl(connectionUrl.get());
        dsMsSql.setUser("sa");
        dsMsSql.setPassword("Yukon900");
        return (MsSqlConnection) dsMsSql.getConnection();
    }

    public String name() {
        return connectionUrl.name();
    }
}
