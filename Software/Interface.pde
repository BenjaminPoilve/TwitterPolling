void initinter(){
  
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("Terme1")
     .setPosition(width/3-padd,height/3)
     .setSize(200,40)
     
     .setFocus(true)
     .setColor(color(0,0,0))
     .setColorForeground(firstcolor)
     .setColorCaptionLabel(firstcolor)
     .setColorBackground(color(255,255,255))
      .setColorActive(firstcolor) 
     .getCaptionLabel().setSize(10) 
     .setPadding(-50,-25);
                 
  cp5.addTextfield("Terme2")
     .setPosition(width/3-padd,height/2)
     .setSize(200,40)
     .setColor(color(0,0,0))
     .setColorForeground(secondcolor)
     .setColorCaptionLabel(secondcolor)
     .setColorBackground(color(252,255,255))
     .setColorActive(secondcolor)  
     .setAutoClear(false)
     .getCaptionLabel().setSize(10) 
     .setPadding(-50,-25);
     ;
       
  cp5.addBang("observer")
     .setPosition(width/3-padd-240, height/3+65)
     .setSize(80,40)
     .setColorBackground(color(0,0,0))
     .setColorForeground(color(150,150,150))
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
     ;    
     
     

     
}



public void observer() {
  background(0);

  numtweet1=0;
  numtweet2=0;
  tweet1=tweet2=" ";
  sw.start();
 keywords[0] =  cp5.get(Textfield.class,"Terme1").getText();
 keywords[1] =  cp5.get(Textfield.class,"Terme2").getText();
  initlistener(keywords);
  block=false;
}


void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getStringValue()
            );
  }
}


public void input(String theText) {
  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
}

