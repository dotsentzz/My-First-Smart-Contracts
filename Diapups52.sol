// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Diapups52 is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    constructor() ERC721("Diapups52", "DPUPS") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    function createNFT(string memory tokenURI) public onlyOwner returns (uint256) {
        uint256 newItemId = tokenCounter;
        
        _safeMint(msg.sender, newItemId);
        
        _setTokenURI(newItemId, tokenURI);
        
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }
}
