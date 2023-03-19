import Toybox.Application;
import Toybox.Background;
import Toybox.System;
import Toybox.WatchUi;

(:background)
class RateServiceDelegate extends System.ServiceDelegate {
    
    private var _httpClient as HttpClient;

    function initialize() {
        System.ServiceDelegate.initialize();
        
        _httpClient = new HttpClient();
    }

    function onTemporalEvent() {
        RateService.loadRate(_httpClient, "BTC", method(:onRateLoad));
    }

    function onRateLoad(responseCode as Toybox.Lang.Number, data as Toybox.Lang.Dictionary or Null) as Void
    {
        var nowDt = Toybox.Time.Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var dateString = Toybox.Lang.format(
            "$1$:$2$",
            [
                nowDt.hour < 10 ? "0" + nowDt.hour : nowDt.hour,
                nowDt.min < 10 ? "0" + nowDt.min : nowDt.min,
            ]
        );
        

        LoggerHelper.debug("action=RateServiceDelegate.onRateLoad, message=" + dateString);
        var bgData = Background.getBackgroundData();
        if (bgData == null) {
            bgData = {};
		}

        try{
            bgData.remove(AppConstants.AppRateUsdVar);
        }
        catch( ex ){
        }

        if (responseCode == 200) {
            
            var rateUsd = data.get(AppConstants.Usd);

            var msg = Toybox.Lang.format(
                "$1$: $2$ $3$ $4$",
                [
                    AppConstants.Btc,
                    rateUsd.get("buy").format(AppConstants.NrFormat),
                    AppConstants.Usd,
                    dateString,
                ]
            );
            
            bgData.put(AppConstants.AppRateUsdVar, msg);
            
            Background.exit(bgData);
        }
        else {
            System.println("Response error");
            bgData.put(AppConstants.AppRateUsdVar, "Could not load rate: " + responseCode);
        }

        Background.exit(bgData);
    }
}