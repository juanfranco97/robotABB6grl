#define BLYNK_PRINT Serial
#define BLYNK_USE_DIRECT_CONNECT
#include <BlynkSimpleEsp32_BT.h>
char auth[] = "MkGaLM9c7N4D3-DBuDm1v9V6R3aTXSGT";
BLYNK_WRITE(V3) {
  int x = param[0].asInt();
  int y = param[1].asInt();

  // Do something with x and y
  //Serial.print("X = ");
  Serial.print(x);
  Serial.print("  ");
  //Serial.print("; Y = ");
  Serial.println(y);
}

BLYNK_WRITE (V1) {
   switch(param.asInt()){
    case 1:{
      Serial.println("1020 1020 1020");
      break;
    }
    case 2:{
      Serial.println("3040 3040 3040");
      break;
    }
    case 3:{
      Serial.println("5060 5060 5060");
      break;
    }
   }
}
BLYNK_WRITE (V2){
   switch(param.asInt()){
    case 1:{
      Serial.println("1111 1111 1111 1111");
      break;
    }
    case 2:{
      Serial.println("2222 2222 2222 2222");
      break;
    }
    case 3:{
      Serial.println("3333 3333 3333 3333");
      break;
    }
   }
}
BLYNK_WRITE (V0){
   switch(param.asInt()){
    case 1:{
      Serial.println("2525 2525 2525 2525 2525");
      break;
    }
    case 2:{
      Serial.println("2626 2626 2626 2626 2626");
      break;
    }
    case 3:{
      Serial.println("2727 2727 2727 2727 2727");
      break;
    }
   }
}

void setup()
{
  Serial.begin(9600);
  Serial.println("ESPERANDO CONEXION");
  Blynk.setDeviceName("RABB6");
  Blynk.begin(auth);
  
}


void loop()
{
  Blynk.run();
}
