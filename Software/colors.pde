void keyPressed() {
  if (keyCode  == ALT) {
 
   colorchanging=!colorchanging;
  }
  
  
  if (key  == 'o') {
 if(colorchanging==true){
    if(firstchoosed==false){
       firstcolor=color(233,78,27);
       firstchoosed=true;}
      else{secondcolor=color(233,78,27);
           firstchoosed=false;
      }
  }
  }
  
    if (key  == 'b') {
  if(colorchanging==true){
    if(firstchoosed==false){
       firstcolor=color(0,159,227);
       firstchoosed=true;}
      else{secondcolor=color(0,159,227);
           firstchoosed=false;
      }}
  }
  
      if (key  == 'p') {
  if(colorchanging==true){
    if(firstchoosed==false){
       firstcolor=color(49,39,131);
       firstchoosed=true;}
      else{secondcolor=color(49,39,131);
           firstchoosed=false;
      }}
  }
  
        if (key  == 'y') {
  if(colorchanging==true){
    if(firstchoosed==false){
       firstcolor=color(252,188,0);
       firstchoosed=true;}
      else{secondcolor=color(252,188,0);
           firstchoosed=false;
      }}
  }
  
          if (key  == 'w') {
  if(colorchanging==true){
    if(firstchoosed==false){
       firstcolor=color(255,255,255);
       firstchoosed=true;}
      else{secondcolor=color(255,255,255);
           firstchoosed=false;
      }}
  }
  
  if (key  == 'g') {
  if(colorchanging==true){
    if(firstchoosed==false){
       firstcolor=color( 0,150,54);
       firstchoosed=true;}
      else{secondcolor=color(0,150,54);
           firstchoosed=false;
      }}
  }
  
          if (key  == 'r') {
  if(colorchanging==true){
    if(firstchoosed==false){
       firstcolor=color(249,172,167);
       firstchoosed=true;}
      else{secondcolor=color(249,172,167);
           firstchoosed=false;
      }
  }
          }
  
  
  
  
  cp5.get(Textfield.class, "Terme1").setColorForeground(firstcolor);
  cp5.get(Textfield.class, "Terme1").setColorCaptionLabel(firstcolor);
  cp5.get(Textfield.class, "Terme1").setColorActive(firstcolor) ;
  
  cp5.get(Textfield.class, "Terme2").setColorForeground(secondcolor);
  cp5.get(Textfield.class, "Terme2").setColorCaptionLabel(secondcolor);
  cp5.get(Textfield.class, "Terme2").setColorActive(secondcolor) ;
  
  
}



