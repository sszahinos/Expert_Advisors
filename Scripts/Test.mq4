//+------------------------------------------------------------------+
//|                                                         Test.mq4 |
//|                                                   Sergio Sanchez |
//|                                     https://github.com/sszahinos |
//+------------------------------------------------------------------+
#property copyright "Sergio Sanchez"
#property link      "https://github.com/sszahinos"
#property version   "1.00"
#property strict
//#property show_inputs

#include <CustomFunctions.mqh>
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart(){
   double volume = 0.01;
   double entry = 0.735;
   double sl = 0.720;
   double tp = 0.745;
   int orderId;
   int magicNum = 12345;
   
   Alert(MarketInfo(NULL, MODE_STOPLEVEL));
   
   /*
   sl = Ask-0.01;
   tp = Ask+0.01;
   int orderID = OrderSend(NULL,OP_BUY,volume,Ask,10,sl, tp);
   
   
   for(int i=0;i<5;i++)
   {
      Sleep(1000);
      sl -= 0.01;
      tp += 0.01;
      OrderModify(orderID,0,sl,tp,0);
   }*/
   
   /*
   int openOrders = OrdersTotal();
   checkOpenOrdersByMagicNum(magicNum);
   */
   //Alert(MarketInfo(NULL, MODE_STOPLEVEL));
   
   //Alert(MarketInfo(NULL, MODE_MINLOT));
   //int id = OrderSend(NULL, OP_BUYLIMIT, volume, entry , 10, sl, tp,NULL, magicNum);
   //if (id <0) Alert(Ask + " " + GetLastError());
   //Alert(GetLastError());
   
   /*isTradingAllowed();
   if (IsTradeAllowed()) {
      orderId = OrderSend(NULL, OP_BUYLIMIT, volume, entry, 10, sl, tp);
      Alert("ORDER CREATED " + orderId);
   };*/
   
   /*if(isTradingAllowed()) {
      
   } */
   //Alert(SymbolInfoDouble(NULL, SYMBOL_TRADE_CONTRACT_SIZE));
   //Alert(MarketInfo(NULL, MODE_MINLOT));



//RSI
/*int rsiPeriod = 14;
double rsiValue = iRSI(NULL, 0, rsiPeriod, PRICE_CLOSE, 0);
double rsiPrevValue = iRSI(NULL, 0, rsiPeriod, PRICE_CLOSE, 1);

if (rsiValue > 30 && rsiPrevValue < 30) {
   //Ha llegado por debajo de 30 -> comprar
}

Alert("rsi: " + NormalizeDouble(rsiValue, Digits));*/
//END RSI

//Bollinger bands
/*int bbPeriod = 20;
int bbStdDeviation = 2;

double bbUpperBand = iBands(NULL, 0, bbPeriod, bbStdDeviation, 0, PRICE_CLOSE, MODE_UPPER, 0);
double bbMidBand = iBands(NULL, 0, bbPeriod, bbStdDeviation, 0, PRICE_CLOSE, 0, 0);
double bbLowerBand = iBands(NULL, 0, bbPeriod, bbStdDeviation, 0, PRICE_CLOSE, 2, 0);

Alert(NormalizeDouble(bbUpperBand, Digits));
*/
//END BB


//MA
   /*int maPeriod = 20;
   //en las enums se puede
   double maValue = iMA(NULL, 0, maPeriod, 0, 0, 0, 0);
   Alert(NormalizeDouble(maValue, Digits));*/
//END MA
   
///////////////////////////////
   /*Print("PIPS: " + GetPipValue());
   
   double signalPrice = 1.08;
   int takeProfitPips = 40;
   int stopLossPips = 30;
   
   if(Ask < signalPrice){
      Print("BUY");
      double stopLossPrice = CalculateLongStopLoss(signalPrice, stopLossPips);
      double takeProfitPrice = CalculateLongTakeProfit(signalPrice, takeProfitPips);
      Print("Entry: " + Ask + " Stop: " + stopLossPrice + " TP: " + takeProfitPrice);
      
      //Send buy order
      
   } else if (Bid > signalPrice) {
      Print("SELL");
      double stopLossPrice = CalculateShortStopLoss(signalPrice, stopLossPips);
      double takeProfitPrice = CalculateShortTakeProfit(signalPrice, takeProfitPips);
      Print("Entry: " + Bid + " Stop: " + stopLossPrice + " TP: " + takeProfitPrice);
      
      //Send buy order
      
   }*/
   

}
//+------------------------------------------------------------------+

