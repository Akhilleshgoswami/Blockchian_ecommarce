const Usdc = artifacts.require("Usdc.sol");

const PaymentProcesser  = artifacts.require("PaymentProcessor.sol");
module.exports = async function (deployer,network,addresses) {
    const [admin,payer,_]  = addresses;
    if(network === 'develop'){
        await deployer.deploy(Usdc);
        const usdc = await Usdc.deployed();
        await usdc.faucet(payer,web3.utils.toWei('10000'));
        console.log(usdc)
        // 1 usdc  = 1*10*18 "wei";
        // console.log(PaymentProcesser )
        await deployer.deploy(PaymentProcesser,admin,usdc.address);
        // const paymentProcesser = await PaymentProcesser.deployed();

    }else{
        const ADMIN_ADDRESS='';
        const USDC_ADDRESS='';
        await deployer.deploy(PaymentProcesser,ADMIN_ADDRESS,USDC_ADDRESS);

    }
};
