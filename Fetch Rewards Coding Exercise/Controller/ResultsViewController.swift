//
//  ViewController.swift
//  Fetch Rewards Coding Exercise
//
//  Created by Stanley Traub on 9/28/20.
//

import UIKit
import SwiftyJSON
import Alamofire

class ResultsViewController: UITableViewController {
    
    //MARK: - Properties
    var results = [Item]()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        tableView.separatorInset = .zero
    }
    
    //MARK: - Helpers
    
    func fetchData() {
        AF.request("https://fetch-hiring.s3.amazonaws.com/hiring.json").response { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for (_, item) in json {
                    let id = item["id"].intValue
                    let listId = item["listId"].intValue
                    
                    if let name = item["name"].string, item["name"].string != "" {
                        let item = Item(id: id, listId: listId, name: name)
                        self.results.append(item)
                    }
                    

                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()

                }
            case .failure(let error):
                print(error)
            }
        }
    }


}

//MARK: - UITableViewDataSource

extension ResultsViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = results[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultCell
//        print(item.name)
        
        cell.idLabel.text = "\(item.id)"
        cell.nameLabel.text = "\(item.name)"
        cell.listIdLabel.text = "\(item.listId)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
}

