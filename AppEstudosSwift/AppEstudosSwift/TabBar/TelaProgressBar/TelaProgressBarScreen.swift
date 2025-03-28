import UIKit

class TelaProgressScreen: UIView {
    var totalCountProgress = Progress(totalUnitCount: 100)
    var valueProgress: Int = 0
    
    lazy var progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        self.totalCountProgress.completedUnitCount = 0
        progress.progress = Float(totalCountProgress.fractionCompleted)
        progress.tintColor = .systemBlue
        return progress
    }()
    
    lazy var carregarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Carregar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 112/255, alpha: 1.0)
        button.addTarget(self, action: #selector(actionCarregarButton), for: .touchUpInside)
        return button
    }()
    
    @objc func carregarProgressView() {
        if valueProgress >= 100 {
            return
        }
        
        self.valueProgress += 1
        self.totalCountProgress.completedUnitCount = Int64(self.valueProgress)
        self.progressView.progress = Float(self.totalCountProgress.fractionCompleted)
    }
    
    @objc func actionCarregarButton() {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.carregarProgressView), userInfo: nil, repeats: true)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 240/255, green: 248/255, blue: 1, alpha: 1.0)
        self.configSuperView()
        self.setUpConstraints()
    }
    
    private func configSuperView() {
        self.addSubview(self.progressView)
        self.addSubview(self.carregarButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.progressView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            self.progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            
            self.carregarButton.topAnchor.constraint(equalTo: self.progressView.bottomAnchor, constant: 30),
            self.carregarButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            self.carregarButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
        ])
    }

}
