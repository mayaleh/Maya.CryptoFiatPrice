import Toybox.Graphics;
import Toybox.WatchUi;
using Toybox.System;
using Toybox.Communications;



class SelectCoinView extends WatchUi.View {
    private var _vm;

    function initialize(vm as SelectCoinViewModel) {
        View.initialize();
        _vm = vm;
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        setInfoText("Please, choose the currency:");

        if(_vm.currentOption == null)
        {
            setCurrentOptionText("loading currencies...");
            View.onUpdate(dc);
            return;
        }else
        {
            setCurrentOptionText(_vm.currentOption);
        }

        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    function setInfoText(text)
    {
        var infoLabel = View.findDrawableById("SelectedLabel") as Text;
        infoLabel.setText(text);
    }

    function setCurrentOptionText(text)
    {
        var infoLabel = View.findDrawableById("OptionLabel") as Text;
        infoLabel.setText(text);
    }
}
