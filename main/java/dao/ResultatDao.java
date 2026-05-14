package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Resultat;
import util.DBConnection;

public class ResultatDao {

    public boolean ajouterResultat(String email, int score, int total) {
        try {
            Connection connection = DBConnection.getConnection();

            String sql =
                "INSERT INTO resultats(etudiant_email, score, total) VALUES(?,?,?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setInt(2, score);
            ps.setInt(3, total);

            ps.executeUpdate();
            return true;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<Resultat> listerResultats() {
        List<Resultat> resultats = new ArrayList<>();

        try {
            Connection connection = DBConnection.getConnection();

            String sql =
                "SELECT * FROM resultats ORDER BY date_passage DESC";

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Resultat r = new Resultat();

                r.setId(rs.getInt("id"));
                r.setEtudiantEmail(rs.getString("etudiant_email"));
                r.setScore(rs.getInt("score"));
                r.setTotal(rs.getInt("total"));
                r.setDatePassage(rs.getString("date_passage"));

                resultats.add(r);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return resultats;
    }

    public List<Resultat> listerResultatsParEtudiant(String email) {
        List<Resultat> liste = new ArrayList<>();

        try {
            Connection connection = DBConnection.getConnection();

            String sql =
                "SELECT * FROM resultats WHERE etudiant_email=? ORDER BY date_passage DESC";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Resultat r = new Resultat();

                r.setId(rs.getInt("id"));
                r.setEtudiantEmail(rs.getString("etudiant_email"));
                r.setScore(rs.getInt("score"));
                r.setTotal(rs.getInt("total"));
                r.setDatePassage(rs.getString("date_passage"));

                liste.add(r);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return liste;
    }
    public int countResultats() {

        int total = 0;

        try {

            Connection connection =
                    DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(*) FROM resultats";

            PreparedStatement ps =
                    connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                total = rs.getInt(1);

            }

        } catch(Exception e) {

            e.printStackTrace();

        }

        return total;
    }
    public int tauxReussite() {

        int taux = 0;

        try {
            Connection connection = DBConnection.getConnection();

            String sql =
                "SELECT " +
                "CASE " +
                "WHEN COUNT(*) = 0 THEN 0 " +
                "ELSE SUM(CASE WHEN score >= total/2 THEN 1 ELSE 0 END) * 100 / COUNT(*) " +
                "END AS taux " +
                "FROM resultats";

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                taux = rs.getInt("taux");
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return taux;
    }
    public int countScoresBetween(int min, int max) {

        int total = 0;

        try {
            Connection connection = DBConnection.getConnection();

            String sql =
                "SELECT COUNT(*) FROM resultats " +
                "WHERE score >= ? AND score <= ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, min);
            ps.setInt(2, max);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                total = rs.getInt(1);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return total;
    }
    public double moyenneGenerale() {

        double moyenne = 0;

        try {

            Connection connection =
                    DBConnection.getConnection();

            String sql =
            "SELECT AVG(score) FROM resultats";

            PreparedStatement ps =
                    connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                moyenne = rs.getDouble(1);

            }

        } catch(Exception e) {

            e.printStackTrace();

        }

        return moyenne;
    }
    public String meilleurEtudiant() {

        String email = "Aucun";

        try {

            Connection connection =
                    DBConnection.getConnection();

            String sql =
            "SELECT etudiant_email " +
            "FROM resultats " +
            "ORDER BY score DESC LIMIT 1";

            PreparedStatement ps =
                    connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                email =
                rs.getString("etudiant_email");

            }

        } catch(Exception e) {

            e.printStackTrace();

        }

        return email;
    }
    public List<Resultat> listerResultatsParEmail(String email){

        List<Resultat> liste = new ArrayList<>();

        try{

            Connection cn = DBConnection.getConnection();

            String sql =
            "SELECT * FROM resultats WHERE etudiant_email=? ORDER BY id DESC";

            PreparedStatement ps =
            cn.prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Resultat r = new Resultat();

                r.setId(rs.getInt("id"));
                r.setEtudiantEmail(rs.getString("etudiant_email"));
                r.setScore(rs.getInt("score"));
                r.setTotal(rs.getInt("total"));
                r.setDatePassage(rs.getString("date_passage"));

                liste.add(r);

            }

        }catch(Exception e){

            e.printStackTrace();

        }

        return liste;
    }
}