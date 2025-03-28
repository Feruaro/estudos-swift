import UIKit

class TelaProgressBarViewController: UIViewController {
    
    var telaProgressBar: TelaProgressScreen?
    
    override func loadView() {
        self.telaProgressBar = TelaProgressScreen()
        self.view = self.telaProgressBar
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
