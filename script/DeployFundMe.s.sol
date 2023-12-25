//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";


contract DeployFundMe is Script {
    function run() external returns(FundMe) {

        //Before startBroadcast --> Not 'real' tx
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        //After startBroadcast --> Real tx!
        vm.startBroadcast();
        //Creating a Mock Contract0x694AA1769357215DE4FAC081bf1f309aDC325306
        FundMe fundMe = new FundMe(ethUsdPriceFeed);    
        vm.stopBroadcast();
        return fundMe;
    }
}