//
//  SquadPlayerTableViewController.swift
//  ManchesterUnitedSquad
//
//  Created by clicklabs on 24/06/20.
//  Copyright © 2020 clicklabs. All rights reserved.
//

import UIKit

class SquadPlayerTableViewController: UITableViewController, addPlayerToTable {
    
    var squadPlayers = [SquadPlayer]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        loadSamplePLayers()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return squadPlayers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SquadPlayerTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SquadPlayerTableViewCell else {
            fatalError("Unable to Instantiate \(cellIdentifier)")
        }
        
        // Configure the cell...
        let player = squadPlayers[indexPath.row]
        cell.playerNameLabel.text = player.playerName
        cell.photoImage.image = player.photoImage
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addPlayer(_ sender: UIBarButtonItem) {
        let navController = storyboard?.instantiateViewController(identifier: "newPlayernav") as! UINavigationController
        let vc = storyboard?.instantiateViewController(identifier: "newPlayer") as! ViewController
        vc.newPlayerdelegate = self
        navController.pushViewController(vc, animated: true)
        self.present(navController, animated: true, completion: nil)
    }
    private func loadSamplePLayers() {
        let image1 = UIImage(named: "degea")
        let image2 = UIImage(named: "dalot")
        let image3 = UIImage(named: "pogba")
        
        guard let degea = SquadPlayer(name: "David De Gea", photo: image1) else {
            fatalError("Unable to instantiate Player1")
        }
        guard let dalot = SquadPlayer(name: "Diogo Dalot", photo: image2) else {
            fatalError("Unable to instantiate Player2")
        }
        guard let pogba = SquadPlayer(name: "Paul Pogba", photo: image3) else {
            fatalError("Unable to instantiate Player3")
        }
        
        squadPlayers += [degea, dalot, pogba]
    }

}

extension SquadPlayerTableViewController {
    func addingPlayerToTable(player: SquadPlayer) {
        let newIndexPath = IndexPath(row: squadPlayers.count, section: 0)
        squadPlayers.append(player)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
}

