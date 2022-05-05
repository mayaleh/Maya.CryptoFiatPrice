using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;
using Toybox.Graphics;

class RateCurrency
{
    private var _cryto;
    private var _currency;
    private var _buy;
    
    function initialize(cryto, currency, buy) {
        _cryto = cryto.toString();   
        _currency = currency.toString();
        _buy = buy;
    }

    public function getMessage()
    {
        return _cryto + ": " + _buy.format("%0.2f") + " " + _currency;
    }
}

class PriceView extends WatchUi.View {
    private var _vm;
    function initialize(vm)
    {
        View.initialize();
        _vm = vm;
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.PriceLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        var message = _vm.currentRate.getMessage();
        var infoLabel = View.findDrawableById("PriceLabel") as Text;
        infoLabel.setText(message);
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
}