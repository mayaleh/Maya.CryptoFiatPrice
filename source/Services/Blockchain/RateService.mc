using Toybox.System;
using Toybox.Communications;

(:glance,:background)
class RateService
{
    public static function loadRate(httpClient as HttpClient, coin as Lang.String, response as Method(responseCode as Lang.Number, data as Lang.Dictionary or Null))
    {
        var query = {
                "base" => coin
            };

        httpClient.getJson("https://blockchain.info/ticker", query, response);
    }
}