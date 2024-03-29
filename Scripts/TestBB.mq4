//+------------------------------------------------------------------+
//|                                                       TestBB.mq4 |
//|                                                   Sergio Sanchez |
//|                                     https://github.com/sszahinos |
//+------------------------------------------------------------------+
#property copyright "Sergio Sanchez"
#property link      "https://github.com/sszahinos"
#property version   "1.00"
#property strict
#include <CustomFunctions.mqh>
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   //Comprar cuando el valor esté por debajo del Bollinger Band y vender cuando llegue al medio
   //entry -> std dev 1
   //SL -> std dev 4
   //No se tiene en cuenta el cambio de valor de las bandas (tocará mucho SL) o ratio muy muy bajo. no pasa nada, solo es test
   //Hay un problema y es que el buylimit necesita un valor por debajo del actual ask. lo mismo para el sell limit pero al revés. se debería usar el BUY pero es peligroso por que es a mercado.
   double entryPoint; //Lower or upper band stdev 1
   double tp; //mid band stdev1
   double sl; //lower or upper band stdev 4
   double bbUpper1;
   double bbMid1;
   double bbLower1;
   double bbUpper2;
   double bbLower2;
   double volume = MarketInfo(NULL, MODE_MINLOT);
   
   int bbPeriod = 20;
   int bb1StdDev = 1;
   int bb2StdDev = 4;
   int orderId = 0;
   int magicNum = 1;

   
   bbUpper1 = iBands(NULL, 0, bbPeriod , bb1StdDev, 0, PRICE_CLOSE, MODE_UPPER, 0);
   bbMid1 = iBands(NULL, 0, bbPeriod, bb1StdDev, 0, PRICE_CLOSE, MODE_MAIN, 0);
   bbLower1 = iBands(NULL, 0, bbPeriod, bb1StdDev, 0, PRICE_CLOSE, MODE_LOWER, 0);

   bbUpper2 = iBands(NULL, 0,bbPeriod,bb2StdDev,0,PRICE_CLOSE, MODE_UPPER, 0);  
   bbLower2 = iBands(NULL, 0,bbPeriod,bb2StdDev,0,PRICE_CLOSE, MODE_LOWER, 0);
   /*Alert("top1: " + bbUpper1);   
   Alert(" mid: " + bbMid1);
   Alert("low1: " + bbLower1);
   Alert(" up2: " + bbUpper2);
   Alert("low2: " + bbLower2);  */
   
   if (!checkOpenOrdersByMagicNum(magicNum)) {  
      if (Ask < bbLower1) {
         //buy     
         tp = NormalizeDouble(bbMid1, Digits);
         sl = NormalizeDouble(bbLower2, Digits);
         Alert("BUY -> Entry: "+Ask+" TP: " + tp + " SL: " + sl);
         
         if (IsTradeAllowed()) {
            orderId = OrderSend(NULL, OP_BUY, volume, Ask, 10, sl, tp); //Se debería usar buylimit
            Alert("Buy limit ORDER CREATED " + orderId);
         };
      } else if (Bid > bbUpper1) {
         //Sell
         tp = NormalizeDouble(bbMid1, Digits);
         sl = NormalizeDouble(bbUpper2, Digits);
         Alert("SELL -> Entry: "+Bid + " TP: " + tp +" SL: " + sl);  
         if (IsTradeAllowed()) {
            orderId = OrderSend(NULL, OP_SELL, volume, Bid, 10,sl, tp);
            Alert("Sell Limit ORDER CREATED " + orderId);
         };
      } else {
         Print("Not order added");
      }
      
      if (orderId < 0) {
         Alert("Error: " + GetLastError());
      }
   }
   

   
   
   
  }
//+------------------------------------------------------------------+
