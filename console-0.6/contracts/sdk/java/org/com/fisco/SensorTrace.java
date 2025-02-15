package org.com.fisco;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.fisco.bcos.sdk.abi.FunctionReturnDecoder;
import org.fisco.bcos.sdk.abi.TypeReference;
import org.fisco.bcos.sdk.abi.datatypes.DynamicArray;
import org.fisco.bcos.sdk.abi.datatypes.Event;
import org.fisco.bcos.sdk.abi.datatypes.Function;
import org.fisco.bcos.sdk.abi.datatypes.Type;
import org.fisco.bcos.sdk.abi.datatypes.Utf8String;
import org.fisco.bcos.sdk.abi.datatypes.generated.Int256;
import org.fisco.bcos.sdk.abi.datatypes.generated.tuples.generated.Tuple1;
import org.fisco.bcos.sdk.abi.datatypes.generated.tuples.generated.Tuple3;
import org.fisco.bcos.sdk.abi.datatypes.generated.tuples.generated.Tuple4;
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
public class SensorTrace extends Contract {
    public static final String[] BINARY_ARRAY = {"60806040523480156200001157600080fd5b50611001600160006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff160217905550600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166356004b6a6040518060400160405280600b81526020017f73656e736f725f696e666f0000000000000000000000000000000000000000008152506040518263ffffffff1660e01b8152600401620000e791906200024c565b602060405180830381600087803b1580156200010257600080fd5b505af115801562000117573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906200013d91906200015b565b5062000321565b600081519050620001558162000307565b92915050565b6000602082840312156200016e57600080fd5b60006200017e8482850162000144565b91505092915050565b600062000194826200029a565b620001a08185620002a5565b9350620001b2818560208601620002c0565b620001bd81620002f6565b840191505092915050565b6000620001d7600e83620002a5565b91507f636f64652c74656d702c74696d650000000000000000000000000000000000006000830152602082019050919050565b600062000219600983620002a5565b91507f73656e736f725f696400000000000000000000000000000000000000000000006000830152602082019050919050565b6000606082019050818103600083015262000268818462000187565b905081810360208301526200027d816200020a565b905081810360408301526200029281620001c8565b905092915050565b600081519050919050565b600082825260208201905092915050565b6000819050919050565b60005b83811015620002e0578082015181840152602081019050620002c3565b83811115620002f0576000848401525b50505050565b6000601f19601f8301169050919050565b6200031281620002b6565b81146200031e57600080fd5b50565b6117ed80620003316000396000f3fe608060405234801561001057600080fd5b50600436106100365760003560e01c80633774f43e1461003b578063fcd7e3c11461006b575b600080fd5b61005560048036038101906100509190610f8b565b61009d565b604051610062919061135f565b60405180910390f35b61008560048036038101906100809190610f09565b6104aa565b60405161009493929190611313565b60405180910390f35b6000816000866040516100b091906112fc565b9081526020016040518091039020819055506000600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663f23f63c96040518060400160405280600b81526020017f73656e736f725f696e666f0000000000000000000000000000000000000000008152506040518263ffffffff1660e01b8152600401610154919061137a565b60206040518083038186803b15801561016c57600080fd5b505afa158015610180573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906101a49190610eb7565b905060008173ffffffffffffffffffffffffffffffffffffffff166313db93466040518163ffffffff1660e01b815260040160206040518083038186803b1580156101ee57600080fd5b505afa158015610202573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906102269190610e8e565b90508073ffffffffffffffffffffffffffffffffffffffff1663e942b516886040518263ffffffff1660e01b815260040161026191906114ed565b600060405180830381600087803b15801561027b57600080fd5b505af115801561028f573d6000803e3d6000fd5b505050508073ffffffffffffffffffffffffffffffffffffffff1663e942b516876040518263ffffffff1660e01b81526004016102cc919061144a565b600060405180830381600087803b1580156102e657600080fd5b505af11580156102fa573d6000803e3d6000fd5b505050508073ffffffffffffffffffffffffffffffffffffffff16632ef8ba74866040518263ffffffff1660e01b8152600401610337919061149f565b600060405180830381600087803b15801561035157600080fd5b505af1158015610365573d6000803e3d6000fd5b505050508073ffffffffffffffffffffffffffffffffffffffff16632ef8ba74856040518263ffffffff1660e01b81526004016103a2919061141c565b600060405180830381600087803b1580156103bc57600080fd5b505af11580156103d0573d6000803e3d6000fd5b5050505060008273ffffffffffffffffffffffffffffffffffffffff166331afac3689846040518363ffffffff1660e01b81526004016104119291906113cc565b602060405180830381600087803b15801561042b57600080fd5b505af115801561043f573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906104639190610ee0565b90507fc57b01fa77f41df77eaab79a0e2623fab2e7ae3e9530d9b1cab225ad65f2b7ce81604051610494919061135f565b60405180910390a1809350505050949350505050565b60608060606000600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663f23f63c96040518060400160405280600b81526020017f73656e736f725f696e666f0000000000000000000000000000000000000000008152506040518263ffffffff1660e01b8152600401610541919061137a565b60206040518083038186803b15801561055957600080fd5b505afa15801561056d573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906105919190610eb7565b90506000603c6000876040516105a791906112fc565b90815260200160405180910390205403905060008273ffffffffffffffffffffffffffffffffffffffff16637857d7c96040518163ffffffff1660e01b815260040160206040518083038186803b15801561060157600080fd5b505afa158015610615573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906106399190610e3c565b90508073ffffffffffffffffffffffffffffffffffffffff1663cd30a1d1886040518263ffffffff1660e01b815260040161067491906114ed565b60006040518083038186803b15801561068c57600080fd5b505afa1580156106a0573d6000803e3d6000fd5b505050508073ffffffffffffffffffffffffffffffffffffffff166308ad6333836040518263ffffffff1660e01b81526004016106dd919061141c565b60006040518083038186803b1580156106f557600080fd5b505afa158015610709573d6000803e3d6000fd5b5050505060008373ffffffffffffffffffffffffffffffffffffffff1663e8434e3989846040518363ffffffff1660e01b815260040161074a92919061139c565b60206040518083038186803b15801561076257600080fd5b505afa158015610776573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061079a9190610e65565b905060608173ffffffffffffffffffffffffffffffffffffffff1663949d225d6040518163ffffffff1660e01b815260040160206040518083038186803b1580156107e457600080fd5b505afa1580156107f8573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061081c9190610ee0565b67ffffffffffffffff8111801561083257600080fd5b5060405190808252806020026020018201604052801561086657816020015b60608152602001906001900390816108515790505b50905060608273ffffffffffffffffffffffffffffffffffffffff1663949d225d6040518163ffffffff1660e01b815260040160206040518083038186803b1580156108b157600080fd5b505afa1580156108c5573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906108e99190610ee0565b67ffffffffffffffff811180156108ff57600080fd5b5060405190808252806020026020018201604052801561092e5781602001602082028036833780820191505090505b50905060608373ffffffffffffffffffffffffffffffffffffffff1663949d225d6040518163ffffffff1660e01b815260040160206040518083038186803b15801561097957600080fd5b505afa15801561098d573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906109b19190610ee0565b67ffffffffffffffff811180156109c757600080fd5b506040519080825280602002602001820160405280156109f65781602001602082028036833780820191505090505b50905060008090505b8473ffffffffffffffffffffffffffffffffffffffff1663949d225d6040518163ffffffff1660e01b815260040160206040518083038186803b158015610a4557600080fd5b505afa158015610a59573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610a7d9190610ee0565b811215610cfe5760008573ffffffffffffffffffffffffffffffffffffffff1663846719e0836040518263ffffffff1660e01b8152600401610abf919061135f565b60206040518083038186803b158015610ad757600080fd5b505afa158015610aeb573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610b0f9190610e8e565b90508073ffffffffffffffffffffffffffffffffffffffff16639c981fcb6040518163ffffffff1660e01b8152600401610b48906114cd565b60006040518083038186803b158015610b6057600080fd5b505afa158015610b74573d6000803e3d6000fd5b505050506040513d6000823e3d601f19601f82011682018060405250810190610b9d9190610f4a565b858381518110610ba957fe5b60200260200101819052508073ffffffffffffffffffffffffffffffffffffffff1663fda69fae6040518163ffffffff1660e01b8152600401610beb9061147f565b60206040518083038186803b158015610c0357600080fd5b505afa158015610c17573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610c3b9190610ee0565b848381518110610c4757fe5b6020026020010181815250508073ffffffffffffffffffffffffffffffffffffffff1663fda69fae6040518163ffffffff1660e01b8152600401610c8a906113fc565b60206040518083038186803b158015610ca257600080fd5b505afa158015610cb6573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081","0190610cda9190610ee0565b838381518110610ce657fe5b602002602001018181525050508060010190506109ff565b50828282995099509950505050505050509193909250565b600081519050610d2581611744565b92915050565b600081519050610d3a8161175b565b92915050565b600081519050610d4f81611772565b92915050565b600081519050610d6481611789565b92915050565b600081359050610d79816117a0565b92915050565b600081519050610d8e816117a0565b92915050565b600082601f830112610da557600080fd5b8135610db8610db38261154f565b611522565b91508082526020830160208301858383011115610dd457600080fd5b610ddf8382846116f1565b50505092915050565b600082601f830112610df957600080fd5b8151610e0c610e078261154f565b611522565b91508082526020830160208301858383011115610e2857600080fd5b610e33838284611700565b50505092915050565b600060208284031215610e4e57600080fd5b6000610e5c84828501610d16565b91505092915050565b600060208284031215610e7757600080fd5b6000610e8584828501610d2b565b91505092915050565b600060208284031215610ea057600080fd5b6000610eae84828501610d40565b91505092915050565b600060208284031215610ec957600080fd5b6000610ed784828501610d55565b91505092915050565b600060208284031215610ef257600080fd5b6000610f0084828501610d7f565b91505092915050565b600060208284031215610f1b57600080fd5b600082013567ffffffffffffffff811115610f3557600080fd5b610f4184828501610d94565b91505092915050565b600060208284031215610f5c57600080fd5b600082015167ffffffffffffffff811115610f7657600080fd5b610f8284828501610de8565b91505092915050565b60008060008060808587031215610fa157600080fd5b600085013567ffffffffffffffff811115610fbb57600080fd5b610fc787828801610d94565b945050602085013567ffffffffffffffff811115610fe457600080fd5b610ff087828801610d94565b935050604061100187828801610d6a565b925050606061101287828801610d6a565b91505092959194509250565b600061102a838361113b565b60208301905092915050565b60006110428383611159565b905092915050565b60006110558261159b565b61105f81856115d6565b935061106a8361157b565b8060005b8381101561109b578151611082888261101e565b975061108d836115bc565b92505060018101905061106e565b5085935050505092915050565b60006110b3826115a6565b6110bd81856115e7565b9350836020820285016110cf8561158b565b8060005b8581101561110b57848403895281516110ec8582611036565b94506110f7836115c9565b925060208a019950506001810190506110d3565b50829750879550505050505092915050565b611126816116a9565b82525050565b611135816116cd565b82525050565b6111448161167f565b82525050565b6111538161167f565b82525050565b6000611164826115b1565b61116e81856115f8565b935061117e818560208601611700565b61118781611733565b840191505092915050565b600061119d826115b1565b6111a78185611609565b93506111b7818560208601611700565b6111c081611733565b840191505092915050565b60006111d6826115b1565b6111e0818561161a565b93506111f0818560208601611700565b80840191505092915050565b6000611209600483611609565b91507f74696d65000000000000000000000000000000000000000000000000000000006000830152602082019050919050565b6000611249600483611609565b91507f636f6465000000000000000000000000000000000000000000000000000000006000830152602082019050919050565b6000611289600483611609565b91507f74656d70000000000000000000000000000000000000000000000000000000006000830152602082019050919050565b60006112c9600983611609565b91507f73656e736f725f696400000000000000000000000000000000000000000000006000830152602082019050919050565b600061130882846111cb565b915081905092915050565b6000606082019050818103600083015261132d81866110a8565b90508181036020830152611341818561104a565b90508181036040830152611355818461104a565b9050949350505050565b6000602082019050611374600083018461114a565b92915050565b600060208201905081810360008301526113948184611192565b905092915050565b600060408201905081810360008301526113b68185611192565b90506113c5602083018461111d565b9392505050565b600060408201905081810360008301526113e68185611192565b90506113f5602083018461112c565b9392505050565b60006020820190508181036000830152611415816111fc565b9050919050565b60006040820190508181036000830152611435816111fc565b9050611444602083018461114a565b92915050565b600060408201905081810360008301526114638161123c565b905081810360208301526114778184611192565b905092915050565b600060208201905081810360008301526114988161127c565b9050919050565b600060408201905081810360008301526114b88161127c565b90506114c7602083018461114a565b92915050565b600060208201905081810360008301526114e6816112bc565b9050919050565b60006040820190508181036000830152611506816112bc565b9050818103602083015261151a8184611192565b905092915050565b6000604051905081810181811067ffffffffffffffff8211171561154557600080fd5b8060405250919050565b600067ffffffffffffffff82111561156657600080fd5b601f19601f8301169050602081019050919050565b6000819050602082019050919050565b6000819050602082019050919050565b600081519050919050565b600081519050919050565b600081519050919050565b6000602082019050919050565b6000602082019050919050565b600082825260208201905092915050565b600082825260208201905092915050565b600082825260208201905092915050565b600082825260208201905092915050565b600081905092915050565b600061163082611689565b9050919050565b600061164282611625565b9050919050565b600061165482611625565b9050919050565b600061166682611625565b9050919050565b600061167882611625565b9050919050565b6000819050919050565b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b60006116b4826116bb565b9050919050565b60006116c682611689565b9050919050565b60006116d8826116df565b9050919050565b60006116ea82611689565b9050919050565b82818337600083830152505050565b60005b8381101561171e578082015181840152602081019050611703565b8381111561172d576000848401525b50505050565b6000601f19601f8301169050919050565b61174d81611637565b811461175857600080fd5b50565b61176481611649565b811461176f57600080fd5b50565b61177b8161165b565b811461178657600080fd5b50565b6117928161166d565b811461179d57600080fd5b50565b6117a98161167f565b81146117b457600080fd5b5056fea2646970667358221220eae24946e377832b9a6f8885d54f17a25afc6da8d2e70c869c96f8fec37cd05864736f6c634300060a0033"};

