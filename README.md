# CryptoFiat Garmin watch widget

my first app for learning prupose. The goal was to create a simple widget for my Garmin watch.

## Description

this app is allowing to explore the exchange rate of some crypto currencies.
First, the user is selecting the crypto currency or coin and then he is able to see the rate for different fiat currencies.

## Solution

the rates are loaded from the [Blockchain.com](https://www.blockchain.com/) using http request. The [Blockchain.com](https://www.blockchain.com/) API is easy to use, it does not require any auth and it is free to ask about the exchange rate.

the solution contains theese features:

- [BehaviorDelegate](https://developer.garmin.com/connect-iq/api-docs/Toybox/WatchUi/BehaviorDelegate.html) for handling the watch controls
- [Glance View](https://developer.garmin.com/connect-iq/api-docs/Toybox/WatchUi/GlanceView.html) for simple view fo glance nav
- switching between the views
- reusable drawing (like a parametrised components)
- rendering bitmaps, changing content


If this source code was useful for you or the you like the app, you can support me:
[♥ Sponsor](https://github.com/sponsors/mayaleh) or
![BTC donate](btc-donate.png "BTC") or ![LTC donate](ltc-donate.png "LTC") 
