package com.action;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import jakarta.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;

public class DownloadPDFAction  extends ActionSupport {
    private int codeCmd;
    private String client;
    private int codeArt;
    private int qte;

    private int telephone;
    private String adress;
    private int facture;
    private int prix;



    // Getter and setter for the codeCmd property
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
    @Override
    public String execute() {
        // Create a new Document
        Document document = new Document();

        try {
            // Create a ByteArrayOutputStream to hold the PDF content
            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            // Create a PdfWriter to write the document to the ByteArrayOutputStream
            PdfWriter.getInstance(document, baos);

            // Open the document
            document.open();


            // Set the font styles
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 24, Font.BOLD);
            Font headingFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, Font.BOLD);
            Font cellFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL);

            // Add content to the document
            Paragraph title = new Paragraph("INVOICE", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(Chunk.NEWLINE);

            PdfPTable headerTable = new PdfPTable(2);
            headerTable.setWidthPercentage(100);
            headerTable.setWidths(new float[]{1f, 1f});

            // Add image to the top left
            Image image = Image.getInstance("https://www.luxottica.com/sites/luxottica.com/files/brand/mainimage/ray-ban_0.jpeg");
            image.scaleAbsolute(400, 100); // Adjust the image size as needed
            PdfPCell imageCell = new PdfPCell(image);
            imageCell.setBorder(Rectangle.NO_BORDER);
            headerTable.addCell(imageCell);

            // Add text to the top right
            PdfPCell textCell = new PdfPCell(new Phrase("Thanks for choosing us !", cellFont));
            textCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            textCell.setBorder(Rectangle.NO_BORDER);
            headerTable.addCell(textCell);

            document.add(headerTable);

            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);

            // Add table data
            addTableData(table, "Commande Code:", String.valueOf(codeCmd), cellFont);
            addTableData(table, "Client:", client, cellFont);
            addTableData(table, "Address:", adress, cellFont);
            addTableData(table, "Telephone:", String.valueOf(telephone), cellFont);
            addTableData(table, "Product Code:", String.valueOf(codeArt), cellFont);
            addTableData(table, "Quantity:", String.valueOf(qte), cellFont);
            addTableData(table, "Price:", String.valueOf(prix), cellFont);
            addTableData(table, "Facture:", String.valueOf(facture), cellFont);

            // Add the table to the document
            document.add(table);

            // Close the document
            document.close();

            // Set the response content type to PDF
            javax.servlet.http.HttpServletResponse response =( javax.servlet.http.HttpServletResponse)org.apache.struts2.ServletActionContext.getResponse();
            response.setContentType("application/pdf");


            // Set the filename for the generated PDF
            String filename = "invoice_" + codeCmd + ".pdf";
            response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

            // Write the PDF content to the response's output stream
            OutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // Return null to prevent Struts from further processing the request
    }

    private void addTableData(PdfPTable table, String label, String value, Font font) {
        PdfPCell labelCell = new PdfPCell(new Phrase(label, font));
        PdfPCell valueCell = new PdfPCell(new Phrase(value, font));

        labelCell.setBorder(Rectangle.NO_BORDER);
        valueCell.setBorder(Rectangle.NO_BORDER);

        table.addCell(labelCell);
        table.addCell(valueCell);
    }

}