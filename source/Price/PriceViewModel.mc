class PriceViewModel
{
    public var currentRate;
    
    private var _rates;
    private var _current = 0;

    function initialize(rates as Toybox.Lang.Array<RateCurrency>)
    {
        _rates = rates;
        currentRate = _rates[_current];
    }

    public function onNext()
    {
        _current = changeTo(1);
        currentRate = _rates[_current];
    }

    public function onPrev()
    {
        _current = changeTo(-1);
        currentRate = _rates[_current];
    }

    private function changeTo(step)
    {
        var pos = _current + step;

        if(pos >= _rates.size())
        {
            return 0;
        }

        if(pos < 0)
        {
            return _rates.size() - 1;
        }

        return pos;
    }
}