import Toybox.System;

(:glance,:background)
class LoggerHelper {
    (:debug)
    public static function debug(message) {
        System.println(message);
    }

    (:release)
    public static function debug(message) {
        
    }
}