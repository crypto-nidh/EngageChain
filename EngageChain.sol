// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SocialMediaTracker {
    mapping(address => uint256) public engagementScore;
    mapping(address => uint256) public rewards;
    
    event EngagementTracked(address indexed user, uint256 score);
    event RewardIssued(address indexed user, uint256 amount);

    function trackEngagement() public {
        engagementScore[msg.sender] += 10; // Fixed engagement increment
        emit EngagementTracked(msg.sender, engagementScore[msg.sender]);
    }

    function claimReward() public {
        uint256 rewardAmount = engagementScore[msg.sender] / 10; // Simple reward calculation
        rewards[msg.sender] += rewardAmount;
        emit RewardIssued(msg.sender, rewardAmount);
    }
}
