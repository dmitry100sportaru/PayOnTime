package PayOnTime;

import com.google.appengine.api.users.User;

import javax.jdo.annotations.*;
import java.util.ArrayList;
import java.util.Currency;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 04.07.11
 * Time: 21:08
 * To change this template use File | Settings | File Templates.
 */
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class PaymentRequest {

    public enum Status {
        NEW,
        ACCEPTED,
        DECLINED,
        FULFILLED
    }

    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private Date date;

    @Persistent
    private User author;

//    @Persistent
//    private String department;

//    @Persistent
//    private String supplier;

//    @Persistent
//    private String invoiceNumber;
//
//    @Persistent
//    private Date invoiceDate;
//
//    @Persistent
//    private String invoiceDescription;
//
//    @Persistent
//    private Currency invoiceTotal;
//
//    @Persistent
//    private Status status;

//    private ArrayList<Payment> payments;

    @Persistent
    private String comment;


    public PaymentRequest(User author, String comment, Date date) {
        this.author = author;
        this.comment = comment;
        this.date = date;
    }

    public Long getId() {
        return id;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
