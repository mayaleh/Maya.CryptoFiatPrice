import Toybox.System;
import Toybox.Communications;

(:glance,:background)
  class HttpClient {
      function initialize() {
      }

      public function getJson(url as Toybox.Lang.String, params as Toybox.Lang.Dictionary or Null, callback as Method(responseCode as Toybox.Lang.Number, data as Toybox.Lang.Dictionary or Null) as Void) as Void 
      {
        var options = {
          :method => Toybox.Communications.HTTP_REQUEST_METHOD_GET,
          :responseType => Toybox.Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
        };

        Toybox.Communications.makeWebRequest(url, params, options, callback);
      }
  }