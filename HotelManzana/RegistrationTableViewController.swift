//
//  RegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Mark Meretzky on 2/17/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class RegistrationTableViewController: UITableViewController { //p. 716
    
    var registrations: [Registration] = [Registration]();      //p. 717

    override func viewDidLoad() {
        super.viewDidLoad();

        // Uncomment the following line to preserve selection between presentations
        // clearsSelectionOnViewWillAppear = false;

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // navigationItem.rightBarButtonItem = editButtonItem;
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;   //p. 718
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registrations.count;   //p. 718
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)

        // Configure the cell..., p. 719
        let registration: Registration = registrations[indexPath.row];

        let dateFormatter: DateFormatter = DateFormatter();
        dateFormatter.dateStyle = .short;

        cell.textLabel?.text = "\(registration.firstName) \(registration.lastName)";
        cell.detailTextLabel?.text = dateFormatter.string(from: registration.checkInDate) + " - " + dateFormatter.string(from: registration.checkOutDate) + ": " + registration.roomType.name;
        return cell;
    }
    
    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {   //pp. 719-720
        
        guard let addRegistrationTableViewController: AddRegistrationTableViewController = unwindSegue.source as? AddRegistrationTableViewController,
            let registration: Registration = addRegistrationTableViewController.registration else {
                return;
        }
        
        registrations.append(registration);
        tableView.reloadData();
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true;
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        return true;
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {   //p. 721, challenge 1
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
