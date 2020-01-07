//
//  ViewController.swift
//  MyProjectPractice
//
//  Created by Melinda Diaz on 12/9/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var horoscope = Horoscope.zodiacSigns {//This is the var that holds the data that will be displayed on the tableview
        didSet {
            horoscopeTableView.reloadData()//reloads the data on tableview
        }
    }
   

    @IBOutlet weak var searchBarOutlet: UISearchBar!
    @IBOutlet weak var horoscopeTableView: UITableView!
    
    var userQuery = "" {
           //when the property observer that is attached to changes then DidSet gets triggered
           didSet { //trailing closure syntax
            if userQuery.isEmpty { //if the user types and cancels it then the search bar is empty which THEN the tableview repopulates
                horoscope = Horoscope.zodiacSigns//this repopulates the data
            } else {
            horoscope = Horoscope.zodiacSigns.filter{$0.zodiacSign.lowercased().contains(userQuery.lowercased())} //this filters the data based on the user query
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
        navigationBar?.isTranslucent = true
        searchBarOutlet.delegate = self
        horoscopeTableView.dataSource = self
        horoscopeTableView.delegate = self
        navigationItem.title = "2020 Horoscope"
//        CGRect frame = CGRectMake(0, 0, 400, 44);
//        UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
//        label.backgroundColor = [UIColor clearColor];
//        label.font = [UIFont boldSystemFontOfSize:8.0];
//        label.textAlignment = UITextAlignmentCenter;
//        label.textColor = [UIColor whiteColor];
//        label.text = @"Sample custom Title With small Fonts ";
//        self.navigationItem.titleView = label
        
    }
    
 
 
    
    

    
    
    
    
    
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //first we are guard the indexPath cause their might not be a tableView
      guard let indexPath = horoscopeTableView.indexPathForSelectedRow,
        // we are setting the variable to the destination and guarding against the detail View Controller
        let detailViewController = segue.destination as? DetailViewController else { fatalError("did not segue")}
        //then eachCell variable is assigned to the indexPath from horoscope
        let eachCell = horoscope[indexPath.row]
        //then we are setting this variable again to eachCell
        detailViewController.horoscopeRef = eachCell
        }

    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return horoscope.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//[
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HoroscopeCell", for: indexPath) as? HoroscopeTableViewCell else {fatalError("could not find cell")}
        
        cell.zodiacLabel.text = horoscope[indexPath.row].zodiacSign
        cell.zodiacDateLabel.text = horoscope[indexPath.row].zodiacDate
        cell.zodiacPicOutlet.image = UIImage(named: horoscope[indexPath.row].zodiacImage)
        cell.zodiacLabel.numberOfLines = 0
        cell.zodiacDateLabel.numberOfLines = 0
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
        
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let updatedUserQuery = searchBar.text else {
            return
        }//this is not necessary you are being REDUNDANT!!
        userQuery = updatedUserQuery //Set the value of means equal
    }
}
    
    
    
/*
 @IBOutlet weak var myTextView: UITextView!
 var pinchGesture = UIPinchGestureRecognizer()

 override func viewDidLoad() {
     super.viewDidLoad()
     pinchGesture = UIPinchGestureRecognizer(target: self, action:#selector(pinchText(sender:)))
     myTextView.addGestureRecognizer(pinchGesture)
 }

 @objc func pinchText(sender: UIPinchGestureRecognizer) {
     var pointSize = myTextView.font?.pointSize
     pointSize = ((sender.velocity > 0) ? 1 : -1) * 1 + pointSize!;
     myTextView.font = UIFont( name: "arial", size: (pointSize)!)
 }
 */

