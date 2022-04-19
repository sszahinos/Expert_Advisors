//+------------------------------------------------------------------+
//|                                             CalculadoraLotes.mqh |
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
void calculateLotSize(){
   double accEquity = AccountEquity();
   Alert(MarketInfo(NULL, MODE_LOTSIZE));
}
