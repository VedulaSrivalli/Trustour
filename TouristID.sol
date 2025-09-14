// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TouristID {
    struct Tourist {
        string idHash;
        uint256 startDate;
        uint256 endDate;
    }

    mapping(address => Tourist) public tourists;

    function issueID(address user, string memory hash, uint256 startDate, uint256 endDate) public {
        tourists[user] = Tourist(hash, startDate, endDate);
    }

    function verifyID(address user) public view returns (string memory, uint256, uint256) {
        Tourist memory t = tourists[user];
        return (t.idHash, t.startDate, t.endDate);
    }
}
