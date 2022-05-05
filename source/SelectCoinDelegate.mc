import Toybox.WatchUi;
using Toybox.System;

class SelectCoinDelegate extends Toybox.WatchUi.BehaviorDelegate {
    private var _vm;
    private var _httpClient;

    private var _currencies = ["USD", "EUR", "GBP", "CZK", "CNY", "CAD", "AUD"];

    function initialize(vm as SelectCoinViewModel) {
        BehaviorDelegate.initialize();
        _vm = vm;
        _httpClient = new HttpClient();
    }

    function onNextPage()
    {
        _vm.onNext();
        Toybox.WatchUi.requestUpdate();
        return true;
    }

    // This is typically triggered by the up button (KEY_UP) or by a SWIPE_DOWN SwipeEvent on a touch screen.
    function onPreviousPage() 
    {
        _vm.onPrev();
        Toybox.WatchUi.requestUpdate();
        return true;
    }

    // This is typically triggered by the Start/Enter button (KEY_ENTER) or by a CLICK_TYPE_TAP ClickEvent on a touch screen.
    function onSelect() {
        _vm.onSelect();

        var query = {
                "base" => _vm.selectedCoin[0]
            };
        
        var responseCallback = method(:onResponse);
        _httpClient.getJson("https://blockchain.info/ticker", query, method(:onResponse));
        
        //Toybox.WatchUi.requestUpdate();
        return true; // true if handled, otherwise false
    }

    function onResponse(responseCode, data)
    {   
        if (responseCode == 200) {
            
            var rates = new[_currencies.size()];

            for( var i = 0; i < _currencies.size(); i += 1 )
            {
                rates[i] = getPriceForCurrency(data, _currencies[i], _vm.selectedCoin[0]);
            }
            var priceViewMode = new PriceViewModel(rates);
            Toybox.WatchUi.switchToView(new PriceView(priceViewMode), new PriceDelegate(priceViewMode), Toybox.WatchUi.SLIDE_IMMEDIATE);
        }
        else {
            System.println("Response error");
        }
    }

    function getPriceForCurrency(data, currency, coin)
    {
        var rate = data.get(currency);
        return new RateCurrency(coin, currency, rate.get("buy"));
    }
}
