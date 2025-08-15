import java.text.DateFormat
import java.util.*

plugins {
    `java-library`
    id("pl.allegro.tech.build.axion-release") version "1.14.3"
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

group = "ch.admin.bar"
version = scmVersion.version

repositories {
    mavenCentral()
    flatDir {
        dirs("lib")
    }
}

dependencies {
    implementation(fileTree("lib") { include("*.jar") })

    testImplementation("junit:junit:4.13.2")
    testImplementation("org.testcontainers:testcontainers:1.19.0")
    testImplementation("org.testcontainers:mssqlserver:1.19.0")

    //necessary for useJUnitPlatform()
    testImplementation("org.junit.jupiter:junit-jupiter-api:5.8.1")
    testImplementation("org.junit.vintage:junit-vintage-engine")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:5.8.1")
}

tasks.test {
    useJUnitPlatform()
}

tasks.withType(Jar::class) {
    manifest {
        attributes["Manifest-Version"] = "1.0"
        attributes["Created-By"] = "Hartwig Thomas, Enter AG, Rüti ZH, Switzerland; Puzzle ITC AG, Switzerland"
        attributes["Specification-Title"] = "JdbcMsSql"
        attributes["Specification-Vendor"] = "Swiss Federal Archives, Berne, Switzerland"
        attributes["Implementation-Title"] = "MsSql JDBC Wrapper"
        attributes["Implementation-Version"] = archiveVersion
        attributes["Implementation-Vendor"] = "Swiss Federal Archives, Berne, Switzerland"
        attributes["Built-Date"] = DateFormat.getDateInstance().format(Date())
    }
}
