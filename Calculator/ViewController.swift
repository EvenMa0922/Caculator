import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsCurrentlyTyping: Bool = false
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    let brain = CalculatorBrain()
    
    @IBAction func clearButton(_ sender: UIButton) {
        self.display.text = "0"
        self.userIsCurrentlyTyping = false
        self.brain.reset()
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        let buttonText = sender.titleLabel!.text!
        
        if userIsCurrentlyTyping {
            let currentText = display.text!
            display.text = currentText + buttonText
        } else {
            display.text = buttonText
            userIsCurrentlyTyping = true
        }
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        self.userIsCurrentlyTyping = false
        self.brain.setOperand(displayValue)
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
}

