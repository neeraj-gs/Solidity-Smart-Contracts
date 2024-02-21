const { version } = require("hardhat");

require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    compilers:[
      {version:"0.5.5"},
      {version:"0.6.6"},
      {version:"0.8.8"},
  ],
  },
  networks:{
    hardhat:{
      forking:{ //forking , makes a local copy of binance smart chain , we can use it without affectin thte main netwrok
        url:"https://bsc-dataseed.binance.org/",
      }
    }
  }
};
