package dao;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;


public class DataBean {

   private String strDate;
   private String strAll;
   private String strRecognized;
   private String strRate;
   
   public String getStrDate(){return this.strDate;}
   public String getStrAll(){return this.strAll;}
   public String getStrRecognized(){return this.strRecognized;}
   public String getStrRate(){return this.strRate;}
   
   public void getData(String fileName) throws FileNotFoundException{
      Scanner in=null;
      
      try{
         in=new Scanner(new File(fileName));
         StringBuffer sDate=new StringBuffer();
         StringBuffer sAll=new StringBuffer();
         StringBuffer sRecognized=new StringBuffer();
         StringBuffer sRate=new StringBuffer();
         sDate.append("["); sAll.append("["); sRecognized.append("["); sRate.append("[");
         
         while(in.hasNextLine()){
            String[] aLine=in.nextLine().split(",");
            for(int i=0;i<aLine.length;i++){
               if(i==0)sDate.append(aLine[i]+",");
               if(i==1)sAll.append(aLine[i]+",");
               if(i==2)sRecognized.append(aLine[i]+",");
               if(i==3)sRate.append(aLine[i]+",");
            }
         }
         strDate=sDate.delete(sDate.length()-1, sDate.length()).append("]").toString();
         strAll=sAll.delete(sAll.length()-1, sAll.length()).append("]").toString();
         strRecognized=sRecognized.delete(sRecognized.length()-1, sRecognized.length()).append("]").toString();
         strRate=sRate.delete(sRate.length()-1, sRate.length()).append("]").toString();         
      }
      catch(Exception e){
         e.printStackTrace();
      }
      finally{
         in.close();
      }
   }
}
