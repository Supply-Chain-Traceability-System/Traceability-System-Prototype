pragma solidity >= 0.5.0 < 0.7.4;

contract Trace {

    mapping(string => string) baseInfoMap;  
    mapping(string => string) logisticsMap;
    mapping(string => string) storeMap;        

    function saveData(string memory id, string memory data, uint type) public {
	if(type == 1) {
		baseInfoMap[id] = data;
	} else if(type == 2){
		logisticsMap[id] = data;
	} else if(type == 3){
		storeMap[id] = data;
	}
    }

    function queryData(string memory id) public returns(string memory, string memory, string memory) {
        string memory str1 = baseInfoMap[id];
        string memory str2 = logisticsMap[id];
        string memory str3 = storeMap[id];
        return (str1, str2, str3);
    }

}
