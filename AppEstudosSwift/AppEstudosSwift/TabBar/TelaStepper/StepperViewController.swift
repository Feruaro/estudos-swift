import UIKit

class TelaStepperViewController: UIViewController {
    
    var telaStepper: TelaStepperScreen?
    
    override func loadView() {
        self.telaStepper = TelaStepperScreen()
        self.view = self.telaStepper
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.telaStepper?.delegate(self)
        self.actionStepper(value: self.telaStepper?.stepper.value ?? 0)
    }
}

extension TelaStepperViewController: TelaStepperProtocol {
    func actionStepper(value:  Double) {
        self.telaStepper?.valueLabel.text = String(Int(value))
    }
}
