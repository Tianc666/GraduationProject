package com.mcyy.entity;

import java.util.Date;

public class Returns {
    private Integer rId;

    private Integer rMedicineid;

    private Integer rCount;

    private Date rDate;

    private Date rPasttime;

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public Integer getrMedicineid() {
        return rMedicineid;
    }

    public void setrMedicineid(Integer rMedicineid) {
        this.rMedicineid = rMedicineid;
    }

    public Integer getrCount() {
        return rCount;
    }

    public void setrCount(Integer rCount) {
        this.rCount = rCount;
    }

    public Date getrDate() {
        return rDate;
    }

    public void setrDate(Date rDate) {
        this.rDate = rDate;
    }

    public Date getrPasttime() {
        return rPasttime;
    }

    public void setrPasttime(Date rPasttime) {
        this.rPasttime = rPasttime;
    }
}