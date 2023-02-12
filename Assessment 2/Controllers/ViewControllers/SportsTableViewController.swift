//
//  SportsTableViewController.swift
//  Assessment 2
//
//  Created by Chase on 2/11/23.
//

import UIKit

class SportsTableViewController: UITableViewController {
    
    // MARK: - Life-Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //This counts the number of teams within the [teams] array that is coming from the sharedInstance in the TeamController model controller.
        return TeamController.sharedInstance.teams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sportsTeams", for: indexPath) as! TeamTableViewCell
        
        let team = TeamController.sharedInstance.teams[indexPath.row]
        cell.updateView(team: team)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let team = TeamController.sharedInstance.teams [indexPath.row]
            TeamController.sharedInstance.deleteTeam(teamToDelete: team)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsViewController" {
            if let indexPath = tableView.indexPathForSelectedRow,
               let detailedViewContoller = segue.destination as? TeamDetailedViewController {
                let team = TeamController.sharedInstance.teams[indexPath.row]
                detailedViewContoller.team = team
            }
        }
    }
}
