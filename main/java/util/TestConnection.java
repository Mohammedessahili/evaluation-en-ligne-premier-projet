package util;

import java.sql.Connection;

public class TestConnection {

    public static void main(String[] args) {

        Connection conn = DBConnection.getConnection();

        if (conn != null) {
            System.out.println("Test réussi : connexion avec database OK");
        } else {
            System.out.println("Test échoué : problème de connexion");
        }
    }
}