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
                Bid[] memory tempLedger = new Bid[](BidLedger.length - i);
                for(uint j = 0; j < tempLedger.length; j++) {
                    tempLedger[j] = BidLedger[j+i];
                }
                BidLedger[i] = b;
                BidLedger.length += 1;
                for(uint k = 0; k < tempLedger.length; k++) {
                    BidLedger[k+i+1] = tempLedger[k];
                }
                return true;
            }
        }
        BidLedger.push(b);
        return true;
    }

    function submitAsk(uint _price, uint _amount) returns (bool) {
        Ask memory a;
        a.price = _price;
        a.amount = _amount;
        for(uint i = 0; i < AskLedger.length; i++) {
            if(AskLedger[i].price < _price) {
                return false;
            }
        }
        AskLedger.push(a);
        return true;
    }

}
