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
    @IBOutlet weak var websiteOutlet: UIButton!
    
    var horoscopeRef: Horoscope?
    

  
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBar = self.navigationController?.navigationBar

        navigationBar?.setBackgroundImage(UIImage(), for: .default)
//        navigationBar?.shadowImage = UIImage()
        navigationBar?.isTranslucent = true
        uploadData()
        let scroll = zodiacHoroscopeLabel as! UIScrollView
        scroll.delegate = self
        
    }
    //Even though its in the button action method you can put this into your own function without a button.
    @IBAction func websiteButtonPressed(_ sender: UIButton) {
        //we guard against this because it needs to unwrap this
        guard let button = horoscopeRef?.website,
            let url = URL(string: button) else {
                fatalError("website not found")
        }
        //you need to have an instance of SafariVC and then set the delegation to self
        let instance = SFSafariViewController(url: url)
        instance.delegate = self
        present(instance, animated: true)
        //you must have present to display this to the UI BUT YOU MUST SET TITLE TO YOUR LABEL OR CELL
      }
   
    func uploadData() {
        zodiacNameLabel.text = horoscopeRef?.zodiacSign
        zodiacDateLabel.text = horoscopeRef?.zodiacDate
        zodiacHoroscopeLabel.text = horoscopeRef?.zodiacReading
        zodiacImageOutlet.image = UIImage(named: horoscopeRef!.zodiacBackground)
        websiteOutlet.setTitle(horoscopeRef?.website, for: .normal)//normal is the style
        
    }

}

extension DetailViewController: SFSafariViewControllerDelegate {

}

extension DetailViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return zodiacHoroscopeLabel
    }
    
    
}
