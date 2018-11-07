import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;
import controlP5.*;
import processing.serial.*;

ControlP5 cp5;
 StopWatchTimer sw;



double x=0;
double y=0;
 int padd=50;

static String OAuthConsumerKey = "";
static String OAuthConsumerSecret = "";
// This is where you enter your Access Token info
static String AccessToken = "";
static String AccessTokenSecret = "";

// if you enter keywords here it will filter, otherwise it will sample
String keywords[] = { "vfqvhhfq"," fhdqs"
};
int numtweet1=0;
int numtweet2=0;
int nameindex=0;
String tweet1=" ";
String tweet2=" ";
int temp=40;
boolean block=false;
boolean colorchanging=false;
///////////////////////////// End Variable Config ////////////////////////////

TwitterStream twitter = new TwitterStreamFactory().getInstance();
PImage img;
boolean imageLoaded;
String tweet;
Serial serial;
boolean firstchoosed=false;
color firstcolor=color(0,159,227);
color secondcolor=color(252,188,0);

void setup() {
  size(displayWidth, displayHeight);
  noStroke();
serialinit();
sw = new StopWatchTimer();
  //    sw.start();
  connectTwitter();
  twitter.addListener(listener);
  initlistener(keywords);
 background(0);
 initinter();
   
textSize(12); 
}

void draw() {
  fill(0);
 background(218);
   
        textAlign(BASELINE);

     fill(0);
     
     if (colorchanging==true){
       text("changement de couleur",10,10,100,100);
       
       
     }
   text(tweet1, width/3+320-padd, height/3, 300, 200);
   text(" "+numtweet1, width/3+250-padd,  height/3+15, 300, 200);
  text("vs", width/3-padd-40, height/3+75, 300, 200);
     text(tweet2, width/3+320-padd,  height/2, 300, 200);
   text(" "+numtweet2, width/3+250-padd, height/2+15, 300, 200);
    time();
   textAlign(CENTER, CENTER);
   text("     # moi ça      workshop ensci 2013",width/2-70,4*height/5,140,100);
 
 int actual= sw.getElapsedTime();
  if(actual>=temp*1000 && block==false){
    sw.stop();
    
  tweet1=tweet2=" ";
    String[] noword={"djkzjm"};
    twitter.filter(new FilterQuery().track(noword));
    block=true;
  }
  
}

// Initial connection
void connectTwitter() {
  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  AccessToken accessToken = loadAccessToken();
  twitter.setOAuthAccessToken(accessToken);
}

// Loading up the access token
private static AccessToken loadAccessToken() {
  return new AccessToken(AccessToken, AccessTokenSecret);
}

// This listens for new tweet
StatusListener listener = new StatusListener() {
  public void onStatus(Status status) {
    
   
    tweet="@" + status.getUser().getScreenName() + " - " + status.getText()+" "+status.getIsoLanguageCode(); 
      
    if( tweet.toLowerCase().contains(keywords[0].toLowerCase())==true){
    numtweet1=numtweet1+1;
    tweet1=tweet;
           serial.write('1');
  }
  
    else if( tweet.toLowerCase().contains(keywords[1].toLowerCase())==true){
     tweet2=tweet;
      numtweet2=numtweet2+1;
        serial.write('2');

   
     
    }
    
}

  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
    //System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
  }
  
  public void onStallWarning(StallWarning warning) {
    //System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
  }
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
    // System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
  }
  public void onScrubGeo(long userId, long upToStatusId) {
    System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }

  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};



void initlistener(String[] keywords){
   if (keywords.length==0) twitter.sample();
  else twitter.filter(new FilterQuery().track(keywords));
  
  println(keywords);
  
}