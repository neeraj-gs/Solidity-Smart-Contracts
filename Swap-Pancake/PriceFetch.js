//Fetch price of token

const ethers = require("ethers");
const {factoryAddr,
    routerAddr,
    fromAddr,
    toAddr} = require("./AddressList.js")

const {erc20ABI,factoryABI,routerABI,pairABI} = require("./Abi.js")

//we need a provider to connect to blockchain

const provider = new ethers.providers.JsonRpcProvider(
    "https://bsc-dataseed1.binance.org/"
)

//contract factory instnce 
const factInstance = new ethers.Contract(
    factoryAddr,factoryABI,provider
)

console.log(factInstance)
