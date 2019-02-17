//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Mark Meretzky on 2/15/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class AddRegistrationTableViewController: UITableViewController, //p. 690
    SelectRoomTypeTableViewControllerDelegate {                  //p. 710
    
    var registration: Registration? {   //p. 715
        guard let roomType: RoomType = roomType else {
            return nil;
        }
        
        let firstName: String = firstNameTextField.text ?? "";
        let lastName: String = lastNameTextField.text ?? "";
        let email: String = emailTextField.text ?? "";
        let checkInDate: Date = checkInDatePicker.date;
        let checkOutDate: Date = checkOutDatePicker.date;
        let numberOfAdults: Int = Int(numberOfAdultsStepper.value);
        let numberOfChildren: Int = Int(numberOfChildrenStepper.value);
        let hasWifi: Bool = wifiSwitch.isOn;
        
        return Registration(
            firstName: firstName,
            lastName: lastName,
            emailAddress: email,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            numberOfAdults: numberOfAdults,
            numberOfChildren: numberOfChildren,
            roomType: roomType,
            hasWifi: hasWifi);
    }

    var roomType: RoomType?;   //p. 710
    
    let checkInDatePickerCellIndexPath: IndexPath = IndexPath(row: 1, section: 1);   //p. 697
    let checkOutDatePickerCellIndexPath: IndexPath = IndexPath(row: 3, section: 1);

    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown;
        }
    }

    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown;
        }
    }

    @IBOutlet weak var firstNameTextField: UITextField!;   //p. 691
    @IBOutlet weak var lastNameTextField: UITextField!;
    @IBOutlet weak var emailTextField: UITextField!;
    
    @IBOutlet weak var checkInDateLabel: UILabel!;   //p. 694
    @IBOutlet weak var checkInDatePicker: UIDatePicker!;
    @IBOutlet weak var checkOutDateLabel: UILabel!;
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!;
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!;   //p. 702
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!;
    @IBOutlet weak var numberOfChildrenLabel: UILabel!;
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!;
    
    @IBOutlet weak var wifiSwitch: UISwitch!;   //p. 704
    @IBOutlet weak var roomTypeLabel: UILabel!;   //p. 710
    
    override func viewDidLoad() {
        super.viewDidLoad();
        print("viewDidLoad");
        
        let midnightToday: Date = Calendar.current.startOfDay(for: Date());   //p. 695
        checkInDatePicker.minimumDate = midnightToday;
        checkInDatePicker.date = midnightToday;

        updateDateViews();      //p. 696
        updateNumberOfGuests(); //p. 703
        updateRoomType();       //p. 711

        // Uncomment the following line to preserve selection between presentations
        // clearsSelectionOnViewWillAppear = false;

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // navigationItem.rightBarButtonItem = editButtonItem;
    }
    
    // MARK: - @IBAction methods

    /*
    //deleted on p. 720
 
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {   //p. 692
        let firstName: String = firstNameTextField.text ?? "";
        let lastName: String = lastNameTextField.text ?? "";
        let email: String = emailTextField.text ?? "";
        
        let checkInDate: Date = checkInDatePicker.date;   //p. 696
        let checkOutDate: Date = checkOutDatePicker.date;
        
        let numberOfAdults: Int = Int(numberOfAdultsStepper.value);   //p. 703
        let numberOfChildren: Int = Int(numberOfChildrenStepper.value);
        
        let hasWifi: Bool = wifiSwitch.isOn;   //p. 705
        let roomChoice: String = roomType?.name ?? "Not Set";   //p. 713

        print("""
        DONE TAPPED
        firstName: \(firstName)
        lastName: \(lastName)
        email: \(email)
        checkIn: \(checkInDate)
        checkOut: \(checkOutDate)
        numberOfAdults: \(numberOfAdults)
        numberOfChildren: \(numberOfChildren)
        wifi: \(hasWifi)
        roomType: \(roomChoice)
        """);
    }
    */
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews();   //p. 696
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {   //p. 703
        updateNumberOfGuests();
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {   //p. 705
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {   //p. 721
        dismiss(animated: true, completion: nil);
    }
    
    // MARK: - Update methods
    
    func updateDateViews() {   //p. 694
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(60 * 60 * 24);   //p. 695

        let dateFormatter: DateFormatter = DateFormatter();   //p. 695
        dateFormatter.dateStyle = .medium;

        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date);
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date);
    }
    
    func updateNumberOfGuests() {   //p. 703
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))";
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))";
    }
    
    func updateRoomType() {   //pp. 710-711
        if let roomType: RoomType = roomType {
            roomTypeLabel.text = roomType.name;
        } else {
            roomTypeLabel.text = "Not Set";
        }
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {   //p. 712
        guard segue.identifier == "SelectRoomType" else {
            return;
        }
        
        // Get the new view controller using segue.destination.
        
        guard let destinationViewController: SelectRoomTypeTableViewController = segue.destination as? SelectRoomTypeTableViewController else {
            return;
        }
        
        // Pass the selected object to the new view controller.

        destinationViewController.delegate = self;
        destinationViewController.roomType = roomType;
    }
    
    // MARK: - UITableViewDelegate
    // p. 697
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch (indexPath.section, indexPath.row) {   //p. 698

        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row):
            return isCheckInDatePickerShown ? 216.0 : 0.0;

        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row):
            return isCheckOutDatePickerShown ? 216.0 : 0.0;

        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);   //p. 700
        
        switch (indexPath.section, indexPath.row) {
    
        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row - 1):
            isCheckInDatePickerShown = !isCheckInDatePickerShown;
            isCheckOutDatePickerShown = false;
            tableView.performBatchUpdates(nil);
            
        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row - 1):
            isCheckOutDatePickerShown = !isCheckOutDatePickerShown;
            isCheckInDatePickerShown = false;
            tableView.performBatchUpdates(nil);
            
        default:
            break
        }
    }
    
    // MARK: - SelectRoomTypeTableViewControllerDelegate
    
    func didSelect(roomType: RoomType) {   //p. 711
        self.roomType = roomType;
        updateRoomType();
    }

}