    public static final String BINARY = org.fisco.bcos.sdk.utils.StringUtils.joinAll("", BINARY_ARRAY);

    public static final String[] SM_BINARY_ARRAY = {"60806040523480156200001157600080fd5b50611001600160006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff160217905550600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663c92a78016040518060400160405280600b81526020017f73656e736f725f696e666f0000000000000000000000000000000000000000008152506040518263ffffffff1660e01b8152600401620000e791906200024c565b602060405180830381600087803b1580156200010257600080fd5b505af115801562000117573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906200013d91906200015b565b5062000321565b600081519050620001558162000307565b92915050565b6000602082840312156200016e57600080fd5b60006200017e8482850162000144565b91505092915050565b600062000194826200029a565b620001a08185620002a5565b9350620001b2818560208601620002c0565b620001bd81620002f6565b840191505092915050565b6000620001d7600983620002a5565b91507f73656e736f725f696400000000000000000000000000000000000000000000006000830152602082019050919050565b600062000219600e83620002a5565b91507f636f64652c74656d702c74696d650000000000000000000000000000000000006000830152602082019050919050565b6000606082019050818103600083015262000268818462000187565b905081810360208301526200027d81620001c8565b9050818103604083015262000292816200020a565b905092915050565b600081519050919050565b600082825260208201905092915050565b6000819050919050565b60005b83811015620002e0578082015181840152602081019050620002c3565b83811115620002f0576000848401525b50505050565b6000601f19601f8301169050919050565b6200031281620002b6565b81146200031e57600080fd5b50565b6117ed80620003316000396000f3fe608060405234801561001057600080fd5b50600436106100365760003560e01c80635b325d781461003b5780636c03cb891461006d575b600080fd5b61005560048036038101906100509190610f09565b61009d565b60405161006493929190611313565b60405180910390f35b61008760048036038101906100829190610f8b565b610909565b604051610094919061135f565b60405180910390f35b60608060606000600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166359a48b656040518060400160405280600b81526020017f73656e736f725f696e666f0000000000000000000000000000000000000000008152506040518263ffffffff1660e01b8152600401610134919061137a565b60206040518083038186803b15801561014c57600080fd5b505afa158015610160573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906101849190610eb7565b90506000603c60008760405161019a91906112fc565b90815260200160405180910390205403905060008273ffffffffffffffffffffffffffffffffffffffff1663c74f8caf6040518163ffffffff1660e01b815260040160206040518083038186803b1580156101f457600080fd5b505afa158015610208573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061022c9190610e3c565b90508073ffffffffffffffffffffffffffffffffffffffff1663ae763db5886040518263ffffffff1660e01b8152600401610267919061149f565b60006040518083038186803b15801561027f57600080fd5b505afa158015610293573d6000803e3d6000fd5b505050508073ffffffffffffffffffffffffffffffffffffffff1663e1f10ee0836040518263ffffffff1660e01b81526004016102d091906114f4565b60006040518083038186803b1580156102e857600080fd5b505afa1580156102fc573d6000803e3d6000fd5b5050505060008373ffffffffffffffffffffffffffffffffffffffff1663d8ac595789846040518363ffffffff1660e01b815260040161033d92919061139c565b60206040518083038186803b15801561035557600080fd5b505afa158015610369573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061038d9190610e65565b905060608173ffffffffffffffffffffffffffffffffffffffff1663d3e9af5a6040518163ffffffff1660e01b815260040160206040518083038186803b1580156103d757600080fd5b505afa1580156103eb573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061040f9190610ee0565b67ffffffffffffffff8111801561042557600080fd5b5060405190808252806020026020018201604052801561045957816020015b60608152602001906001900390816104445790505b50905060608273ffffffffffffffffffffffffffffffffffffffff1663d3e9af5a6040518163ffffffff1660e01b815260040160206040518083038186803b1580156104a457600080fd5b505afa1580156104b8573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906104dc9190610ee0565b67ffffffffffffffff811180156104f257600080fd5b506040519080825280602002602001820160405280156105215781602001602082028036833780820191505090505b50905060608373ffffffffffffffffffffffffffffffffffffffff1663d3e9af5a6040518163ffffffff1660e01b815260040160206040518083038186803b15801561056c57600080fd5b505afa158015610580573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906105a49190610ee0565b67ffffffffffffffff811180156105ba57600080fd5b506040519080825280602002602001820160405280156105e95781602001602082028036833780820191505090505b50905060008090505b8473ffffffffffffffffffffffffffffffffffffffff1663d3e9af5a6040518163ffffffff1660e01b815260040160206040518083038186803b15801561063857600080fd5b505afa15801561064c573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906106709190610ee0565b8112156108f15760008573ffffffffffffffffffffffffffffffffffffffff16633dd2b614836040518263ffffffff1660e01b81526004016106b2919061135f565b60206040518083038186803b1580156106ca57600080fd5b505afa1580156106de573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906107029190610e8e565b90508073ffffffffffffffffffffffffffffffffffffffff16639bca41e86040518163ffffffff1660e01b815260040161073b9061147f565b60006040518083038186803b15801561075357600080fd5b505afa158015610767573d6000803e3d6000fd5b505050506040513d6000823e3d601f19601f820116820180604052508101906107909190610f4a565b85838151811061079c57fe5b60200260200101819052508073ffffffffffffffffffffffffffffffffffffffff16634900862e6040518163ffffffff1660e01b81526004016107de906113fc565b60206040518083038186803b1580156107f657600080fd5b505afa15801561080a573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061082e9190610ee0565b84838151811061083a57fe5b6020026020010181815250508073ffffffffffffffffffffffffffffffffffffffff16634900862e6040518163ffffffff1660e01b815260040161087d906114d4565b60206040518083038186803b15801561089557600080fd5b505afa1580156108a9573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906108cd9190610ee0565b8383815181106108d957fe5b602002602001018181525050508060010190506105f2565b50828282995099509950505050505050509193909250565b60008160008660405161091c91906112fc565b9081526020016040518091039020819055506000600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166359a48b656040518060400160405280600b81526020017f73656e736f725f696e666f0000000000000000000000000000000000000000008152506040518263ffffffff1660e01b81526004016109c0919061137a565b60206040518083038186803b1580156109d857600080fd5b505afa1580156109ec573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610a109190610eb7565b905060008173ffffffffffffffffffffffffffffffffffffffff16635887ab246040518163ffffffff1660e01b815260040160206040518083038186803b158015610a5a57600080fd5b505afa158015610a6e573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610a929190610e8e565b90508073ffffffffffffffffffffffffffffffffffffffff16631a391cb4886040518263ffffffff1660e01b8152600401610acd919061149f565b600060405180830381600087803b158015610ae757600080fd5b505af1158015610afb573d6000803e3d6000fd5b505050508073ffffffffffffffffffffffffffffffffffffffff16631a391cb4876040518263ffffffff1660e01b8152600401610b38919061144a565b600060405180830381600087803b158015610b5257600080fd5b505af1158015610b66573d6000803e3d6000fd5b505050508073ffffffffffffffffffffffffffffffffffffffff1663def42698866040518263ffffffff1660e01b8152600401610ba3919061141c565b600060405180830381600087803b158015610bbd57600080fd5b505af1158015610bd1573d6000803e3d6000fd5b505050508073ffffffffffffffffffffffffffffffffffffffff1663def42698856040518263ffffffff1660e01b8152600401610c0e91906114f4565b600060405180830381600087803b158015610c2857600080fd5b505af1158015610c3c573d6000803e3d6000fd5b5050505060008273ffffffffffffffffffffffffffffffffffffffff16634c6f30c089846040518363ffffffff1660e01b8152600401610c7d9291906113cc565b602060405180830381600087803b158015610c9757600080fd5b505af1158015610cab573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610ccf9190610ee056","5b90507fdfc533ec2b52797a1229dc2495dbd3f4948f7c4c982ec077ad9d80810ec5c1f981604051610d00919061135f565b60405180910390a1809350505050949350505050565b600081519050610d2581611744565b92915050565b600081519050610d3a8161175b565b92915050565b600081519050610d4f81611772565b92915050565b600081519050610d6481611789565b92915050565b600081359050610d79816117a0565b92915050565b600081519050610d8e816117a0565b92915050565b600082601f830112610da557600080fd5b8135610db8610db38261154f565b611522565b91508082526020830160208301858383011115610dd457600080fd5b610ddf8382846116f1565b50505092915050565b600082601f830112610df957600080fd5b8151610e0c610e078261154f565b611522565b91508082526020830160208301858383011115610e2857600080fd5b610e33838284611700565b50505092915050565b600060208284031215610e4e57600080fd5b6000610e5c84828501610d16565b91505092915050565b600060208284031215610e7757600080fd5b6000610e8584828501610d2b565b91505092915050565b600060208284031215610ea057600080fd5b6000610eae84828501610d40565b91505092915050565b600060208284031215610ec957600080fd5b6000610ed784828501610d55565b91505092915050565b600060208284031215610ef257600080fd5b6000610f0084828501610d7f565b91505092915050565b600060208284031215610f1b57600080fd5b600082013567ffffffffffffffff811115610f3557600080fd5b610f4184828501610d94565b91505092915050565b600060208284031215610f5c57600080fd5b600082015167ffffffffffffffff811115610f7657600080fd5b610f8284828501610de8565b91505092915050565b60008060008060808587031215610fa157600080fd5b600085013567ffffffffffffffff811115610fbb57600080fd5b610fc787828801610d94565b945050602085013567ffffffffffffffff811115610fe457600080fd5b610ff087828801610d94565b935050604061100187828801610d6a565b925050606061101287828801610d6a565b91505092959194509250565b600061102a838361113b565b60208301905092915050565b60006110428383611159565b905092915050565b60006110558261159b565b61105f81856115d6565b935061106a8361157b565b8060005b8381101561109b578151611082888261101e565b975061108d836115bc565b92505060018101905061106e565b5085935050505092915050565b60006110b3826115a6565b6110bd81856115e7565b9350836020820285016110cf8561158b565b8060005b8581101561110b57848403895281516110ec8582611036565b94506110f7836115c9565b925060208a019950506001810190506110d3565b50829750879550505050505092915050565b611126816116a9565b82525050565b611135816116cd565b82525050565b6111448161167f565b82525050565b6111538161167f565b82525050565b6000611164826115b1565b61116e81856115f8565b935061117e818560208601611700565b61118781611733565b840191505092915050565b600061119d826115b1565b6111a78185611609565b93506111b7818560208601611700565b6111c081611733565b840191505092915050565b60006111d6826115b1565b6111e0818561161a565b93506111f0818560208601611700565b80840191505092915050565b6000611209600483611609565b91507f74656d70000000000000000000000000000000000000000000000000000000006000830152602082019050919050565b6000611249600483611609565b91507f636f6465000000000000000000000000000000000000000000000000000000006000830152602082019050919050565b6000611289600983611609565b91507f73656e736f725f696400000000000000000000000000000000000000000000006000830152602082019050919050565b60006112c9600483611609565b91507f74696d65000000000000000000000000000000000000000000000000000000006000830152602082019050919050565b600061130882846111cb565b915081905092915050565b6000606082019050818103600083015261132d81866110a8565b90508181036020830152611341818561104a565b90508181036040830152611355818461104a565b9050949350505050565b6000602082019050611374600083018461114a565b92915050565b600060208201905081810360008301526113948184611192565b905092915050565b600060408201905081810360008301526113b68185611192565b90506113c5602083018461111d565b9392505050565b600060408201905081810360008301526113e68185611192565b90506113f5602083018461112c565b9392505050565b60006020820190508181036000830152611415816111fc565b9050919050565b60006040820190508181036000830152611435816111fc565b9050611444602083018461114a565b92915050565b600060408201905081810360008301526114638161123c565b905081810360208301526114778184611192565b905092915050565b600060208201905081810360008301526114988161127c565b9050919050565b600060408201905081810360008301526114b88161127c565b905081810360208301526114cc8184611192565b905092915050565b600060208201905081810360008301526114ed816112bc565b9050919050565b6000604082019050818103600083015261150d816112bc565b905061151c602083018461114a565b92915050565b6000604051905081810181811067ffffffffffffffff8211171561154557600080fd5b8060405250919050565b600067ffffffffffffffff82111561156657600080fd5b601f19601f8301169050602081019050919050565b6000819050602082019050919050565b6000819050602082019050919050565b600081519050919050565b600081519050919050565b600081519050919050565b6000602082019050919050565b6000602082019050919050565b600082825260208201905092915050565b600082825260208201905092915050565b600082825260208201905092915050565b600082825260208201905092915050565b600081905092915050565b600061163082611689565b9050919050565b600061164282611625565b9050919050565b600061165482611625565b9050919050565b600061166682611625565b9050919050565b600061167882611625565b9050919050565b6000819050919050565b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b60006116b4826116bb565b9050919050565b60006116c682611689565b9050919050565b60006116d8826116df565b9050919050565b60006116ea82611689565b9050919050565b82818337600083830152505050565b60005b8381101561171e578082015181840152602081019050611703565b8381111561172d576000848401525b50505050565b6000601f19601f8301169050919050565b61174d81611637565b811461175857600080fd5b50565b61176481611649565b811461176f57600080fd5b50565b61177b8161165b565b811461178657600080fd5b50565b6117928161166d565b811461179d57600080fd5b50565b6117a98161167f565b81146117b457600080fd5b5056fea2646970667358221220d0d07e46904be16d3fa7e5bc2804f3144662f8961448f1d59444a687027642ed64736f6c634300060a0033"};

