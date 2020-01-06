//
//  DetailViewController.swift
//  MyProjectPractice
//
//  Created by Melinda Diaz on 12/11/19.
//  Copyright © 2019 Melinda Diaz. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var zodiacImageOutlet: UIImageView!
    @IBOutlet weak var zodiacNameLabel: UILabel!
    @IBOutlet weak var zodiacDateLabel: UILabel!
    @IBOutlet weak var zodiacHoroscopeLabel: UITextView!
    
    var horoscopeRef: Horoscope?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBar = self.navigationController?.navigationBar

        navigationBar?.setBackgroundImage(UIImage(), for: .default)
//        navigationBar?.shadowImage = UIImage()
        navigationBar?.isTranslucent = true
        uploadData()
        
    }
   
    func uploadData() {
        zodiacNameLabel.text = horoscopeRef?.zodiacSign
        zodiacDateLabel.text = horoscopeRef?.zodiacDate
        zodiacHoroscopeLabel.text = horoscopeRef?.zodiacReading
        zodiacImageOutlet.image = UIImage(named: horoscopeRef!.zodiacBackground)
        
    }

}

//extension SearchViewController: SFSafariViewControllerDelegate {

//}
