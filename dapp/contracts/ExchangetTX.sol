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

    // function submitBid(uint _price, uint _amount) returns (bool) {
    //     Bid memory b;
    //     b.price = _price;
    //     b.amount = _amount;
    //     BidLedger.push(b);
    //     return true;
    // }

    // function submitAsk(uint_price, uint _amount) returns (bool) {
    //     Ask memory a;
    //     a.price = _price;
    //     a.amount = _amount;
    //     AskLedger.push(a);
    //     return true;
    }

}
