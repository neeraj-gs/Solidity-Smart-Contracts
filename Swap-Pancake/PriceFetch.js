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

//router instance
const routerInstance = new ethers.Contract(
    routerAddr,routerABI,provider
)


const priceFetch = async(amount)=>{
    const token1 = new ethers.Contract(
        fromAddr,erc20ABI,provider
    )

    const token2 = new ethers.Contract(
        toAddr,erc20ABI,provider
    )

    const decimal1 = await token1.decimals();
    console.log(decimal1)
}

priceFetch();
