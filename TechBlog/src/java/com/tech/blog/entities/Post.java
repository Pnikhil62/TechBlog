
package com.tech.blog.entities;
import java.sql.*;


public class Post {
    private int pid;
    private String ptitle;
    private String pcontent;
    private String pcode;
    private String ppic;
    private Timestamp pdate;
    private int catid;
    private int userid;

    public Post(int pid, String ptitle, String pcontent, String pcode, String ppic, Timestamp pdate, int catid,int userid) {
        this.pid = pid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
        this.ppic = ppic;
        this.pdate = pdate;
        this.catid = catid;
        this.userid = userid;
    }

    public Post(String ptitle, String pcontent, String pcode, String ppic, Timestamp pdate, int catid,int userid) {
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
        this.ppic = ppic;
        this.pdate = pdate;
        this.catid = catid;
        this.userid = userid;
    }

    public int getPid() {
        return pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public String getPcode() {
        return pcode;
    }

    public String getPpic() {
        return ppic;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public int getCatid() {
        return catid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }
    public int getUserid(){
        return userid;
    }
    public void setUserid(int userid){
        this.userid = userid;
    }
  
    
    
}
