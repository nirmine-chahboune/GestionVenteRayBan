package entity;

import jakarta.persistence.*;

@Entity
@Table(name = "articlesprix", schema = "gestion_vente")
public class ArticlesPrix {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "codeArt")
    private int codeArt;
    @Basic
    @Column(name = "nomArt")
    private String nomArt;
    @Basic
    @Column(name = "descArt")
    private String descArt;
    @Basic
    @Column(name = "prixArt")
    private int prixArt;
    @Basic
    @Column(name = "picArt")
    private String picArt;

    public int getCodeArt() {
        return codeArt;
    }

    public void setCodeArt(int codeArt) {
        this.codeArt = codeArt;
    }

    public String getNomArt() {
        return nomArt;
    }

    public void setNomArt(String nomArt) {
        this.nomArt = nomArt;
    }

    public String getDescArt() {
        return descArt;
    }

    public void setDescArt(String descArt) {
        this.descArt = descArt;
    }

    public int getPrixArt() {
        return prixArt;
    }

    public void setPrixArt(int prixArt) {
        this.prixArt = prixArt;
    }

    public String getPicArt() {
        return picArt;
    }

    public void setPicArt(String picArt) {
        this.picArt = picArt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArticlesPrix that = (ArticlesPrix) o;

        if (codeArt != that.codeArt) return false;
        if (prixArt != that.prixArt) return false;
        if (nomArt != null ? !nomArt.equals(that.nomArt) : that.nomArt != null) return false;
        if (descArt != null ? !descArt.equals(that.descArt) : that.descArt != null) return false;
        if (picArt != null ? !picArt.equals(that.picArt) : that.picArt != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = codeArt;
        result = 31 * result + (nomArt != null ? nomArt.hashCode() : 0);
        result = 31 * result + (descArt != null ? descArt.hashCode() : 0);
        result = 31 * result + prixArt;
        result = 31 * result + (picArt != null ? picArt.hashCode() : 0);
        return result;
    }
}
