pragma solidity ^0.4.0;

contract ExchangeTX {
    struct Bid {
        uint price;
        uint amount;
    }
    struct Ask {
        uint price;
        uint amount;
    }

    Bid[] public BidLedger;
    Ask[] public AskLedger;

    function submitBid(uint _price, uint _amount) returns (bool) {
        Bid memory b;
        b.price = _price;
        b.amount = _amount;
        for(uint i = 0; i < BidLedger.length; i++) {
            if (BidLedger[i].price > _price) {
                return false;
            }
        }
        BidLedger.push(b);
        return true;
    }

    function submitAsk(uint _price, uint _amount) returns (bool) {
        Ask memory a;
        a.price = _price;
        a.amount = _amount;
        for(uint i = 0; i < AskLedger.Length; i++) {
            if(AskLedger[i] < _price) {
                return false;
            }
        }
        AskLedger.push(a);
        return true;
    }
}
