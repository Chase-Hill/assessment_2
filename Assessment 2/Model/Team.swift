//
//  Team.swift
//  Assessment 2
//
//  Created by Chase on 2/11/23.
//

import Foundation

class Team {
    var teamName: String
    var teamRating: Int
    var teamCount: Int
    
    init(teamName: String, teamRating: Int, teamCount: Int) {
        self.teamName = teamName
        self.teamRating = teamRating
        self.teamCount = teamCount
    }
}

// MARK: - Extension
extension Team: Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.teamName == rhs.teamName &&
        lhs.teamRating == rhs.teamRating &&
        lhs.teamCount == rhs.teamCount
    }
}
