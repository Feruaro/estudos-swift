import UIKit
import Firebase

class CadastroViewController: UIViewController {
    
    var cadastroScreen: CadastroScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        self.cadastroScreen = CadastroScreen()
        self.view = self.cadastroScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.cadastroScreen?.delegate(self)
        self.cadastroScreen?.configTextFieldDelegate(self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
}

extension CadastroViewController: CadastroProtocol {
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        guard let register = self.cadastroScreen else { return }
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: {(result, error) in
                if error != nil {
                    guard let messageError = error?.localizedDescription else { return }
                    self.alert?.getAlert(title: "Atenção", message: "\(String(describing: messageError))")
                } else {
                    self.alert?.getAlert(title: "Parabéns!", message: "Usuário cadastrado com sucesso.", completion: {
                        self.actionBackButton()
                    })
                }
        })
    }
}

extension CadastroViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.cadastroScreen?.validaTextFields()
    }
}
