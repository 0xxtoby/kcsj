package util;

import java.sql.Timestamp;
import java.util.Date;

public class Data_Util {
    public Timestamp data_timestamp(){
        Date date=new Date();
        long longTime = date.getTime();
        Timestamp timestamp = new Timestamp(longTime);
        return timestamp;
    }
}

