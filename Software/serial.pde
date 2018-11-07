void serialinit(){
    
  int serialPortNumber = 0;
  
  // =======================================================
  
  println(Serial.list());
  String port = Serial.list()[4];
 // serial = new Serial(this, port,9600);

}
