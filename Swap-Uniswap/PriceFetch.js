//Fetch price of token

const ethers = require("ethers");
const {factoryAddr,
    routerAddr,
    fromAddr,
    toAddr} = require("./AddressList.js")

const {erc20ABI,factoryABI,routerABI,pairABI} = require("./Abi.js")

//we need a provider to connect to blockchain

const provider = new ethers.providers.JsonRpcProvider(
    "https://eth-mainnet.g.alchemy.com/v2/KJPP6hyMXum24Vxo-i2HWqh8yj"
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
    const decimal2 = await token2.decimals();
    const amountIn = ethers.utils.parseUnits(humanFormat,decimal1).toString();

    //number busd trnadered, checks , based on busd  how many wbnb we get 
    const amountsOut = await routerInstance.getAmountsOut(amountIn,[
        fromAddr,
        toAddr
    ]);
    const humanOutput = ethers.utils.formatUnits(
        amountsOut[1].toString(),
        decimal2
    )
    console.log("THe Number of DAI TOkens Are: ",humanOutput);
}
humanFormat="1"; //100 BUSD exchnage , how many wbnb we get it , convert 100 BUSD INto wei 100* 10^18
priceFetch();
