import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

(:glance)
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

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        _viewModel = new SelectCoinViewModel();

        return [ 
            new SelectCoinView(_viewModel),
            new SelectCoinDelegate(_viewModel)
         ] as Array<Views or InputDelegates>;
    }

    function getGlanceView() as Array<GlanceView or GlanceViewDelegate>
    {
        return [ 
            new AppGlanceView()
         ] as Array<GlanceView or GlanceViewDelegate>;
    }
}

function getApp() as SelectCoinApp {
    return Application.getApp() as SelectCoinApp;
}