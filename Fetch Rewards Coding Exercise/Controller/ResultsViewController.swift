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
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Helpers
    
    
    func fetchData() {
        AF.request("https://fetch-hiring.s3.amazonaws.com/hiring.json").response { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json[0])
            case .failure(let error):
                print(error)
            }
        }
    }


}

//MARK: - UITableViewDataSource

extension ResultsViewController {
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return let cell = tableView.dequeueReusableCell(withIdentifier: )
//    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
}

