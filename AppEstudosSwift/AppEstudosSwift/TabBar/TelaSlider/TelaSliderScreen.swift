import UIKit

protocol TelaSliderScreenDelegate: AnyObject {
    func actionSlider(value: Float)
}

class TelaSliderScreen: UIView {
    
    private weak var delegate: TelaSliderScreenDelegate?
    
    func delegate(_ delegate: TelaSliderScreenDelegate?) {
        self.delegate = delegate
    }

    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .systemBlue
        slider.addTarget(self, action: #selector(self.actionSlider), for: .touchUpInside)
        return slider
    }()
    
    lazy var minimumValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "0"
        return label
    }()
    
    lazy var maximumValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "100"
        return label
    }()
    
    @objc func actionSlider(_ sender: UISlider) {
        self.delegate?.actionSlider(value: sender.value)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor =  UIColor(red: 0, green: 206/255, blue: 209/255, alpha: 0)
        self.configSuperView()
        self.setUpConstraints()
    }
    
    private func configSuperView() {
        self.addSubview(self.slider)
        self.addSubview(self.minimumValueLabel)
        self.addSubview(self.maximumValueLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            slider.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 64),
            slider.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -64),
            
            minimumValueLabel.topAnchor.constraint(equalTo: self.slider.bottomAnchor, constant: 0),
            minimumValueLabel.leadingAnchor.constraint(equalTo: self.slider.leadingAnchor),
            
            maximumValueLabel.topAnchor.constraint(equalTo: self.slider.bottomAnchor, constant: 0),
            maximumValueLabel.trailingAnchor.constraint(equalTo: self.slider.trailingAnchor),
        ])
    }
}
