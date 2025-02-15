package com.my.contract;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.fisco.bcos.sdk.abi.FunctionReturnDecoder;
import org.fisco.bcos.sdk.abi.TypeReference;
import org.fisco.bcos.sdk.abi.datatypes.Event;
import org.fisco.bcos.sdk.abi.datatypes.Function;
import org.fisco.bcos.sdk.abi.datatypes.Type;
import org.fisco.bcos.sdk.abi.datatypes.Utf8String;
import org.fisco.bcos.sdk.abi.datatypes.generated.tuples.generated.Tuple1;
import org.fisco.bcos.sdk.abi.datatypes.generated.tuples.generated.Tuple2;
import org.fisco.bcos.sdk.abi.datatypes.generated.tuples.generated.Tuple3;
import org.fisco.bcos.sdk.client.Client;
import org.fisco.bcos.sdk.contract.Contract;
import org.fisco.bcos.sdk.crypto.CryptoSuite;
import org.fisco.bcos.sdk.crypto.keypair.CryptoKeyPair;
import org.fisco.bcos.sdk.eventsub.EventCallback;
import org.fisco.bcos.sdk.model.CryptoType;
import org.fisco.bcos.sdk.model.TransactionReceipt;
import org.fisco.bcos.sdk.model.callback.TransactionCallback;
import org.fisco.bcos.sdk.transaction.model.exception.ContractException;

@SuppressWarnings("unchecked")
public class Evidence extends Contract {
    public static final String[] BINARY_ARRAY = {"608060405234801561001057600080fd5b50610a9c806100206000396000f3fe608060405234801561001057600080fd5b50600436106100415760003560e01c80632320b16b146100465780632a7a0f341461022f578063fa14c731146103cf575b600080fd5b61022d6004803603606081101561005c57600080fd5b810190808035906020019064010000000081111561007957600080fd5b82018360208201111561008b57600080fd5b803590602001918460018302840111640100000000831117156100ad57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f8201169050808301925050505050505091929192908035906020019064010000000081111561011057600080fd5b82018360208201111561012257600080fd5b8035906020019184600183028401116401000000008311171561014457600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f820116905080830192505050505050509192919290803590602001906401000000008111156101a757600080fd5b8201836020820111156101b957600080fd5b803590602001918460018302840111640100000000831117156101db57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f820116905080830192505050505050509192919290505050610521565b005b6102e86004803603602081101561024557600080fd5b810190808035906020019064010000000081111561026257600080fd5b82018360208201111561027457600080fd5b8035906020019184600183028401116401000000008311171561029657600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f820116905080830192505050505050509192919290505050610619565b604051808060200180602001838103835285818151815260200191508051906020019080838360005b8381101561032c578082015181840152602081019050610311565b50505050905090810190601f1680156103595780820380516001836020036101000a031916815260200191505b50838103825284818151815260200191508051906020019080838360005b83811015610392578082015181840152602081019050610377565b50505050905090810190601f1680156103bf5780820380516001836020036101000a031916815260200191505b5094505050505060405180910390f35b61051f600480360360408110156103e557600080fd5b810190808035906020019064010000000081111561040257600080fd5b82018360208201111561041457600080fd5b8035906020019184600183028401116401000000008311171561043657600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f8201169050808301925050505050505091929192908035906020019064010000000081111561049957600080fd5b8201836020820111156104ab57600080fd5b803590602001918460018302840111640100000000831117156104cd57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f8201169050808301925050505050505091929192905050506108f9565b005b6105296109a7565b6040518060400160405280848152602001838152509050806000856040518082805190602001908083835b602083106105775780518252602082019150602081019050602083039250610554565b6001836020036101000a038019825116818451168082178552505050505050905001915050908152602001604051809103902060008201518160000190805190602001906105c69291906109c1565b5060208201518160010190805190602001906105e39291906109c1565b509050507f02e682929ea92cf284475568499121b288af56d7ab9e719bdc559b2f0ce4df0760405160405180910390a150505050565b60608060606001846040518082805190602001908083835b602083106106545780518252602082019150602081019050602083039250610631565b6001836020036101000a03801982511681845116808217855250505050505090500191505090815260200160405180910390208054600181600116156101000203166002900480601f01602080910402602001604051908101604052809291908181526020018280546001816001161561010002031660029004801561071b5780601f106106f05761010080835404028352916020019161071b565b820191906000526020600020905b8154815290600101906020018083116106fe57829003601f168201915b5050505050905061072a6109a7565b6000826040518082805190602001908083835b60208310610760578051825260208201915060208101905060208303925061073d565b6001836020036101000a0380198251168184511680821785525050505050509050019150509081526020016040518091039020604051806040016040529081600082018054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156108375780601f1061080c57610100808354040283529160200191610837565b820191906000526020600020905b81548152906001019060200180831161081a57829003601f168201915b50505050508152602001600182018054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156108d95780601f106108ae576101008083540402835291602001916108d9565b820191906000526020600020905b8154815290600101906020018083116108bc57829003601f168201915b505050505081525050905080600001518160200151935093505050915091565b806001836040518082805190602001908083835b60208310610930578051825260208201915060208101905060208303925061090d565b6001836020036101000a038019825116818451168082178552505050505050905001915050908152602001604051809103902090805190602001906109769291906109c1565b507f4c58fce45e7dfe1602a10a0a4cb617a2734af1e74dbd78f4fe1745c6b669177f60405160405180910390a15050565b604051806040016040528060608152602001606081525090565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f10610a0257805160ff1916838001178555610a30565b82800160010185558215610a30579182015b82811115610a2f578251825591602001919060010190610a14565b5b509050610a3d9190610a41565b5090565b610a6391905b80821115610a5f576000816000905550600101610a47565b5090565b9056fea2646970667358221220f4196ead934c9dba4102c9fba490485766ded6c4a1616efa9579b05b15cbb7f964736f6c634300060a0033"};

