using Toybox.System;
using Toybox.Communications;

class HttpClient {
    
    function initialize() {
    }

    public function getJson(url as Lang.String, params as Lang.Dictionary or Null, callback as Method(responseCode as Lang.Number, data as Lang.Dictionary or Null)) 
    {
       var options = {
         :method => Toybox.Communications.HTTP_REQUEST_METHOD_GET,
         :responseType => Toybox.Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
       };

       Toybox.Communications.makeWebRequest(url, params, options, callback);
    }
}