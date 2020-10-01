pragma solidity ^0.5.17;
contract Assign1 {
    struct Order {
      uint quantity;
      uint cost;
    }


    mapping(address => bool) BeachT;
    mapping(uint => Order) public order;
    
    event Orderstat (
            uint indexed _quantity, uint indexed _cost
        );

    function setOrder(uint orderno, uint _quantity) public {
        
        order[orderno].quantity = _quantity;
        uint cost=0;
        order[orderno].cost = 0;
        
        BeachT[msg.sender]=true;
        emit Orderstat(_quantity,cost);
    }
    

    function AcceptOrder(uint orderno, uint _cost) public {
        require(!BeachT[msg.sender]);
        order[orderno].cost = _cost;
        uint quantity = order[orderno].quantity;
        emit Orderstat(quantity,_cost);
    }
    
}