    public static final String SM_BINARY = org.fisco.bcos.sdk.utils.StringUtils.joinAll("", SM_BINARY_ARRAY);

    public static final String[] ABI_ARRAY = {"[{\"inputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":false,\"internalType\":\"int256\",\"name\":\"count\",\"type\":\"int256\"}],\"name\":\"CreateResult\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":false,\"internalType\":\"int256\",\"name\":\"count\",\"type\":\"int256\"}],\"name\":\"InsertResult\",\"type\":\"event\"},{\"inputs\":[{\"internalType\":\"string\",\"name\":\"sensor_id\",\"type\":\"string\"},{\"internalType\":\"string\",\"name\":\"code\",\"type\":\"string\"},{\"internalType\":\"int256\",\"name\":\"temp\",\"type\":\"int256\"},{\"internalType\":\"int256\",\"name\":\"time\",\"type\":\"int256\"}],\"name\":\"insert\",\"outputs\":[{\"internalType\":\"int256\",\"name\":\"\",\"type\":\"int256\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"string\",\"name\":\"id\",\"type\":\"string\"}],\"name\":\"select\",\"outputs\":[{\"internalType\":\"string[]\",\"name\":\"\",\"type\":\"string[]\"},{\"internalType\":\"int256[]\",\"name\":\"\",\"type\":\"int256[]\"},{\"internalType\":\"int256[]\",\"name\":\"\",\"type\":\"int256[]\"}],\"stateMutability\":\"view\",\"type\":\"function\"}]"};

