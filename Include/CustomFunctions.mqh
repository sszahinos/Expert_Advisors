//+------------------------------------------------------------------+
//|                                              CustomFunctions.mqh |
//|                                                   Sergio Sanchez |
//|                                     https://github.com/sszahinos |
//+------------------------------------------------------------------+
#property copyright "Sergio Sanchez"
#property link      "https://github.com/sszahinos"
#property strict
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+

double GetPipValue() {
   if(_Digits >= 4) {
      return 0.0001;
   } else {
      return 0.01;
   }
}

double CalculateLongTakeProfit(double entry, int pips) {
   return entry + pips * GetPipValue();
}

double CalculateLongStopLoss(double entry, int pips) {
   return entry - pips * GetPipValue();
}

double CalculateShortTakeProfit(double entry, int pips) {
   return entry - pips * GetPipValue();
}

double CalculateShortStopLoss(double entry, int pips) {
   return entry + pips * GetPipValue();
}

//GENERAL
bool isTradingAllowed() { //IsTradeAllowed(Symbol(), TimeCurrent())
   bool allowed = false;
   string message = "AutoTrade is DISABLED";
   if (IsTradeAllowed()) {
      allowed = true;
      message = "AutoTrade is ENABLED";
   } else {
      Alert(message);
   }
   Print(message);
   return allowed;
}

bool checkOpenOrdersByMagicNum(int magicNum) {
   bool found = false;
   int openOrders = OrdersTotal();
   
   for(int i=0;i<openOrders;i++) {
      if (OrderSelect(i,SELECT_BY_POS) && OrderMagicNumber() == magicNum) {
         //El EA con el magicNum tal, ya tiene una orden activa.
         found = true;
         break;
      }      
   }
   
   return found;
}