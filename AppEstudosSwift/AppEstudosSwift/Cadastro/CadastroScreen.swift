import UIKit

protocol CadastroProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

class CadastroScreen: UIView {
    
    private weak var delegate: CadastroProtocol?
    
    func delegate(_ delegate: CadastroProtocol?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside) //pegar a ação do elemento
        return button
    }()
    
    lazy var cadastroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.text = "Cadastro"
        return label
    }()
    
    lazy var nomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Nome completo:"
        return label
    }()
    
    lazy var nomeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite seu nome completo"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Email:"
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite seu e-mail"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Senha:"
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.placeholder = "Digite sua senha"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1.0), for: .normal)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside) //pegar a ação do elemento
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor =  UIColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1.0)
        self.configSuperView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configSuperView() {
        self.addSubview(backButton)
        self.addSubview(cadastroLabel)
        self.addSubview(nomeLabel)
        self.addSubview(nomeTextField)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(registerButton)
    }
    
    public func configTextFieldDelegate(_ delegate: UITextFieldDelegate) {
        self.nomeTextField.delegate = delegate
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    public func validaTextFields() {
        let nome: String = self.nomeTextField.text ?? ""
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !nome.isEmpty && !email.isEmpty && !password.isEmpty {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
            self.registerButton.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 112/255, alpha: 1.0)
        } else {
            self.registerButton.setTitleColor(UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1.0), for: .normal)
            self.registerButton.isEnabled = false
            self.registerButton.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0)
        }
    }
    
    public func getEmail() -> String {
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return self.passwordTextField.text ?? ""
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.backButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            
            self.cadastroLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            self.cadastroLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            self.nomeLabel.topAnchor.constraint(equalTo: self.cadastroLabel.bottomAnchor, constant: 40),
            self.nomeLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 64),
            
            self.nomeTextField.topAnchor.constraint(equalTo: self.nomeLabel.bottomAnchor, constant: 10),
            self.nomeTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 64),
            self.nomeTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -64),
            self.nomeTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.emailLabel.topAnchor.constraint(equalTo: self.nomeTextField.bottomAnchor, constant: 20),
            self.emailLabel.leadingAnchor.constraint(equalTo: self.nomeLabel.leadingAnchor),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 10),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.nomeTextField.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.nomeTextField.trailingAnchor),
            self.emailTextField.heightAnchor.constraint(equalTo: self.nomeTextField.heightAnchor),
            
            self.passwordLabel.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordLabel.leadingAnchor.constraint(equalTo: self.nomeLabel.leadingAnchor),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 10),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.nomeTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.nomeTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.nomeTextField.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 40),
            self.registerButton.leadingAnchor.constraint(equalTo: self.nomeTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.nomeTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.nomeTextField.heightAnchor),
        ])
    }
}
