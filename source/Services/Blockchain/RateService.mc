import Toybox.System;
import Toybox.Communications;

(:glance,:background)
class RateService
{
    public static function loadRate(httpClient as HttpClient, coin as Toybox.Lang.String, response as Method(responseCode as Toybox.Lang.Number, data as Toybox.Lang.Dictionary or Null) as Void) as Void
    {
        var query = {
                "base" => coin
            };

        httpClient.getJson("https://blockchain.info/ticker", query, response);
    }
}