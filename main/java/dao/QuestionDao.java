package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Question;
import util.DBConnection;

public class QuestionDao {

    public boolean ajouterQuestion(Question q) {

        boolean test = false;

        try {

            Connection connection = DBConnection.getConnection();

            String sql =
            "INSERT INTO questions(question, choix1, choix2, choix3, bonne_reponse) VALUES(?,?,?,?,?)";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, q.getQuestion());
            ps.setString(2, q.getChoix1());
            ps.setString(3, q.getChoix2());
            ps.setString(4, q.getChoix3());
            ps.setString(5, q.getBonneReponse());

            ps.executeUpdate();

            test = true;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return test;
    }
    public List<Question> listerQuestions() {

        List<Question> questions = new ArrayList<>();

        try {
            Connection connection = DBConnection.getConnection();

            String sql = "SELECT * FROM questions";

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Question q = new Question();

                q.setId(rs.getInt("id"));
                q.setQuestion(rs.getString("question"));
                q.setChoix1(rs.getString("choix1"));
                q.setChoix2(rs.getString("choix2"));
                q.setChoix3(rs.getString("choix3"));
                q.setBonneReponse(rs.getString("bonne_reponse"));

                questions.add(q);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return questions;
    }
    public boolean supprimerQuestion(int id) {

        boolean test = false;

        try {
            Connection connection = DBConnection.getConnection();

            String sql = "DELETE FROM questions WHERE id=?";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();

            test = true;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return test;
    }
    public Question getQuestionById(int id) {

        Question q = null;

        try {
            Connection connection = DBConnection.getConnection();

            String sql = "SELECT * FROM questions WHERE id=?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                q = new Question();

                q.setId(rs.getInt("id"));
                q.setQuestion(rs.getString("question"));
                q.setChoix1(rs.getString("choix1"));
                q.setChoix2(rs.getString("choix2"));
                q.setChoix3(rs.getString("choix3"));
                q.setBonneReponse(rs.getString("bonne_reponse"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return q;
    }
    public boolean modifierQuestion(Question q) {

        boolean test = false;

        try {
            Connection connection = DBConnection.getConnection();

            String sql =
            "UPDATE questions SET question=?, choix1=?, choix2=?, choix3=?, bonne_reponse=? WHERE id=?";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, q.getQuestion());
            ps.setString(2, q.getChoix1());
            ps.setString(3, q.getChoix2());
            ps.setString(4, q.getChoix3());
            ps.setString(5, q.getBonneReponse());
            ps.setInt(6, q.getId());

            ps.executeUpdate();

            test = true;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return test;
    }
    public int countQuestions() {

        int total = 0;

        try {

            Connection connection =
                    DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(*) FROM questions";

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
}