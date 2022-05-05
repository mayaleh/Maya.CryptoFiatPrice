using Toybox.System;


class SelectCoinViewModel
{
    public var selectedCoin;
    public var currentOption;
    public var isCoinSelected = false;

    private var _currencies = ["BTC", "ETH"];
    private var _current = 0;

    function initialize()
    {
        currentOption = _currencies[_current];
    }

    public function onSelect()
    {
        selectedCoin = currentOption;
        isCoinSelected = true;
    }

    public function onNext()
    {
        _current = changeTo(1);
        currentOption = _currencies[_current];
    }

    public function onPrev()
    {
        _current = changeTo(-1);
        currentOption = _currencies[_current];
    }

    private function changeTo(step)
    {
        var pos = _current + step;

        if(pos >= _currencies.size())
        {
            return 0;
        }

        if(pos < 0)
        {
            return _currencies.size() - 1;
        }

        return pos;
    }
}