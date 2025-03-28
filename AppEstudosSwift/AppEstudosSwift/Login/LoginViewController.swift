import UIKit
import Firebase

class LoginViewController: UIViewController {
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
}

extension LoginViewController:LoginScreenProtocol {
    func actionLoginButton() {
        guard let login = self.loginScreen else { return }
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: {(usuario, error) in
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Dados incorretos, verifique e tente novamente.")
            } else {
                if usuario == nil {
                    self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inespedado. Tente novamente mais tarde.")
                } else {
                    let vc = TabBarController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        })
    }
    
    func actionRegisterButton() {
        let vc = CadastroViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validaTextFields()
    }
}


