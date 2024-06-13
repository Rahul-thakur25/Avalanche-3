// -------------Assessment requirements------
// Only contract owner should be able to mint tokens
// Any user can transfer tokens
// Any user can burn tokens

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token{
     
     address Owner;
     uint256 Tokens;

     mapping(address => uint256) public balance;

     constructor(){
        Owner = msg.sender;
     }

     function MintToken(address to ,uint256 _num)public{
          require(Owner==msg.sender,"You are not authorized");
          Tokens += _num;
          balance[to] += _num;
     }

     function BurnToken(uint256 _num) public{
          require(balance[msg.sender]>=_num , "Insufficient balance");
          Tokens -= _num;
          balance[msg.sender] -= _num;
     }
     
     function TransferTokens(address to , uint256 _num) public{
          require(balance[msg.sender]>=_num, "Insufficient balance");
          balance[msg.sender] -= _num;
          balance[to] += _num;
     }

     function TotalTokens()public view returns (uint256){
           return Tokens;
     }
}