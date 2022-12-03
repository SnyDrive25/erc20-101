pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./IExerciceSolution.sol";

contract ExerciceSolution is ERC20, IExerciceSolution
{
    constructor() ERC20("SnyCoin", "SNY") public {

    }

    function symbol() public override(ERC20, IExerciceSolution) view returns (string memory) {
        return "";
    }

    function getToken() external override returns (bool) {
        return false;
    }

    function buyToken() external override payable returns (bool) {
        return false;
    }

    function isCustomerWhiteListed(address customerAddress) external override returns (bool) {
        customerAddress;
        return false;
    }

    function customerTierLevel(address customerAddress) external override returns (uint256) {
        customerAddress;
        return 259;
    }
}
