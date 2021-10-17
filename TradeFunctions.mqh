//+------------------------------------------------------------------+
//|                                               TradeFunctions.mqh |
//|                               Copyright 2021, Umuziwandile Nkomo |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, Umuziwandile Nkomo"
#property link      "https://www.mql5.com"
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
void  ApplyTrailingStop(string symbol,int magicNumber,ENUM_ORDER_TYPE orderType,double price){

      bool result;
      for(int i= OrdersTotal()-1; i>=0; i--){
         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderType()==orderType) {
               if (OrderType()==ORDER_TYPE_BUY) {
                  if (OrderStopLoss()==0 || OrderStopLoss()<price || price==0) {
                     result = OrderModify(OrderTicket(),OrderOpenPrice(),price, OrderTakeProfit(), OrderExpiration());
                  }
                 }else if (OrderType()==ORDER_TYPE_SELL) {
                  if (OrderStopLoss()==0 || OrderStopLoss()<price || price==0) {
                     result = OrderModify(OrderTicket(),OrderOpenPrice(),price, OrderTakeProfit(), OrderExpiration());
                  }
                }
              }
            }
          }
         return;
            
}

double GetTrailingStopPrice(string symbol, ENUM_ORDER_TYPE orderType, double gap) {
   if (orderType%2==ORDER_TYPE_BUY) {
   return (NormalizeDouble(MarketInfo(symbol, MODE_BID)-gap, (int)MarketInfo(symbol, MODE_DIGITS)));
 } else if (orderType%2==ORDER_TYPE_SELL) {
   return (NormalizeDouble(MarketInfo(symbol, MODE_ASK)+gap, (int)MarketInfo(symbol, MODE_DIGITS)));
 }
 
 return(0);
 
 
}            