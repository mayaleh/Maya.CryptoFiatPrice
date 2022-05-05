using Toybox.WatchUi;
using Toybox.System;

class PriceDelegate extends Toybox.WatchUi.BehaviorDelegate{
    private var _vm;

    function initialize(vm)
    {
        BehaviorDelegate.initialize();
        _vm = vm;
    }

    function onNextPage()
    {
        _vm.onNext();
        Toybox.WatchUi.requestUpdate();
        return true;
    }

    function onPreviousPage() 
    {
        _vm.onPrev();
        Toybox.WatchUi.requestUpdate();
        return true;
    }
}