    public static final String ABI = org.fisco.bcos.sdk.utils.StringUtils.joinAll("", ABI_ARRAY);

    public static final String FUNC_INSERT = "insert";

    public static final String FUNC_SELECT = "select";

    public static final Event CREATERESULT_EVENT = new Event("CreateResult", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Int256>() {}));
    ;

    public static final Event INSERTRESULT_EVENT = new Event("InsertResult", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Int256>() {}));
    ;

    protected SensorTrace(String contractAddress, Client client, CryptoKeyPair credential) {
        super(getBinary(client.getCryptoSuite()), contractAddress, client, credential);
    }

    public static String getBinary(CryptoSuite cryptoSuite) {
        return (cryptoSuite.getCryptoTypeConfig() == CryptoType.ECDSA_TYPE ? BINARY : SM_BINARY);
    }

    public List<CreateResultEventResponse> getCreateResultEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(CREATERESULT_EVENT, transactionReceipt);
        ArrayList<CreateResultEventResponse> responses = new ArrayList<CreateResultEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            CreateResultEventResponse typedResponse = new CreateResultEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.count = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public void subscribeCreateResultEvent(String fromBlock, String toBlock, List<String> otherTopics, EventCallback callback) {
        String topic0 = eventEncoder.encode(CREATERESULT_EVENT);
        subscribeEvent(ABI,BINARY,topic0,fromBlock,toBlock,otherTopics,callback);
    }

    public void subscribeCreateResultEvent(EventCallback callback) {
        String topic0 = eventEncoder.encode(CREATERESULT_EVENT);
        subscribeEvent(ABI,BINARY,topic0,callback);
    }

    public List<InsertResultEventResponse> getInsertResultEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(INSERTRESULT_EVENT, transactionReceipt);
        ArrayList<InsertResultEventResponse> responses = new ArrayList<InsertResultEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            InsertResultEventResponse typedResponse = new InsertResultEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.count = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public void subscribeInsertResultEvent(String fromBlock, String toBlock, List<String> otherTopics, EventCallback callback) {
        String topic0 = eventEncoder.encode(INSERTRESULT_EVENT);
        subscribeEvent(ABI,BINARY,topic0,fromBlock,toBlock,otherTopics,callback);
    }

    public void subscribeInsertResultEvent(EventCallback callback) {
        String topic0 = eventEncoder.encode(INSERTRESULT_EVENT);
        subscribeEvent(ABI,BINARY,topic0,callback);
    }

    public TransactionReceipt insert(String sensor_id, String code, BigInteger temp, BigInteger time) {
        final Function function = new Function(
                FUNC_INSERT, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(sensor_id), 
                new org.fisco.bcos.sdk.abi.datatypes.Utf8String(code), 
                new org.fisco.bcos.sdk.abi.datatypes.generated.Int256(temp), 
                new org.fisco.bcos.sdk.abi.datatypes.generated.Int256(time)), 
                Collections.<TypeReference<?>>emptyList());
        return executeTransaction(function);
    }

    public void insert(String sensor_id, String code, BigInteger temp, BigInteger time, TransactionCallback callback) {
        final Function function = new Function(
                FUNC_INSERT, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(sensor_id), 
                new org.fisco.bcos.sdk.abi.datatypes.Utf8String(code), 
                new org.fisco.bcos.sdk.abi.datatypes.generated.Int256(temp), 
                new org.fisco.bcos.sdk.abi.datatypes.generated.Int256(time)), 
                Collections.<TypeReference<?>>emptyList());
        asyncExecuteTransaction(function, callback);
    }

    public String getSignedTransactionForInsert(String sensor_id, String code, BigInteger temp, BigInteger time) {
        final Function function = new Function(
                FUNC_INSERT, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(sensor_id), 
                new org.fisco.bcos.sdk.abi.datatypes.Utf8String(code), 
                new org.fisco.bcos.sdk.abi.datatypes.generated.Int256(temp), 
                new org.fisco.bcos.sdk.abi.datatypes.generated.Int256(time)), 
                Collections.<TypeReference<?>>emptyList());
        return createSignedTransaction(function);
    }

    public Tuple4<String, String, BigInteger, BigInteger> getInsertInput(TransactionReceipt transactionReceipt) {
        String data = transactionReceipt.getInput().substring(10);
        final Function function = new Function(FUNC_INSERT, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Utf8String>() {}, new TypeReference<Utf8String>() {}, new TypeReference<Int256>() {}, new TypeReference<Int256>() {}));
        List<Type> results = FunctionReturnDecoder.decode(data, function.getOutputParameters());
        return new Tuple4<String, String, BigInteger, BigInteger>(

                (String) results.get(0).getValue(), 
                (String) results.get(1).getValue(), 
                (BigInteger) results.get(2).getValue(), 
                (BigInteger) results.get(3).getValue()
                );
    }

    public Tuple1<BigInteger> getInsertOutput(TransactionReceipt transactionReceipt) {
        String data = transactionReceipt.getOutput();
        final Function function = new Function(FUNC_INSERT, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Int256>() {}));
        List<Type> results = FunctionReturnDecoder.decode(data, function.getOutputParameters());
        return new Tuple1<BigInteger>(

                (BigInteger) results.get(0).getValue()
                );
    }

    public Tuple3<List<String>, List<BigInteger>, List<BigInteger>> select(String id) throws ContractException {
        final Function function = new Function(FUNC_SELECT, 
                Arrays.<Type>asList(new org.fisco.bcos.sdk.abi.datatypes.Utf8String(id)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<DynamicArray<Utf8String>>() {}, new TypeReference<DynamicArray<Int256>>() {}, new TypeReference<DynamicArray<Int256>>() {}));
        List<Type> results = executeCallWithMultipleValueReturn(function);
        return new Tuple3<List<String>, List<BigInteger>, List<BigInteger>>(
                convertToNative((List<Utf8String>) results.get(0).getValue()), 
                convertToNative((List<Int256>) results.get(1).getValue()), 
                convertToNative((List<Int256>) results.get(2).getValue()));
    }

    public static SensorTrace load(String contractAddress, Client client, CryptoKeyPair credential) {
        return new SensorTrace(contractAddress, client, credential);
    }

    public static SensorTrace deploy(Client client, CryptoKeyPair credential) throws ContractException {
        return deploy(SensorTrace.class, client, credential, getBinary(client.getCryptoSuite()), "");
    }

    public static class CreateResultEventResponse {
        public TransactionReceipt.Logs log;

        public BigInteger count;
    }

    public static class InsertResultEventResponse {
        public TransactionReceipt.Logs log;

        public BigInteger count;
    }
}
