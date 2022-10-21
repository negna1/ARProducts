//
//  StarterViewController.swift
//  ARKitInteraction
//
//  Created by Nato Egnatashvili on 21.10.22.
//  Copyright © 2022 Apple. All rights reserved.
//

import Combine
import UIKit

class StarterViewController: UIViewController {
    var viewModel: StarterViewModelType = StarterViewModel()
    
    @IBAction func nextContr() {
        move2ARController()
    }
    
    @IBAction func switchHandler(_ switchB: UISwitch) {
        viewModel.outputs.tapSwitch(value: switchB.isOn)
    }
    
    override func viewDidLoad() {
        print("yes")
        viewModel.inputs.changeSwitch.receive(subscriber: self)
    }
    
    private func move2ARController() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewControllerI")
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}


extension StarterViewController: Subscriber {
    
    func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
    func receive(_ input: Bool) -> Subscribers.Demand {
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("sd")
    }
    
    typealias Input = Bool
    
    typealias Failure = Never
    
}
