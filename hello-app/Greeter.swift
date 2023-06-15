//
//  Greeter.swift
//  hello-app
//
//  Created by Sarah Smith on 15/6/2023.
//

import Foundation

protocol GreeterProtocol: AnyObject {
    func incrementEnabledDidChange(to enabled: Bool)
    func greetingDidChange(to greetingString: String)
}

class Greeter {
    var currentGreeting = 0
    
    var currentGreeter: String = "World" {
        didSet {
            updateGreeting()
        }
    }
    
    weak var delegate: GreeterProtocol?
    
    let greetings = [
        "Hello",
        "Howdy",
        "Good day",
        "Fancy meeting you here"
    ]
    
    func incrementGreeting() {
        currentGreeting = currentGreeting + 1
        updateGreeting()
    }
    
    func updateGreeting() {
        if currentGreeting >= greetings.count {
            delegate?.incrementEnabledDidChange(to: false)
            delegate?.greetingDidChange(
                to: "All out of greetings"
            )
        } else {
            delegate?.incrementEnabledDidChange(to: true)
            delegate?.greetingDidChange(
                to: "\(greetings[currentGreeting]) \(currentGreeter)"
            )
        }
    }
}
