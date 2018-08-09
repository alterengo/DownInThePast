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
    @IBOutlet weak var resultTimerLabel: UILabel!
    
    var timeStamps: [TimeStamp] = []
    var activeTimerLabel : UILabel = UILabel()
    var timerIsActive = false
    var timer: Timer?
    let resultTimer = TimeStamp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeStampTableView.dataSource = self
        timeStampTableView.delegate = self
        
        timeStamps.append(TimeStamp())
        timeStamps[0].setTimer(hours: 0, minutes: 25, seconds: 00)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
        self.view.addGestureRecognizer(tapGesture)
        
        timeStampTableView.contentInset = UIEdgeInsetsMake(24, 0, 0, 0)
    }

    //MARK - UITableViewDataSource Stuff
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeStampCell", for: indexPath) as! TimeStampCell
        
        let timeStamp = timeStamps[timeStamps.count - indexPath.row - 1]
        
        if indexPath.row == 0 {
            activeTimerLabel = cell.TimeStampLabel
            cell.TimeStampLabel.text = timeStamp.toString()
        }
        else {
            cell.TimeStampLabel.textColor = UIColor.lightGray
            cell.TimeStampLabel.text = timeStamp.toStringElapsedTime()
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeStamps.count
    }
    
    //MARK - Table View Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        // tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Start and Stop Timer
    @objc func screenTapped() {
        if timerIsActive{
            // Timer was stopped
            timerIsActive = false
            timeStamps.append(TimeStamp())
            timeStamps[timeStamps.count-1].setTimer(hours: 0, minutes: 25, seconds: 0)
            activeTimerLabel.textColor = UIColor.blue
            timer?.invalidate()
            timeStampTableView.reloadData()
        }
        else {
            // Timer was started
            timerIsActive = true
            activeTimerLabel.textColor = UIColor.black
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerAction() {
        let activeTimeStamp = timeStamps[timeStamps.count-1]
        
        activeTimeStamp.increase()
        resultTimer.increase()
        
        activeTimerLabel.text = activeTimeStamp.toString()
        resultTimerLabel.text = resultTimer.toString()
    }
}

