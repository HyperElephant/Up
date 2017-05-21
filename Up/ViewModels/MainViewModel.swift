//
//  MainViewModel.swift
//  Up
//
//  Created by David Taylor on 5/21/17.
//  Copyright © 2017 Hyper Elephant. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

class MainViewModel: NSObject {
    
    public let TitleString: MutableProperty<String>
    
    override init()
    {
        TitleString = MutableProperty("Test")
        super.init()
    }

}
