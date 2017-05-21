//
//  LoginViewController.swift
//  Up
//
//  Created by David Taylor on 5/21/17.
//  Copyright © 2017 Hyper Elephant. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

class LoginViewController: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    
    public var modelData: MainViewModel = MainViewModel()
    {
        didSet {
            setupData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupData()
    {
        if(isViewLoaded){
            TitleLabel.reactive.text <~ modelData.TitleString
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
