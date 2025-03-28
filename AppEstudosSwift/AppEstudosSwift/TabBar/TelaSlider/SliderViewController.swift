import UIKit

class TelaSliderViewController: UIViewController {
    
    var telaSlider: TelaSliderScreen?
    
    override func loadView() {
        self.telaSlider = TelaSliderScreen()
        self.view = self.telaSlider
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.telaSlider?.delegate(self)
    }
}

extension TelaSliderViewController: TelaSliderScreenDelegate {
    func actionSlider(value: Float) {
        let alpha = CGFloat(value) / 100
        self.view.backgroundColor = UIColor(red: 0, green: 206/255, blue: 209/255, alpha: alpha)
    }
}
