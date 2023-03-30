package ch.admin.bar.siard2;

public class ConnectionUrl {

    private final String host;
    private final String port;
    private final String name;

    public ConnectionUrl(String host, String port, String name) {
        this.host = host;
        this.port = port;
        this.name = name;
    }

    public String get() {
       return  "jdbc:sqlserver://" + this.host + ":" + this.port + ";databaseName=" + this.name + ";encrypt=true;trustServerCertificate=true";
    }

    public String name() {
        return name;
    }
}
