// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uniswap interface and library imports
import "./interface/IUniswapV2Factory.sol";
import "./interface/IUniswapV2Pair.sol";
import "./interface/IUniswapV2Router01.sol";
import "./interface/IUniswapV2Router02.sol";
import "./interface/IERC20.sol";
import "./library/UniswapV2Library.sol";
import "./library/SafeERC20.sol";
import "hardhat/console.sol";

contract FlashLoan {
    using SafeERC20 for IERC20;

    // Factory and Routing Addresses
    address private constant PANCAKE_FACTORY =
        0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73;
    address private constant PANCAKE_ROUTER =
        0x10ED43C718714eb63d5aA57B78B54704E256024E;


    // Token Addresses
    address private constant BUSD = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
    address private constant WBNB = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
    address private constant CROX = 0x2c094F5A7D1146BB93850f629501eB749f6Ed491;
    address private constant CAKE = 0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82;

    uint256 private deadline = block.timestamp + 1 days; //1 day is the deadline
    uint256 private constant MAX_INT =
        115792089237316195423570985008687907853269984665640564039457584007913129639935;


    function initiateArbitrage(address _busdBorrow, uint _amout){ //addres of the token we are borrowing ffrom [any token can be taken] and the amount to borrow
    //1.Approval of the diffrent tokens we are using for arbitrage to the Pancake router for using the tokens on behalf of me 
    //2.Access liquidity Pool for the 2 tokens selected
    //3.Cehck if there exists a contract for swapping the selected tokens 
    //4.Search address of the tokkens and fetch it 
    //5.Check if the token borrowed andd token0 address is same , if same tranfer amount ,if not transfer 0 
    //6.Create a data variable for triggering flash loan
    //7.Swap the borrowed amount inot our contract address, data makes sure next function pancake_call() is executed or called 
    


        IERC20(BUSD).safeApprove(address(PANCAKE_ROUTER),MAX_INT); //makes sure we approve pancake router to spend token[as we execute flash loans , contract have to make sure flashloans run properly]
        IERC20(CROX).safeApprove(address(PANCAKE_ROUTER),MAX_INT);
        IERC20(CAKE).safeApprove(address(PANCAKE_ROUTER),MAX_INT);

        address pair = IUniswapV2Factory(PANCAKE_FACTORY).getPair(
            _busdBorrow, //deals with busd and wbnb 
            WBNB
        ); //we get the liquidity pool that does trading between the 2 coins
        require(pair!=address(0),"Pool Does not Exist for the Current Pair");
        address token0 = IUniswapV2Pair(pair).token0(); //added address of token 1
        address token1 = IUniswapV2Pair(pair).token1(); //added addres fo token 2

        uint amount0Out = _busdBorrow==token0?_amout:0; //after fetching the token we assign the amount of token to the amount out
        uint amount0Out = _busdBorrow==token1?_amout:0; //busd is trafdered here 


        bytes memory data = abi.encode(_busdBorrow,_amout,msg.sender); //we need to use the borrowed busd in flash loans, triggers a flah loan 
        //pair is the contract liquidity where busd and wbnb trading happens
        IUniswapV2Pair(pair).swap(amount0Out, amount1Out,address(this),data); //transfer busd inot the account of our contract

    }






}