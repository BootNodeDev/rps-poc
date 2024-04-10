import { createPXEClient, CheatCodes } from "@aztec/aztec.js";

const pxeRpcUrl = "http://localhost:8080";
const ethRpcUrl = "http://localhost:8545";

const pxe = createPXEClient(pxeRpcUrl);
const cc = await CheatCodes.create(ethRpcUrl, pxe);

const blockNumber = await cc.eth.blockNumber();

console.log(blockNumber);
