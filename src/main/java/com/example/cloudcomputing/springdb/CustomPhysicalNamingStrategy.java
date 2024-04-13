package com.example.cloudcomputing.springdb;

import org.hibernate.boot.model.naming.Identifier;
import org.hibernate.engine.jdbc.env.spi.JdbcEnvironment;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.orm.jpa.hibernate.SpringPhysicalNamingStrategy;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CustomPhysicalNamingStrategy extends SpringPhysicalNamingStrategy {

    @Value("${table.name}")
    private String tableName;

    @Override
    public Identifier toPhysicalTableName(final Identifier identifier, final JdbcEnvironment jdbcEnv) {
        return Identifier.toIdentifier(tableName);
    }
}