    public static final String BINARY = org.fisco.bcos.sdk.utils.StringUtils.joinAll("", BINARY_ARRAY);

    public static final String[] SM_BINARY_ARRAY = {"608060405234801561001057600080fd5b50610a9c806100206000396000f3fe608060405234801561001057600080fd5b50600436106100415760003560e01c80632746b3e6146100465780639a4813881461022f578063a05406e214610381575b600080fd5b61022d6004803603606081101561005c57600080fd5b810190808035906020019064010000000081111561007957600080fd5b82018360208201111561008b57600080fd5b803590602001918460018302840111640100000000831117156100ad57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f8201169050808301925050505050505091929192908035906020019064010000000081111561011057600080fd5b82018360208201111561012257600080fd5b8035906020019184600183028401116401000000008311171561014457600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f820116905080830192505050505050509192919290803590602001906401000000008111156101a757600080fd5b8201836020820111156101b957600080fd5b803590602001918460018302840111640100000000831117156101db57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f820116905080830192505050505050509192919290505050610521565b005b61037f6004803603604081101561024557600080fd5b810190808035906020019064010000000081111561026257600080fd5b82018360208201111561027457600080fd5b8035906020019184600183028401116401000000008311171561029657600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f820116905080830192505050505050509192919290803590602001906401000000008111156102f957600080fd5b82018360208201111561030b57600080fd5b8035906020019184600183028401116401000000008311171561032d57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f820116905080830192505050505050509192919290505050610619565b005b61043a6004803603602081101561039757600080fd5b81019080803590602001906401000000008111156103b457600080fd5b8201836020820111156103c657600080fd5b803590602001918460018302840111640100000000831117156103e857600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f8201169050808301925050505050505091929192905050506106c7565b604051808060200180602001838103835285818151815260200191508051906020019080838360005b8381101561047e578082015181840152602081019050610463565b50505050905090810190601f1680156104ab5780820380516001836020036101000a031916815260200191505b50838103825284818151815260200191508051906020019080838360005b838110156104e45780820151818401526020810190506104c9565b50505050905090810190601f1680156105115780820380516001836020036101000a031916815260200191505b5094505050505060405180910390f35b6105296109a7565b6040518060400160405280848152602001838152509050806000856040518082805190602001908083835b602083106105775780518252602082019150602081019050602083039250610554565b6001836020036101000a038019825116818451168082178552505050505050905001915050908152602001604051809103902060008201518160000190805190602001906105c69291906109c1565b5060208201518160010190805190602001906105e39291906109c1565b509050507f9d555ed86ee2119980869887aa608cd4e86e542da0b9f3fec111931683fe92ac60405160405180910390a150505050565b806001836040518082805190602001908083835b60208310610650578051825260208201915060208101905060208303925061062d565b6001836020036101000a038019825116818451168082178552505050505050905001915050908152602001604051809103902090805190602001906106969291906109c1565b507f7f840bc1267eb6c29886145a255f25ce3471374ee913f1e60bbeddbf3e2e20fb60405160405180910390a15050565b60608060606001846040518082805190602001908083835b6020831061070257805182526020820191506020810190506020830392506106df565b6001836020036101000a03801982511681845116808217855250505050505090500191505090815260200160405180910390208054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156107c95780601f1061079e576101008083540402835291602001916107c9565b820191906000526020600020905b8154815290600101906020018083116107ac57829003601f168201915b505050505090506107d86109a7565b6000826040518082805190602001908083835b6020831061080e57805182526020820191506020810190506020830392506107eb565b6001836020036101000a0380198251168184511680821785525050505050509050019150509081526020016040518091039020604051806040016040529081600082018054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156108e55780601f106108ba576101008083540402835291602001916108e5565b820191906000526020600020905b8154815290600101906020018083116108c857829003601f168201915b50505050508152602001600182018054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156109875780601f1061095c57610100808354040283529160200191610987565b820191906000526020600020905b81548152906001019060200180831161096a57829003601f168201915b505050505081525050905080600001518160200151935093505050915091565b604051806040016040528060608152602001606081525090565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f10610a0257805160ff1916838001178555610a30565b82800160010185558215610a30579182015b82811115610a2f578251825591602001919060010190610a14565b5b509050610a3d9190610a41565b5090565b610a6391905b80821115610a5f576000816000905550600101610a47565b5090565b9056fea2646970667358221220dc70a22925c23f8d323a53f899474dd38f0affed549b2c11298b1e36b996641b64736f6c634300060a0033"};

