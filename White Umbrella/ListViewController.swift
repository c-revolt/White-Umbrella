//
//  ListTableViewController.swift
//  White Umbrella
//
//  Created by Александр Прайд on 18.05.2022.
//

import UIKit

class ListViewController: UIViewController {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        fetchWeather()
        setupUIElements()
    }
    
    
    func fetchWeather() {
        
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=55.755819&lon=37.617644"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("e4c484cc-7e47-4cea-9c00-7998409cb87f", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        //55.755819, 37.617644
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
}

// MARK: - Setup UI Elements
extension ListViewController {
    private func setupUIElements() {
        setupNavController()
        setupTableView()
    }
    
    
    private func setupNavController() {
        navigationItem.title = "Города"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        //navigationController?.navigationBar.barTintColor = .navControllerColor()

    }
    
    private func setupTableView() {
     
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.separatorColor = .clear
        tableView.backgroundColor = .cellColor()
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: K.cell_id)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }

}


// MARK: - Table view data source and delegate
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cell_id, for: indexPath) as! ListTableViewCell
        
        cell.cityNameLabel.text = "Санкт-Петербург"
        
        return cell
    }
    
}



