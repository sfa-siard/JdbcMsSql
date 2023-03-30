package ch.admin.bar.siard2.jdbc;

import java.sql.*;

import static org.junit.Assert.*;

import ch.admin.bar.siard2.ConnectionUrl;
import ch.admin.bar.siard2.Credentials;
import ch.admin.bar.siard2.ConnectionConfig;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import org.junit.*;
import ch.enterag.utils.*;
import ch.enterag.utils.jdbc.*;
import ch.admin.bar.siard2.mssql.*;

public class MsSqlConnectionTester extends BaseConnectionTester {

    private MsSqlConnection connection = null;

    private static ConnectionConfig connectionConfig = new ConnectionConfig(new ConnectionUrl("localhost", "1433", "testdb"), new Credentials("sa", "Yukon900"));

    @BeforeClass
    public static void setUpClass() throws SQLException {
        MsSqlConnection connMsSql = connectionConfig.connect();
        new TestSqlDatabase(connMsSql);
        new TestMsSqlDatabase(connMsSql);
        connMsSql.close();
    }

    @Before
    public void setUp() {
        try {
            connection = connectionConfig.connect();
            connection.setAutoCommit(false);
            setConnection(connection);
        } catch (SQLException se) {
            fail(EU.getExceptionMessage(se));
        }
    } /* setUp */


    @Test
    public void testClass() {
        assertEquals("Wrong connection class!", MsSqlConnection.class, connection.getClass());
    } /* testClass */

    @Test
    @Override
    public void testCreateArrayOf() {
        enter();
        try {
            Array array = connection.createArrayOf("VARCHAR(256)", new String[]{"a", "b", "c"});
            array.free();
        } catch (SQLServerException e) {
            System.out.println(EU.getExceptionMessage(e));
        } catch (SQLException se) {
            fail(EU.getExceptionMessage(se));
        }
    } /* createArrayOf */


    @Test
    public void testCreateStruct() {
        try {
            this.connection.createStruct("TEST_SCHEMA.TEST_STRUCT_TYPE", new String[]{"a", "b", "c"});
        } catch (SQLServerException e) {
            System.out.println(EU.getExceptionMessage(e));
        } catch (SQLException sqlException) {
            Assert.fail(EU.getExceptionMessage(sqlException));
        }
    }

    @Test
    @Override
    public void testCreateStatement() {
        enter();
        try {
            Statement stmt = connection.createStatement();
            assertEquals("Wrong statement class!", MsSqlStatement.class, stmt.getClass());
        } catch (SQLException se) {
            fail(EU.getExceptionMessage(se));
        }
    } /* testCreateStatement */

    @Test
    @Override
    public void testGetMetadata() {
        enter();
        try {
            DatabaseMetaData dmd = connection.getMetaData();
            assertEquals("Wrong metadata class!", MsSqlDatabaseMetaData.class, dmd.getClass());
        } catch (SQLFeatureNotSupportedException sfnse) {
            System.out.println(EU.getExceptionMessage(sfnse));
        } catch (SQLException se) {
            fail(EU.getExceptionMessage(se));
        }
    } /* testGetMetadata */

    @Test
    @Override
    public void testRollback() {
        enter();
        try {
            connection.rollback();
        } catch (SQLException se) {
            fail(EU.getExceptionMessage(se));
        }
    } /* testRollback */

    @Test
    public void testSetSavepoint() {
        enter();
        try {
            connection.setSavepoint();
        } catch (SQLFeatureNotSupportedException sfnse) {
            System.out.println(EU.getExceptionMessage(sfnse));
        } catch (SQLException se) {
            fail(EU.getExceptionMessage(se));
        }
    } /* testSetSavepoint */

    @Test
    public void testSetSavepoint_String() {
        enter();
        try {
            connection.setSavepoint("TEST_SAVEPOINT");
        } catch (SQLFeatureNotSupportedException sfnse) {
            System.out.println(EU.getExceptionMessage(sfnse));
        } catch (SQLException se) {
            fail(EU.getExceptionMessage(se));
        }
    } /* testSetSavepoint_String */

    @Test
    public void testRollback_Savepoint() {
        enter();
        try {
            Savepoint sp = connection.setSavepoint();
            connection.rollback(sp);
        } catch (SQLFeatureNotSupportedException sfnse) {
            System.out.println(EU.getExceptionMessage(sfnse));
        } catch (SQLException se) {
            fail(EU.getExceptionMessage(se));
        }
    } /* testRollback */

    @Test
    public void testReleaseSavePoint() {
        enter();
        try {
            Savepoint sp = connection.setSavepoint();
            connection.releaseSavepoint(sp);
        } catch (SQLFeatureNotSupportedException sfnse) {
            System.out.println(EU.getExceptionMessage(sfnse));
        } catch (SQLException se) {
            fail(EU.getExceptionMessage(se));
        }
    } /* testReleaseSavePoint */

    @Test
    @Override
    public void testPrepareStatement_String_AInt() {
        enter();
        try {
            connection.prepareStatement(_sSQL, new int[]{1});
        } catch (SQLFeatureNotSupportedException sfnse) {
            System.out.println(EU.getExceptionMessage(sfnse));
        } catch (SQLException se) {
            fail(EU.getExceptionMessage(se));
        }
    } /* testPrepareStatement_String_AInt */

    @Test
    @Override
    public void testPrepareStatement_String_AString() {
        enter();
        try {
            connection.prepareStatement(_sSQL, new String[]{"COL_A"});
        } catch (SQLFeatureNotSupportedException sfnse) {
            System.out.println(EU.getExceptionMessage(sfnse));
        } catch (SQLException se) {
            fail(EU.getExceptionMessage(se));
        }
    } /* testPrepareStatement_String_AString */


    @Test
    public void testSetCatalog() {
        enter();
        try {
            connection.setCatalog("testdb");
        } catch (SQLException se) {
            se.printStackTrace();
            fail("failed to set catalog");
        }
    }





} /* class MsSqlConnectionTester */
