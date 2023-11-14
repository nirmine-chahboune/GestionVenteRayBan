package entity;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
public class Commandes {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "codeCmd")
    private int codeCmd;
    @Basic
    @Column(name = "client")
    private String client;
    @Basic
    @Column(name = "codeArt")
    private int codeArt;
    @Basic
    @Column(name = "qte")
    private int qte;
    @Basic
    @Column(name = "dateCmd")
    private Date dateCmd;
    @Basic
    @Column(name = "telephone")
    private int telephone;
    @Basic
    @Column(name = "adress")
    private String adress;
    @Basic
    @Column(name = "facture")
    private int facture;
    @Basic
    @Column(name = "prix")
    private int prix;

    public String getPicArt() {
        return picArt;
    }

    @Basic
    @Column(name = "picArt")

    private String picArt;

    public int getCodeCmd() {
        return codeCmd;
    }

    public void setCodeCmd(int codeCmd) {
        this.codeCmd = codeCmd;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

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

    public Date getDateCmd() {
        return dateCmd;
    }

    public void setDateCmd(Date dateCmd) {
        this.dateCmd = dateCmd;
    }

    public void setDateCmd(java.util.Date time) {
        this.dateCmd = new Date(time.getTime());
    }




    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Commandes commandes = (Commandes) o;

        if (codeCmd != commandes.codeCmd) return false;
        if (codeArt != commandes.codeArt) return false;
        if (qte != commandes.qte) return false;
        if (client != null ? !client.equals(commandes.client) : commandes.client != null) return false;
        if (dateCmd != null ? !dateCmd.equals(commandes.dateCmd) : commandes.dateCmd != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = codeCmd;
        result = 31 * result + (client != null ? client.hashCode() : 0);
        result = 31 * result + codeArt;
        result = 31 * result + qte;
        result = 31 * result + (dateCmd != null ? dateCmd.hashCode() : 0);
        return result;
    }

    public int getTelephone() {
        return telephone;
    }

    public void setTelephone(int telephone) {
        this.telephone = telephone;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public int getFacture() {
        return facture;
    }

    public void setFacture(int facture) {
        this.facture = facture;
    }

    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }


    public void setPicArt(String picArt) {
        this.picArt=picArt;
    }
}
