//
//  TeamTableViewCell.swift
//  Assessment 2
//
//  Created by Chase on 2/11/23.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    // MARK: - Label Outlets
    
    @IBOutlet weak var playerCountLabel: UILabel!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var teamRatingLabel: UILabel!
    
    // MARK: - Update Views Function
    
    func updateView(team: Team) {
        playerCountLabel.text = "Team Count: \(team.teamCount)"
        teamNameLabel.text = team.teamName.uppercased()
        teamRatingLabel.text = "#\(team.teamRating)"
        
        
    }
}



