//
//  ViewController.swift
//  hello-app
//
//  Created by Sarah Smith on 15/6/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var newGreetingButton: UIButton!
    
    let greeter = Greeter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greeter.delegate = self
        greeter.updateGreeting()
        newGreetingButton.setTitle("Next greeting", for: .normal)
    }

    @IBAction func greetingButtonTapped(_ sender: Any) {
        greeter.incrementGreeting()
    }
    
    @IBAction func editingChanged(_ sender: Any) {
        if let whoToGreetTextField = sender as? UITextField {
            greeter.currentGreeter = whoToGreetTextField.text ?? "World"
        }
    }
}

extension ViewController: GreeterProtocol {
    func incrementEnabledDidChange(to enabled: Bool) {
        newGreetingButton.isEnabled = enabled
    }
    func greetingDidChange(to greetingString: String) {
        greetingLabel.text = greetingString
    }
}
