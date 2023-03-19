import Toybox.Math;
import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.System;
import Toybox.Lang;
import Toybox.Time;
import Toybox.Background;
import Toybox.Application;

(:glance,:background)
class ProgramApp extends Application.AppBase {
    private var _viewModel;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // This fires when the background service returns
    function onBackgroundData(data) {
        LoggerHelper.debug("action=ProgramApp.onBackgroundData, message=executing");
        Application.getApp().setProperty(AppConstants.AppRateUsdVar, data[AppConstants.AppRateUsdVar]);
        WatchUi.requestUpdate();
    }  

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        if (!System.getDeviceSettings().phoneConnected) {
            
        }

        _viewModel = new SelectCoinViewModel();

        return [ 
            new SelectCoinView(_viewModel),
            new SelectCoinDelegate(_viewModel)
         ] as Array<Views or InputDelegates>;
    }

    function getGlanceView()
    {

        if(Background.getTemporalEventRegisteredTime() == null) 
        {
            try{
                Background.registerForTemporalEvent(new Time.Duration(60*5));
            }catch( ex instanceof Lang.Exception ) {
                LoggerHelper.debug("action=ProgramApp.getGlanceView, error=" + ex.getErrorMessage());
            }
        }
        else
        {
            LoggerHelper.debug("action=ProgramApp.getGlanceView, message=Background.getTemporalEventRegisteredTime is not null");
        }

        return [ 
            new AppGlanceView()
         ];
    }

     function getServiceDelegate(){
        return [ new RateServiceDelegate() ];
    }
}

function getApp() {
    return Application.getApp();
}