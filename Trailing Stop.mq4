//+------------------------------------------------------------------+
//|                                                Trailing Stop.mq4 |
//|                               Copyright 2021, Umuziwandile Nkomo |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, Umuziwandile Nkomo"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict


#define LIC_TRADE_MODES  {ACCOUNT_TRADE_MODE_CONTEST, ACCOUNT_TRADE_MODE_DEMO}
//#define LIC_SYMBOLS {"BOOM 500"}
//#define LIC_EXPIRES_DAYS 30
//#define LIC_EXPIRES_START D'2021.09.01'

#include <Muzi\TradeFunctions.mqh>
#include <Muzi\LicenseCheck\LicenseCheck.mqh>

input int InpMagicNumber = 0;
input double InpGap =  0.005;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   ApplyTrailingStop(Symbol(),InpMagicNumber, ORDER_TYPE_BUY,GetTrailingStopPrice(Symbol(),ORDER_TYPE_BUY,InpGap));
   ApplyTrailingStop(Symbol(),InpMagicNumber, ORDER_TYPE_SELL,GetTrailingStopPrice(Symbol(),ORDER_TYPE_SELL,InpGap));
  }
//+------------------------------------------------------------------+
