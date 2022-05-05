using Toybox.System;
using Toybox.Lang;

class RateCurrency
{
    private var _cryto;
    private var _currency;
    private var _buy;
    
    function initialize(cryto, currency, buy) {
        _cryto = cryto.toString();   
        _currency = currency.toString();
        _buy = buy;
    }

    public function getMessage()
    {
        return _cryto + ": " + _buy.format("%0.2f") + " " + _currency;
    }
}