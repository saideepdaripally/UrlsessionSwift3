//
//  ViewController.swift
//  MeetUpDEmo
//
//  Created by Kvana Dev Ipod on 30/12/16.
//  Copyright © 2016 Kvana DevInc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  var eventArray = [Event] ()


    @IBOutlet weak var eventTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getEventDetails()
        eventTable.delegate = self
        eventTable.dataSource = self
        
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func getEventDetails() {
          let config = URLSessionConfiguration.default
          let session = URLSession(configuration: config)
        let url = URL(string: "https://api.meetup.com/find/events?&sign=true&photo-host=public&key=7f7c562b148043801e60324a2c63f33")
        let task = session.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String: Any]]
                    {
                        for event in json{
                            let event = Event.init(data: (event as? [String:Any])!)
                            self.eventArray.append(event)
                            print(self.eventArray)
                            DispatchQueue.main.async {
                                self.eventTable.reloadData()
                            }
                        }
                    }else{
                        print("error on json handling")
                    }
                     }catch {
                    print("error in JSONSerialization")
                }
            }
            
        })
        task.resume()
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : EvnetTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EvnetTableViewCell
        let userObj = eventArray[indexPath.row]
         cell.eventNameLbl.text = userObj.name
         cell.eventAddressLbl.text = userObj.address
        cell.eventTimeLbl.text = userObj.time ?? ""
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EventDetailViewController") as! EventDetailViewController
        vc.event = eventArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}




