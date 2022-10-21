//
//  StarterViewModel.swift
//  ARKitInteraction
//
//  Created by Nato Egnatashvili on 21.10.22.
//  Copyright © 2022 Apple. All rights reserved.
//

import Combine

protocol StarterViewModelInput: AnyObject {
    var changeSwitch: PassthroughSubject<Bool, Never> { get }
}

protocol StarterViewModelOutput: AnyObject {
    func tapNextPage()
    func tapSwitch(value: Bool)
}

class StarterViewModel: ObservableObject, Identifiable,
                        StarterViewModelInput,
                        StarterViewModelOutput {
    var changeSwitch: PassthroughSubject<Bool, Never>
    
    public init() {
        changeSwitch = PassthroughSubject<Bool, Never>.init()
    }
  
    func tapNextPage() {
        changeSwitch.send(false)
    }
    
    func tapSwitch(value: Bool) {
        print(value)
    }
}

protocol StarterViewModelType: AnyObject {
    var inputs: StarterViewModelInput { get }
    var outputs: StarterViewModelOutput { get }
}

extension StarterViewModel: StarterViewModelType {
    var inputs: StarterViewModelInput {
        return self
    }
    
    var outputs: StarterViewModelOutput {
        return self
    }
}
