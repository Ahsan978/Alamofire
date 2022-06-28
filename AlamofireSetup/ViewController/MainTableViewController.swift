//
//  MainTableViewController.swift
//  AlamofireSetup
//
//  Created by Mac on 16/06/2022.
//

import UIKit
import Alamofire

class MainTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var items: [Displayable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchfilm()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? MainTableViewCell
        let item = items[indexPath.row]
        cell?.titleLabel.text = item.titleLabelText
        cell?.detailLabel.text = item.subtitleLabelText
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70;
    }
}


extension MainTableViewController {
    func fetchfilm()  {
        AF.request("https://swapi.dev/api/films")
            .validate()
            .responseDecodable(of: Films.self) { (response) in
                guard let films = response.value else { return }
                self.items = films.all
                self.tableView.reloadData()
                
            }
    }
}

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
}