    public static final String SM_BINARY = org.fisco.bcos.sdk.utils.StringUtils.joinAll("", SM_BINARY_ARRAY);

    public static final String[] ABI_ARRAY = {"[{\"anonymous\":false,\"inputs\":[],\"name\":\"LogSaveData\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[],\"name\":\"LogSaveTxHash\",\"type\":\"event\"},{\"inputs\":[{\"internalType\":\"string\",\"name\":\"txHash\",\"type\":\"string\"}],\"name\":\"queryDataByTxHash\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"},{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"string\",\"name\":\"dataHash\",\"type\":\"string\"},{\"internalType\":\"string\",\"name\":\"name\",\"type\":\"string\"},{\"internalType\":\"string\",\"name\":\"content\",\"type\":\"string\"}],\"name\":\"saveData\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"string\",\"name\":\"txHash\",\"type\":\"string\"},{\"internalType\":\"string\",\"name\":\"dataHash\",\"type\":\"string\"}],\"name\":\"saveTxHash\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]"};

    public static final String ABI = org.fisco.bcos.sdk.utils.StringUtils.joinAll("", ABI_ARRAY);

    public static final String FUNC_QUERYDATABYTXHASH = "queryDataByTxHash";

    public static final String FUNC_SAVEDATA = "saveData";

    public static final String FUNC_SAVETXHASH = "saveTxHash";

    public static final Event LOGSAVEDATA_EVENT = new Event("LogSaveData", 
            Arrays.<TypeReference<?>>asList());
    ;

    public static final Event LOGSAVETXHASH_EVENT = new Event("LogSaveTxHash", 
            Arrays.<TypeReference<?>>asList());
    ;

    protected Evidence(String contractAddress, Client client, CryptoKeyPair credential) {
        super(getBinary(client.getCryptoSuite()), contractAddress, client, credential);
    }

