using Toybox.Application;
using Toybox.Background;
using Toybox.System;
using Toybox.WatchUi;
using Toybox.Time.Gregorian as Calendar;


(:background)
class RateServiceDelegate extends System.ServiceDelegate {
    
    private var _httpClient;

    function initialize() {
        System.ServiceDelegate.initialize();
        
        _httpClient = new HttpClient();
    }

    function onTemporalEvent() {
        RateService.loadRate(_httpClient, "BTC", method(:onRateLoad));
    }

    function onRateLoad(responseCode as Lang.Number, data as Lang.Dictionary or Null)
    {
        var nowDt = Calendar.info(Time.now(), Time.FORMAT_SHORT);
        var dateString = Lang.format(
            "$1$:$2$",
            [
                nowDt.hour,
                nowDt.min,
            ]
        );
        

        LoggerHelper.debug("action=RateServiceDelegate.onRateLoad, message=" + dateString);
        var bgData = Background.getBackgroundData();
        if (bgData == null) {
            bgData = {};
		}
        if (responseCode == 200) {
            
            var rateUsd = data.get(AppConstants.Usd);

            var msg = Lang.format(
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