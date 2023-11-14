package db;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
@Table(name = "article_appro", schema = "gestion_stock", catalog = "")
public class ArticleAppro {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "codeArt")
    private int codeArt;
    @Basic
    @Column(name = "qte")
    private int qte;
    @Basic
    @Column(name = "dateprv")
    private Date dateprv;

    public int getCodeArt() {
        return codeArt;
    }

    public void setCodeArt(int codeArt) {
        this.codeArt = codeArt;
    }

    public int getQte() {
        return qte;
    }

    public void setQte(int qte) {
        this.qte = qte;
    }

    public Date getDateprv() {
        return dateprv;
    }

    public void setDateprv(Date dateprv) {
        this.dateprv = dateprv;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArticleAppro that = (ArticleAppro) o;

        if (codeArt != that.codeArt) return false;
        if (qte != that.qte) return false;
        if (dateprv != null ? !dateprv.equals(that.dateprv) : that.dateprv != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = codeArt;
        result = 31 * result + qte;
        result = 31 * result + (dateprv != null ? dateprv.hashCode() : 0);
        return result;
    }
}