    public static String getBinary(CryptoSuite cryptoSuite) {
        return (cryptoSuite.getCryptoTypeConfig() == CryptoType.ECDSA_TYPE ? BINARY : SM_BINARY);
    }

    public List<LogSaveDataEventResponse> getLogSaveDataEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(LOGSAVEDATA_EVENT, transactionReceipt);
        ArrayList<LogSaveDataEventResponse> responses = new ArrayList<LogSaveDataEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            LogSaveDataEventResponse typedResponse = new LogSaveDataEventResponse();
            typedResponse.log = eventValues.getLog();
            responses.add(typedResponse);
        }
        return responses;
    }

    public void subscribeLogSaveDataEvent(String fromBlock, String toBlock, List<String> otherTopics, EventCallback callback) {
        String topic0 = eventEncoder.encode(LOGSAVEDATA_EVENT);
        subscribeEvent(ABI,BINARY,topic0,fromBlock,toBlock,otherTopics,callback);
    }

    public void subscribeLogSaveDataEvent(EventCallback callback) {
        String topic0 = eventEncoder.encode(LOGSAVEDATA_EVENT);
        subscribeEvent(ABI,BINARY,topic0,callback);
    }

    public List<LogSaveTxHashEventResponse> getLogSaveTxHashEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(LOGSAVETXHASH_EVENT, transactionReceipt);
        ArrayList<LogSaveTxHashEventResponse> responses = new ArrayList<LogSaveTxHashEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            LogSaveTxHashEventResponse typedResponse = new LogSaveTxHashEventResponse();
            typedResponse.log = eventValues.getLog();
            responses.add(typedResponse);
        }
        return responses;
    }

    public void subscribeLogSaveTxHashEvent(String fromBlock, String toBlock, List<String> otherTopics, EventCallback callback) {
        String topic0 = eventEncoder.encode(LOGSAVETXHASH_EVENT);
        subscribeEvent(ABI,BINARY,topic0,fromBlock,toBlock,otherTopics,callback);
    }

    public void subscribeLogSaveTxHashEvent(EventCallback callback) {
        String topic0 = eventEncoder.encode(LOGSAVETXHASH_EVENT);
        subscribeEvent(ABI,BINARY,topic0,callback);
    }

    public TransactionReceipt queryDataByTxHash(String txHash) {
        final Function function = new Function(
                FUNC_QUERYDATABYTXHASH, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(txHash)), 
                Collections.<TypeReference<?>>emptyList());
        return executeTransaction(function);
    }

    public void queryDataByTxHash(String txHash, TransactionCallback callback) {
        final Function function = new Function(
                FUNC_QUERYDATABYTXHASH, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(txHash)), 
                Collections.<TypeReference<?>>emptyList());
        asyncExecuteTransaction(function, callback);
    }

    public String getSignedTransactionForQueryDataByTxHash(String txHash) {
        final Function function = new Function(
                FUNC_QUERYDATABYTXHASH, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(txHash)), 
                Collections.<TypeReference<?>>emptyList());
        return createSignedTransaction(function);
    }

    public Tuple1<String> getQueryDataByTxHashInput(TransactionReceipt transactionReceipt) {
        String data = transactionReceipt.getInput().substring(10);
        final Function function = new Function(FUNC_QUERYDATABYTXHASH, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Utf8String>() {}));
        List<Type> results = FunctionReturnDecoder.decode(data, function.getOutputParameters());
        return new Tuple1<String>(

                (String) results.get(0).getValue()
                );
    }

    public Tuple2<String, String> getQueryDataByTxHashOutput(TransactionReceipt transactionReceipt) {
        String data = transactionReceipt.getOutput();
        final Function function = new Function(FUNC_QUERYDATABYTXHASH, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Utf8String>() {}, new TypeReference<Utf8String>() {}));
        List<Type> results = FunctionReturnDecoder.decode(data, function.getOutputParameters());
        return new Tuple2<String, String>(

                (String) results.get(0).getValue(), 
                (String) results.get(1).getValue()
                );
    }

    public TransactionReceipt saveData(String dataHash, String name, String content) {
        final Function function = new Function(
                FUNC_SAVEDATA, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(dataHash), 
                new org.fisco.bcos.sdk.abi.datatypes.Utf8String(name), 
                new org.fisco.bcos.sdk.abi.datatypes.Utf8String(content)), 
                Collections.<TypeReference<?>>emptyList());
        return executeTransaction(function);
    }

    public void saveData(String dataHash, String name, String content, TransactionCallback callback) {
        final Function function = new Function(
                FUNC_SAVEDATA, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(dataHash), 
                new org.fisco.bcos.sdk.abi.datatypes.Utf8String(name), 
                new org.fisco.bcos.sdk.abi.datatypes.Utf8String(content)), 
                Collections.<TypeReference<?>>emptyList());
        asyncExecuteTransaction(function, callback);
    }

    public String getSignedTransactionForSaveData(String dataHash, String name, String content) {
        final Function function = new Function(
                FUNC_SAVEDATA, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(dataHash), 
                new org.fisco.bcos.sdk.abi.datatypes.Utf8String(name), 
                new org.fisco.bcos.sdk.abi.datatypes.Utf8String(content)), 
                Collections.<TypeReference<?>>emptyList());
        return createSignedTransaction(function);
    }

    public Tuple3<String, String, String> getSaveDataInput(TransactionReceipt transactionReceipt) {
        String data = transactionReceipt.getInput().substring(10);
        final Function function = new Function(FUNC_SAVEDATA, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Utf8String>() {}, new TypeReference<Utf8String>() {}, new TypeReference<Utf8String>() {}));
        List<Type> results = FunctionReturnDecoder.decode(data, function.getOutputParameters());
        return new Tuple3<String, String, String>(

                (String) results.get(0).getValue(), 
                (String) results.get(1).getValue(), 
                (String) results.get(2).getValue()
                );
    }

    public TransactionReceipt saveTxHash(String txHash, String dataHash) {
        final Function function = new Function(
                FUNC_SAVETXHASH, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(txHash), 
                new org.fisco.bcos.sdk.abi.datatypes.Utf8String(dataHash)), 
                Collections.<TypeReference<?>>emptyList());
        return executeTransaction(function);
    }

    public void saveTxHash(String txHash, String dataHash, TransactionCallback callback) {
        final Function function = new Function(
                FUNC_SAVETXHASH, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(txHash), 
                new org.fisco.bcos.sdk.abi.datatypes.Utf8String(dataHash)), 
                Collections.<TypeReference<?>>emptyList());
        asyncExecuteTransaction(function, callback);
    }

    public String getSignedTransactionForSaveTxHash(String txHash, String dataHash) {
        final Function function = new Function(
                FUNC_SAVETXHASH, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(txHash), 
                new org.fisco.bcos.sdk.abi.datatypes.Utf8String(dataHash)), 
                Collections.<TypeReference<?>>emptyList());
        return createSignedTransaction(function);
    }

    public Tuple2<String, String> getSaveTxHashInput(TransactionReceipt transactionReceipt) {
        String data = transactionReceipt.getInput().substring(10);
        final Function function = new Function(FUNC_SAVETXHASH, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Utf8String>() {}, new TypeReference<Utf8String>() {}));
        List<Type> results = FunctionReturnDecoder.decode(data, function.getOutputParameters());
        return new Tuple2<String, String>(

                (String) results.get(0).getValue(), 
                (String) results.get(1).getValue()
                );
    }

    public static Evidence load(String contractAddress, Client client, CryptoKeyPair credential) {
        return new Evidence(contractAddress, client, credential);
    }

    public static Evidence deploy(Client client, CryptoKeyPair credential) throws ContractException {
        return deploy(Evidence.class, client, credential, getBinary(client.getCryptoSuite()), "");
    }

    public static class LogSaveDataEventResponse {
        public TransactionReceipt.Logs log;
    }

    public static class LogSaveTxHashEventResponse {
        public TransactionReceipt.Logs log;
    }
}
