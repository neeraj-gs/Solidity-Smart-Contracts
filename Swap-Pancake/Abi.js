//INfo related to ABI, ALl teh fucntoins info int his 
//used to interact with the blockchain

//ERC-20 Token is required as mos tokens folloe erc20 token standard 
const erc20ABI=["function decimals() public view returns (uint8)"]
//get pair gives address of contract that handles tokens a and b , returnns the address of iquidity address provider contract for BUSD and WBNB
const factoryABI = ["function getPair(address tokenA, address tokenB) external view returns (address pair)"] 

//from liquidity provider contract, take 2 token fucntions and paste it , and also get Reserves fuction
//liquidity pool provider: 0x58F876857a02D6762E0101bb5C46A8c1ED44Dc16
const pairABI=[
    "function token0() external view returns (address),function token1() external view returns (address),function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast)"]

//router contract requied as fethcing happends here 
//getA\mountOut is the functioon 
const routerABI=[" function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut)"]