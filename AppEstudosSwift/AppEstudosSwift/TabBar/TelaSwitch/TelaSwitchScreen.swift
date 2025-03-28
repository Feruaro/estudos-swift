import UIKit

protocol TelaSwitchProtocol: AnyObject {
    func actionSwitch(isOn: Bool)
}

class TelaSwitchScreen: UIView {
    
    private weak var delegate: TelaSwitchProtocol?
    
    func delegate(_ delegate: TelaSwitchProtocol?) {
        self.delegate = delegate
    }

    lazy var checkSwitch: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.isOn = false //estado inicial
        switchView.onTintColor = .systemBlue
        switchView.addTarget(self, action: #selector(self.actionSwitch), for: .touchUpInside)
        return switchView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    @objc func actionSwitch(_ sender: UISwitch) {
        self.delegate?.actionSwitch(isOn: sender.isOn)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor =  UIColor(red: 240/255, green: 248/255, blue: 1, alpha: 1.0)
        self.configSuperView()
        self.setUpConstraints()
    }
    
    private func configSuperView() {
        self.addSubview(self.checkSwitch)
        self.addSubview(self.label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            checkSwitch.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            checkSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.topAnchor.constraint(equalTo: self.checkSwitch.bottomAnchor, constant: 10)
        ])
    }

}
