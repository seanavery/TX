pragma solidity ^0.4.0;

import 'ExchangeTX.sol';

contract BidEscrowTX {
    struct Bid {
        uint price;
        uint amount;
    }

    Bid public bid;

    function BidEscrowTX(uint _price, uint _amount) {
        bid.price = _price;
        bid.amount = _amount;
    }

    modifier sufficientFunds() {
        if(msg.value < bid.price * bid.amount) throw;
        _;
    }

    function submitToExchange() returns (bool) {
        ExchangeTX e = ExchangeTX(0x692a70d2e424a56d2c6c27aa97d1a86395877b3a);
        e.submitBid(bid.price, bid.amount);
        return true;
    }
}
