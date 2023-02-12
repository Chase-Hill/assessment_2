//
//  TeamDetailedViewController.swift
//  Assessment 2
//
//  Created by Chase on 2/11/23.
//

import UIKit

class TeamDetailedViewController: UIViewController {
    
    // MARK: - TextField and Button Outlets
    
    @IBOutlet weak var teamNameTextField: UITextField!
    
    @IBOutlet weak var teamRankingTextField: UITextField!
    
    @IBOutlet weak var teamCountTextField: UITextField!
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    // MARK: - Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView(team: team)
        buttonAttributes()
    }
    
    // MARK: - Property
    
    var team: Team?
    
    // MARK: - Button Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = teamNameTextField.text, !name.isEmpty,
        let ranking = teamRankingTextField.text, !ranking.isEmpty,
              let count = teamCountTextField.text, !count.isEmpty else {return}
        
        let unwrappedRanking = Double(ranking) ?? 0.0
        let unwrappedCount = Int(count) ?? 0
        
        if let team = team {
            TeamController.sharedInstance.updateTeam(teamToUpdate: team, nameToUpdate: name, ratingToUpdate: unwrappedRanking, countToUpdate: unwrappedCount)
    
        } else {
            
            TeamController.sharedInstance.createTeam(name: name, rating: unwrappedRanking, count: unwrappedCount)
            
        }
        
    navigationController?.popViewController(animated: true)
        
    }
    
   // @IBAction func deleteButtonTapped(_ sender: Any) {
        
    //}
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        resetView()
    }
    
    // MARK: - Helper Functions for resetting and updating the view
    
    func updateView(team: Team?) {
        guard let team = team else {return}
        teamNameTextField.text = team.teamName
        teamRankingTextField.text = "\(team.teamRating)"
        teamCountTextField.text = "\(team.teamCount)"
    }
    
    func resetView() {
        teamCountTextField.text = ""
        teamRankingTextField.text = ""
        teamCountTextField.text = ""
    }
    
    func buttonAttributes() {
        clearButton.isHidden = team == nil ? true : false
        deleteButton.isHidden = team == nil ? true : false
    }
}
