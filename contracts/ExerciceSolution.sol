pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./IExerciceSolution.sol";

contract ExerciceSolution is ERC20, IExerciceSolution
{
    constructor() ERC20("SnyCoin", "SNY") public {}

    mapping(address => bool) public auth;
    mapping(address => uint) public level;

    function symbol() public override(ERC20, IExerciceSolution) view returns (string memory) {
        return "WNHWZ";
    }

    function totalSupply() public virtual override(ERC20, IERC20) view returns (uint256) {
        uint supply = 460674955000000000000000000;
        return supply;
    }

    function getToken() external override returns (bool) {
        require(auth[msg.sender] == true);
        _mint(msg.sender, 1);
        return true;
    }

    function buyToken() external override payable returns (bool) {
        require(auth[msg.sender] == true);
        if(level[msg.sender] == 1) {
            _mint(msg.sender, msg.value);        
        }
        else if(level[msg.sender] == 2) {
            _mint(msg.sender, 2 * msg.value);
        }
        else {
            _mint(msg.sender, 1);
        }
        return true;
    }

    function isCustomerWhiteListed(address customerAddress) external override returns (bool) {
        auth[customerAddress] = true;
        return auth[customerAddress];
    }

    function customerTierLevel(address customerAddress) external override returns (uint256) {
        level[customerAddress] = 2;
        return level[customerAddress];
    }
}
