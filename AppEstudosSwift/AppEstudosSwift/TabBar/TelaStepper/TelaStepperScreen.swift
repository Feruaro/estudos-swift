import UIKit

protocol TelaStepperProtocol: AnyObject {
    func actionStepper(value: Double)
}

class TelaStepperScreen: UIView {
    
    private weak var delegate: TelaStepperProtocol?
    
    func delegate(_ delegate: TelaStepperProtocol?) {
        self.delegate = delegate
    }

    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = String(Int(self.stepper.value))
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.value = 50
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.addTarget(self, action: #selector(self.actionStepper), for: .touchUpInside)
        return stepper
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 240/255, green: 248/255, blue: 1, alpha: 1.0)
        self.configSuperView()
        self.setUpConstraints()
    }
    
    @objc func actionStepper(_ sender: UIStepper) {
        self.delegate?.actionStepper(value: sender.value)
    }
    
    private func configSuperView() {
        self.addSubview(stepper)
        self.addSubview(valueLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            stepper.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stepper.centerYAnchor.constraint(equalTo: self.valueLabel.bottomAnchor, constant: 20),
        ])
    }
}
