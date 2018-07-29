//
//  ViewController.swift
//  DownInThePast
//
//  Created by Anton on 29.07.18.
//  Copyright © 2018 Anton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var timeStampTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeStampTableView.dataSource = self
        timeStampTableView.delegate = self
    }

    //MARK - UITableViewDataSource Stuff
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeStampCell", for: indexPath) as! TimeStampCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

