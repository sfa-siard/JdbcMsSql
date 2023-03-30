package ch.admin.bar.siard2.jdbcx;

import java.sql.*;
import javax.sql.*;

import static org.junit.Assert.*;

import ch.admin.bar.siard2.ConnectionUrl;
import org.junit.*;

public class MsSqlDataSourceTester {
    private MsSqlDataSource msSqlDataSource = null;
    private Connection connection = null;

    @Before
    public void setUp() {
        msSqlDataSource = new MsSqlDataSource();
    }

    @After
    public void tearDown() throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }

    @Test
    public void testWrapper() throws SQLException {
        Assert.assertSame("Invalid wrapper!", true, msSqlDataSource.isWrapperFor(DataSource.class));
        DataSource dsWrapped = msSqlDataSource.unwrap(DataSource.class);
        assertSame("Invalid wrapped class!",
                   com.microsoft.sqlserver.jdbc.SQLServerDataSource.class,
                   dsWrapped.getClass());
    }

    @Test
    public void testLoginTimeout() throws SQLException {
        int iLoginTimeout = msSqlDataSource.getLoginTimeout();
        assertSame("Unexpected login timeout " + String.valueOf(iLoginTimeout) + "!", 30, iLoginTimeout);
    }

    @Test
    public void testConnection() throws SQLException {
        ConnectionUrl connectioUrl = new ConnectionUrl("localhost", "1433", "testdb");
        msSqlDataSource.setUrl(connectioUrl.get());
        msSqlDataSource.setUser("sa");
        msSqlDataSource.setPassword("Yukon900");

        connection = msSqlDataSource.getConnection();
        assertNotNull(connection);
        assertEquals("testdb", connection.getCatalog());
    }
}
