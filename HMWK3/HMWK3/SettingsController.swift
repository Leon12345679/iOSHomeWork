//
//  SettingsController.swift
//  HMWK3
//
//  Created by Leon Vladimirov on 10/28/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

import UIKit


extension SettingsController: DataSourceChange {
    func updateDataSource(dataPath: IndexPath, newVal: String) {
        settings[dataPath.section].items[dataPath.row] = newVal
    }
}


class SettingsController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.title = "Settings"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    var settings = [
        Section(items: ["User Info", "Privacy"]),
        Section(items: ["Location Usage", "Data Sharing"]),
        Section(items: ["Profile"])
    ]
    
    private var rowsInSection: Int = 0
    
    struct Section {
        var title: String? = nil
        var items: [String]
    }
    
    private func fetchSection(forSection: Int) -> Section {
        return settings[forSection]
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return settings.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let settingsSection = fetchSection(forSection: section)
        
        return settingsSection.items.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseIdentifier, for: indexPath) as! SettingsCell
        
    
        let settingToShow = settings[indexPath.section]
        rowsInSection = settingToShow.items.count
        tableView.numberOfRows(inSection: rowsInSection)
        // Configure the cell...
        cell.awakeFromNib()
        cell.settingLabel.text = settingToShow.items[indexPath.row]
        
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSetting = settings[indexPath.section].items[indexPath.row]
        
        let settingController = ViewController()
        settingController.dataSourceDelegate = self
        settingController.parentPath = indexPath
        
        settingController.controllerTitle = selectedSetting
        
        self.navigationController?.pushViewController(settingController, animated: true)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            settings[indexPath.section].items.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }

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

}
