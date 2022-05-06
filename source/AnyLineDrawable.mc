using Toybox.Math;
using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;

class AnyLineDrawable extends Toybox.WatchUi.Drawable {
    private var _startX;
    private var _startY;
    private var _endX;
    private var _endY;
    private var _color;
    
    function initialize(params) {
        Drawable.initialize(params);

        _startX = params.get(:startX);
        _startY = params.get(:startY);
        _endX = params.get(:endX);
        _endY = params.get(:endY);
        _color = params.get(:color);
    }

    // todo draw part of cyrcle

    function draw(dc as Dc) as Void {

        dc.setColor(_color, _color);
        
        dc.drawLine(_startX, _startY, _endX, _endY);
    }
}