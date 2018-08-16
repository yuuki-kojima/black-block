pragma solidity ^0.4.22;

contract BlackBlock {

  struct List {
    string listHash;
    string searchKey;
  }

  mapping (uint => address) public listToOwner;
  mapping (address => uint[]) listsFromOwner;
  mapping (string => string) searchKeyToHash;

  List[] public lists;

  function newList(string _listHash, string _searchKey) public {
    List memory list = List(_listHash, _searchKey);
    uint listId = lists.push(list) - 1;
    listToOwner[listId] = msg.sender;
    listsFromOwner[msg.sender].push(listId);
    searchKeyToHash[_searchKey] = _listHash;
  }

  function getListFromSearchKey(string _searchKey) public view returns (string) {
    return searchKeyToHash[_searchKey];
  }

  function getListsFromOwner(address _owner) public view returns (uint[]) {
    return listsFromOwner[_owner];
  }

}
