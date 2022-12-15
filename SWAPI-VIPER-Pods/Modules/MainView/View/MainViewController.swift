//
//  ViewController.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/15/22.
//

import UIKit

protocol MainViewPr: class {
    var presenter: MainPresenterPr? {get set}
}

class MainViewController: UIViewController, MainViewPr {
    //MARK:- Properties
    var presenter: MainPresenterPr?
    
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

extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "cell \(indexPath.row)"
        return cell
    }
}
