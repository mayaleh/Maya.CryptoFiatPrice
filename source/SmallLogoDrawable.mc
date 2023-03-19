import Toybox.Math;
import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.System;
import Toybox.Lang;

class SmallLogoDrawable extends Toybox.WatchUi.Drawable {
    private var _x;
    private var _y;
    
    function initialize(params) {
        Drawable.initialize(params);

        _x = params.get(:x);
        _y = params.get(:y);
    }
    
    function draw(dc as Dc) as Void {
        
        var image = Toybox.Application.loadResource( Rez.Drawables.SmallIcon ) as BitmapResource;

        if(_x == -1)
        {
            _x =  dc.getWidth() / 2;
            var xShift = image.getWidth() / 2;
            _x = _x - xShift;
        }

        if(_y == -1)
        {
            _y =  dc.getHeight() / 2;
            var yShift = image.getHeight() / 2;
            _y = _y - yShift;
        }
        
        dc.drawBitmap(_x, _y, image);
    }
}