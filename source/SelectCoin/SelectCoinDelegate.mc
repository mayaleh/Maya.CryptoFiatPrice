import Toybox.WatchUi;
using Toybox.System;

class SelectProgressDelegate extends Toybox.WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onBack() {
        return true;
    }
}

class SelectCoinDelegate extends Toybox.WatchUi.BehaviorDelegate {
    private var _progressBar;

    private var _vm;
    private var _httpClient;

    private var _currencies = [AppConstants.Usd, "EUR", "GBP", "CZK", "CNY", "CAD", "AUD"];

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

        _progressBar = new Toybox.WatchUi.ProgressBar(
            "Processing...",
            null
        );

        Toybox.WatchUi.pushView(
            _progressBar,
            new SelectProgressDelegate(),
            WatchUi.SLIDE_DOWN
        );

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
        Toybox.WatchUi.popView(Toybox.WatchUi.SLIDE_IMMEDIATE);
        if (responseCode == 200) {
            
            var rates = new[_currencies.size()];

            for( var i = 0; i < _currencies.size(); i += 1 )
            {
                rates[i] = getPriceForCurrency(data, _currencies[i], _vm.selectedCoin[0]);
            }
            var priceViewMode = new PriceViewModel(rates);
            Toybox.WatchUi.switchToView(new PriceView(priceViewMode), new PriceDelegate(priceViewMode), Toybox.WatchUi.SLIDE_RIGHT);
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
