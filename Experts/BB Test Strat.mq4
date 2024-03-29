//+------------------------------------------------------------------+
//|                                                BB Test Strat.mq4 |
//|                                                   Sergio Sanchez |
//|                                     https://github.com/sszahinos |
//+------------------------------------------------------------------+
#property copyright "Sergio Sanchez"
#property link      "https://github.com/sszahinos"
#property version   "1.00"
#property strict
#include <CustomFunctions.mqh>
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
//VAR
double entryPoint; //Lower or upper band stdev 1
double tp; //mid band stdev1
double sl; //lower or upper band stdev 4
double bbUpper1;
double bbMid1;
double bbLower1;
double bbUpper2;
double bbLower2;
double volume;

int bbPeriod;
int bb1StdDev;
int bb2StdDev;
int orderId;
int magicNum;


int OnInit()
  {
   //--- EA Started
   volume = MarketInfo(NULL, MODE_MINLOT);
   bbPeriod = 20;
   bb1StdDev = 1;
   bb2StdDev = 4;
   orderId = 0;
   magicNum = 1;
   //---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- EA Closed
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//--- On every price change
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
            orderId = OrderSend(NULL, OP_BUY, volume, Ask, 10, sl, tp, NULL, magicNum); //Se debería usar buylimit
            Alert("Buy limit ORDER CREATED " + orderId);
         };
      } else if (Bid > bbUpper1) {
         //Sell
         tp = NormalizeDouble(bbMid1, Digits);
         sl = NormalizeDouble(bbUpper2, Digits);
         Alert("SELL -> Entry: "+Bid + " TP: " + tp +" SL: " + sl);  
         if (IsTradeAllowed()) {
            orderId = OrderSend(NULL, OP_SELL, volume, Bid, 10,sl, tp, NULL, magicNum);
            Alert("Sell Limit ORDER CREATED " + orderId);
         };
      }
      
      if (orderId < 0) {
         Alert("Error: " + GetLastError());
      }
   } else {
      //Order update if indicator moves.
      if (OrderSelect(orderId,SELECT_BY_TICKET)) {
         int orderType = OrderType(); //0 = long, 1 = short
         
         /*double currentExitPoint;
         if (orderType == 0) {//long pos
            currentExitPoint = NormalizeDouble(bbLower2, Digits);
         } else { //short pos
            currentExitPoint = NormalizeDouble(bbUpper2, Digits);
         }*/
         
         double currentMidLine = NormalizeDouble(bbMid1, Digits);
         
         double TP2 = OrderTakeProfit();
         double SL2 = OrderStopLoss();
         
         if (TP2 != currentMidLine) { //Si se ha movido el TP
            OrderModify(orderId,OrderOpenPrice(),SL2, currentMidLine,0);
         }
      }
      
   }
  }
//+------------------------------------------------------------------+
