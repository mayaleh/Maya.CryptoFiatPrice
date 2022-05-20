using Toybox.Math;
using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Time;
using Toybox.Background;
using Toybox.Application;

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

    function getGlanceView() as Array<GlanceView or GlanceViewDelegate>
    {

        if(Background.getTemporalEventRegisteredTime() != null) 
        {
            Background.registerForTemporalEvent(new Time.Duration(60*5));
        }

        return [ 
            new AppGlanceView()
         ] as Array<GlanceView or GlanceViewDelegate>;
    }

     function getServiceDelegate(){
        return [ new RateServiceDelegate() ];
    }
}

function getApp() as SelectCoinApp {
    return Application.getApp() as SelectCoinApp;
}