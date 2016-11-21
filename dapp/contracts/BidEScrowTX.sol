pragma solidity ^0.4.0;

import 'ExchangeTX.sol';

contract BidEscrowTX {
    struct Bid {
        uint price;
        uint amount;
    }

    Bid public bid;
    address public exchange_address;

    function BidEscrowTX(uint _price, uint _amount, address _exchange) {
        bid.price = _price;
        bid.amount = _amount;
        exchange_address = _exchange;
    }

    modifier sufficientFunds() {
        if(msg.value < bid.price * bid.amount) throw;
        _;
    }

    function submitToExchange() returns (bool) {
        ExchangeTX e = ExchangeTX(exchange_address);
        e.submitBid(bid.price, bid.amount);
        return true;
    }
}
