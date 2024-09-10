#include "DHT.h" // incluind a biblioteca DHT 
 
#define TIPO_SENSOR  DHT11 // UTILIZANDO A O "TIPO_SENSOR" DA BIBLIOTECA PARA DEFINIR O SENSOR DHT11

const int PINO_SENSOR_DHT11 = A0; // declarando uma variável que não altera e atribuindo a entrada A0 do arduíno para captação de dados 

DHT sensorDHT (PINO_SENSOR_DHT11, TIPO_SENSOR); //  

void setup() {
  
  Serial.begin(9600); // ela inicia o arduíno para que comece a captação de dados

  sensorDHT.begin(); // comando para iniciar a placa

}

void loop() {
  float umidade = sensorDHT.readHumidity();
  int umimax = 70;

  if (isnan(umidade)){

    Serial.println("Erro ao Ler os Dados do Sensor!!");

  } else{

    
    Serial.print("Umidade Máxima:"); 
    Serial.print(umimax);
    Serial.print(" ");
    Serial.print("Umidade Atual:");
    Serial.print(umidade);
    Serial.println(" ");

    
    

    delay(1000);

  }


}
