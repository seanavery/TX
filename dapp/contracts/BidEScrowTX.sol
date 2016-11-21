Skip to content
This repository
Search
Pull requests
Issues
Gist
 @SeanAvery
 Unwatch 1
  Star 0
 Fork 0 SeanAvery/TribeExchangeTX
 Code  Issues 0  Pull requests 0  Projects 0  Wiki  Pulse  Graphs  Settings
Branch: master Find file Copy pathTribeExchangeTX/contractsTX/BidEscrowTX.sol
4786f06  19 days ago
@SeanAvery SeanAvery sendFunds function to matched sellers
1 contributor
RawBlameHistory
52 lines (39 sloc)  1.09 KB
pragma solidity ^0.4.3;

import "ExchangeTX.sol";

contract BidEscrow {

    struct Bid {
        address bidder;
        uint blockstamp;
        uint amount;
        uint price;
    }

    Bid public BidInfo;

    bool Response;

    function BidEscrow(uint _amount, uint _price) {
        BidInfo.bidder = msg.sender;
        BidInfo.blockstamp = now;
        BidInfo.amount = _amount;
        BidInfo.price = _price;

        Response = false;
    }

    modifier sufficientFunds() {
        if(msg.value < BidInfo.amount * BidInfo.price) throw;
        _;
    }

    function withdrawFunds() {
        if(Response) {
            //send ether to Bid.bidder
            BidInfo.bidder.send(this.balance);
        }
    }


    function submitToExchange() sufficientFunds() returns(bool) {
        ExchangeTX e = ExchangeTX(0x692a70d2e424a56d2c6c27aa97d1a86395877b3a);
        e.submitBid(BidInfo.price, BidInfo.amount);
        return true;
    }

    function sendFunds(address _seller_address) returns(bool) {
        _seller_address.send(this.balance);
        Response = true;
        return true;
    }
}
Contact GitHub API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Status Help
