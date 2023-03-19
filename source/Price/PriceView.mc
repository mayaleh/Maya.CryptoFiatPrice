import Toybox.WatchUi;
import Toybox.System;
import Toybox.Lang;
import Toybox.Graphics;

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
        
        var priceText = _vm.currentRate.getPriceText();
        var infoLabel = View.findDrawableById("PriceLabel") as Text;
        infoLabel.setText(priceText);
        
        var coinText = _vm.currentRate.getCoinText();
        var coinLabel = View.findDrawableById("CoinLabel") as Text;
        coinLabel.setText(coinText);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
}