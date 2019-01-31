//
//  HomeViewController.swift
//  20190130-KellyDoan-NYCSchools
//
//  Created by Thao Doan on 1/30/19.
//  Copyright © 2019 Thao Doan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let detailSegueID = "schoolDetail"
    private let cellIdentifier = "cell"
    
    private var schools = [School]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 0.5758150816, blue: 0, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getSchoolNameList()
    }
    
    func getSchoolNameList() {
        NetWorking.getSchoolSatInfo { [weak self] schoolArray in
            guard let schoolArray = schoolArray else { return }
            self?.schools = schoolArray
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == detailSegueID, let destinationVC = segue.destination as? SchoolDetailsViewController, let index = tableView.indexPathForSelectedRow else { return }
        destinationVC.school = schools[index.row]
    }

}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = schools[indexPath.row].schoolName
        return cell
    }
    
}
