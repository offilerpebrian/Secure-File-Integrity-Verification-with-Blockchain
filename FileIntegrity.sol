// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FileIntegrity {
    struct FileRecord {
        string fileHash;
        uint256 timestamp;
        address uploader;
    }

    mapping(string => FileRecord) public files;

    event FileStored(string fileHash, address uploader, uint256 timestamp);

    function storeFileHash(string memory _fileHash) public {
        require(bytes(files[_fileHash].fileHash).length == 0, "File already stored!");
        files[_fileHash] = FileRecord(_fileHash, block.timestamp, msg.sender);
        emit FileStored(_fileHash, msg.sender, block.timestamp);
    }

    function verifyFile(string memory _fileHash) public view returns (bool, uint256, address) {
        if (bytes(files[_fileHash].fileHash).length != 0) {
            FileRecord memory rec = files[_fileHash];
            return (true, rec.timestamp, rec.uploader);
        }
        return (false, 0, address(0));
    }
}
