import UIKit

class TelaSwitchViewController: UIViewController {
    
    var telaSwitch: TelaSwitchScreen?
    
    override func loadView() {
        self.telaSwitch = TelaSwitchScreen()
        self.view = self.telaSwitch
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.telaSwitch?.delegate(self)
        self.actionSwitch(isOn: self.telaSwitch?.checkSwitch.isOn ?? false)
    }
}

extension TelaSwitchViewController: TelaSwitchProtocol {
    func actionSwitch(isOn: Bool) {
        if isOn {
            self.telaSwitch?.label.text = "on"
            self.telaSwitch?.label.textColor = .white
            self.telaSwitch?.backgroundColor = UIColor(red: 54/255, green: 54/255, blue: 54/255, alpha: 1.0)
        } else {
            self.telaSwitch?.label.text = "off"
            self.telaSwitch?.label.textColor = .black
            self.telaSwitch?.backgroundColor = UIColor(red: 240/255, green: 248/255, blue: 1, alpha: 1.0)
        }
    }
}
