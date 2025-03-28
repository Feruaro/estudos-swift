import Foundation
import UIKit

class Alert: NSObject {
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "Ok", style: .default) { acao in completion?()}
        
        alertController.addAction(cancelar)
        self.controller.present(alertController, animated: true, completion: nil)
    }
}
