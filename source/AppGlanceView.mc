import Toybox.Math;
import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.System;
import Toybox.Lang;
import Toybox.Time;
import Toybox.Background;
import Toybox.Application;

(:glance)
public class AppGlanceView extends Toybox.WatchUi.GlanceView
{
    function initialize()
    {
        Toybox.WatchUi.GlanceView.initialize();
    }


    // Load your resources here
    function onLayout(dc as Dc) 
    {
        try {
            setLayout(Rez.Layouts.AppGlanceLayout(dc)); // the layout must contain the scope attribute... found out after 6 hours of search because of bad docs and missing examples...
        }
        catch( ex instanceof Lang.Exception ) 
        {
            var e = ex.getErrorMessage();
            // Code to catch all execeptions
        }
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
        try
        {
            var rateUsd = Application.getApp().getProperty(AppConstants.AppRateUsdVar);
            LoggerHelper.debug("action=AppGlanceView.onShow, message=" + rateUsd+ " for " + AppConstants.AppRateUsdVar);
            if(rateUsd){
                setRateText(rateUsd);
            }
        }
        catch( ex instanceof Lang.Exception ) 
        {
            var e = ex.getErrorMessage();
            LoggerHelper.debug("action=AppGlanceView.onShow, error=" + e);
            // Code to catch all execeptions
        }
    }

    // Update the view
    function onUpdate(dc) {
        try{
            var rateUsd = Application.getApp().getProperty(AppConstants.AppRateUsdVar);
            LoggerHelper.debug("action=AppGlanceView.onUpdate, message=" + rateUsd + " for " + AppConstants.AppRateUsdVar);
            if(rateUsd){
                setRateText(rateUsd);
            }

            GlanceView.onUpdate(dc);
        }catch( ex instanceof Lang.Exception ) {
            var e = ex.getErrorMessage();
            LoggerHelper.debug("action=AppGlanceView.onUpdate, error=" + e);
        }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
    function setRateText(text)
    {
        try 
        {
            var infoLabel = GlanceView.findDrawableById("BtcRateLabel") as Text;
            infoLabel.setText(text);
        }
        catch( ex instanceof Lang.Exception ) 
        {
            var e = ex.getErrorMessage();
            // Code to catch all execeptions
        }
    }
}