pragma solidity >=0.4.24 <0.6.11;
pragma experimental ABIEncoderV2;

import "./Table.sol";

contract TableTest {
    event CreateResult(int256 count);
    event InsertResult(int256 count);
    // event UpdateResult(int256 count);
    // event RemoveResult(int256 count);
    mapping(string => int256) sensorTimeMap;
    TableFactory tableFactory;
    string constant TABLE_NAME = "sensor_info";

    constructor() public {
        tableFactory = TableFactory(0x1001); //The fixed address is 0x1001 for TableFactory
        // the parameters of createTable are tableName,keyField,"vlaueFiled1,vlaueFiled2,vlaueFiled3,..."
        tableFactory.createTable(TABLE_NAME, "sensor_id", "code,temp,time");
    }

    //select records
    function select(string memory id)
        public
        view
        returns (
            string[] memory,
            int256[] memory,
            int256[] memory
        )
    {
        Table table = tableFactory.openTable(TABLE_NAME);
        int256 sensorTime = sensorTimeMap[id] - 60;
        Condition condition = table.newCondition();
        condition.EQ("sensor_id", id);
        condition.GT("time", sensorTime);

        Entries entries = table.select(id, condition);
        string[] memory id_list = new string[](uint256(entries.size()));
        int256[] memory temp_list = new int256[](uint256(entries.size()));
        int256[] memory time_list = new int256[](uint256(entries.size()));
        for (int256 i = 0; i < entries.size(); ++i) {
            Entry entry = entries.get(i);
            id_list[uint256(i)] = entry.getString("sensor_id");
            temp_list[uint256(i)] = entry.getInt("temp");
            time_list[uint256(i)] = entry.getInt("time");
        }

        return (id_list, temp_list, time_list);
    }

    //insert records
    function insert(
        string memory sensor_id,
        string memory code,
        int256 temp,
        int256 time
    ) public returns (int256) {
        sensorTimeMap[sensor_id] = time;
        Table table = tableFactory.openTable(TABLE_NAME);

        Entry entry = table.newEntry();
        entry.set("sensor_id", sensor_id);
        entry.set("code", code);
        entry.set("temp", temp);
        entry.set("time", time);

        int256 count = table.insert(sensor_id, entry);
        emit InsertResult(count);

        return count;
    }
    //update records
    // function update(string memory name, int256 item_id, string memory item_name)
    // public
    // returns (int256)
    // {
    //     Table table = tableFactory.openTable(TABLE_NAME);

    //     Entry entry = table.newEntry();
    //     entry.set("item_name", item_name);

    //     Condition condition = table.newCondition();
    //     condition.EQ("name", name);
    //     condition.EQ("item_id", item_id);

    //     int256 count = table.update(name, entry, condition);
    //     emit UpdateResult(count);

    //     return count;
    // }
    // //remove records
    // function remove(string memory name, int256 item_id) public returns (int256) {
    //     Table table = tableFactory.openTable(TABLE_NAME);

    //     Condition condition = table.newCondition();
    //     condition.EQ("name", name);
    //     condition.EQ("item_id", item_id);

    //     int256 count = table.remove(name, condition);
    //     emit RemoveResult(count);

    //     return count;
    // }
}
