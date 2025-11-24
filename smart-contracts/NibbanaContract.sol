// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NibbanaContract {
    struct MeditationSession {
        address user;
        uint duration; // in minutes
        uint karmaPoints;
    }

    MeditationSession[] public sessions;

    function logSession(uint duration, uint karmaPoints) public {
        sessions.push(MeditationSession(msg.sender, duration, karmaPoints));
    }

    function getUserSessions(address user) public view returns (MeditationSession[] memory) {
        uint count = 0;
        for(uint i=0;i<sessions.length;i++){
            if(sessions[i].user == user) count++;
        }

        MeditationSession[] memory result = new MeditationSession[](count);
        uint index = 0;
        for(uint i=0;i<sessions.length;i++){
            if(sessions[i].user == user){
                result[index] = sessions[i];
                index++;
            }
        }
        return result;
    }
}