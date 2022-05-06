using Toybox.Math;
using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;

class AnyArcDrawable extends Toybox.WatchUi.Drawable {
    private var _centerX;
    private var _centerY;
    private var _direct;
    private var _barThickness;
    private var _barGap;
    private var _radius;
    private var _startDegree;
    private var _endDegree;
    private var _color;
    
    function initialize(params) {
        Drawable.initialize(params);

        _radius = params.get(:radius);
        _barThickness = params.get(:barThickness);
        _barGap = params.get(:barGap);
        _direct = params.get(:direct);
        _startDegree = params.get(:startDegree);
        _endDegree = params.get(:endDegree);
        _color = params.get(:color);
    }

    // todo draw part of cyrcle

    function draw(dc as Dc) as Void {
        _centerX = dc.getWidth() / 2;
        _centerY = dc.getHeight() / 2;

        dc.setColor(_color, _color);
        if(_barGap > 0) // if there is a gap, then render double arc else single arc
        {
            for(var i = 0; i < _barThickness; i++){ // 1 draw == 1px line
                dc.drawArc(_centerX, _centerY, _radius - i, _direct, _startDegree, _endDegree);
                dc.drawArc(_centerX, _centerY, _radius - _barThickness - _barGap - i, _direct, _startDegree, _endDegree);
            }
            return;
        }

        for(var i = 0; i < _barThickness; i++){ // 1 draw == 1px line
            dc.drawArc(_centerX, _centerY, _radius - i, _direct, _startDegree, _endDegree);
        }
    }
}