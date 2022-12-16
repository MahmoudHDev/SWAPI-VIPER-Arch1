//
//  ViewController.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/15/22.
//

import UIKit

protocol MainViewPr: class {
    // Properties
    var presenter: MainPresenterPr? {get set}
    
    //Methods
    func reloadTableViewData()
    func errorWhileFetchingData()
}

class MainViewController: UIViewController, MainViewPr {
    
    //MARK:- Properties
    weak var presenter: MainPresenterPr?
    
    //MARK:- Outlets
    var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        view.addSubview(tableView)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    //MARK:- Functions
    func setupUI() {
        title = "Star Wars"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
    //MARK:- TableView DataSource and Delegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.presenter?.people?.count {
            return count
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let data = self.presenter?.people?[indexPath.row] {
            cell.textLabel?.text = data.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.didSelectRow(at: indexPath)
    }
    
    func reloadTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()

        }
    }

    func errorWhileFetchingData() {
        print("Show Error")
    }

}
