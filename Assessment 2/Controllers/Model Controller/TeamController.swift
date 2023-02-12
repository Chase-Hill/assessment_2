//
//  TeamController.swift
//  Assessment 2
//
//  Created by Chase on 2/11/23.
//

import Foundation

class TeamController {
    
    // MARK: - Properties and functions
    ///Our **Single Source Of Truth** and *Shared Instance*
    static let sharedInstance = TeamController()
    var teams: [Team] = []
    
    func createTeam(name: String, rating: Int, count: Int) {
        let team = Team(teamName: name.uppercased(), teamRating: rating, teamCount: count)
        teams.append(team)
    }
    
    // If I want to update a team, I need the new values for the properties AND I need to know WHAT team the user is trying to update...
    
    func updateTeam(teamToUpdate: Team, nameToUpdate: String, ratingToUpdate: Int, countToUpdate: Int) {
        teamToUpdate.teamName = nameToUpdate.uppercased()
        teamToUpdate.teamRating = ratingToUpdate
        teamToUpdate.teamCount = countToUpdate
    }
    
    // If I want to remove a team, I need to know which one it is!
    
    func deleteTeam(teamToDelete: Team) {
        guard let index = teams.firstIndex(of: teamToDelete) else {return}
        teams.remove(at: index)
    }
}
