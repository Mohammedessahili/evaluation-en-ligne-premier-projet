package model;

public class Resultat {
    private int id;
    private String etudiantEmail;
    private int score;
    private int total;
    private String datePassage;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getEtudiantEmail() { return etudiantEmail; }
    public void setEtudiantEmail(String etudiantEmail) { this.etudiantEmail = etudiantEmail; }

    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }

    public int getTotal() { return total; }
    public void setTotal(int total) { this.total = total; }

    public String getDatePassage() { return datePassage; }
    public void setDatePassage(String datePassage) { this.datePassage = datePassage; }
}