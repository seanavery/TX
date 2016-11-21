pragma solidity ^0.4.0;

import 'ExchangeTX.sol';

contract AskEscrowTX {
    struct Ask {
        uint price;
        uint amount;
    }

    Ask public ask;
    address public exchange_address;

    function AskEscrowTX(uint _price, uint _amount, address _exchange) {
        ask.price = _price;
        ask.amount = _amount;
        exchange_address = _exchange;
    }

    function submitToExchnage () returns (bool) {
        ExchangeTX e = ExchangeTX(exchange_address);
        e.submitAsk(ask.price, ask.amount);
        return true;
    }
}
