using Toybox.Math;
using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Time;
using Toybox.Background;
using Toybox.Application;

(:glance)
public class AppGlanceView extends Toybox.WatchUi.GlanceView
{
    function initialize()
    {
        Toybox.WatchUi.GlanceView.initialize();
    }


    // Load your resources here
    function onLayout(dc as Dc) {
        try {
            setLayout(Rez.Layouts.AppGlanceLayout(dc)); // the layout must contain the scope attribute... found out after 6 hours of search because of bad docs and missing examples...
        }
        catch( ex ) {
            var e = ex;
            // Code to catch all execeptions
        }
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        try{
            var rateUsd = Application.getApp().getProperty(AppConstants.AppRateUsdVar);
            LoggerHelper.debug("action=AppGlanceView.onUpdate, message=" + rateUsd);
            if(rateUsd){
                setRateText(rateUsd);
            }

            GlanceView.onUpdate(dc);
        }catch( ex ) {
            var e = ex.mMessage;
            LoggerHelper.debug("action=AppGlanceView.onUpdate, error=" + e);
            // Code to catch all execeptions
        }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
    function setRateText(text)
    {
        try {
            var infoLabel = GlanceView.findDrawableById("BtcRateLabel") as Text;
            infoLabel.setText(text);
        }
        catch( ex ) {
            var e = ex;
            // Code to catch all execeptions
        }
    }
}