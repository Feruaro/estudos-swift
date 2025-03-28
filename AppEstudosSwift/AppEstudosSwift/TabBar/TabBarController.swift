import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.setUpTabBarController()
    }
    
    private func setUpTabBarController() {
        let telaSwitch = UINavigationController(rootViewController: TelaSwitchViewController())
        let telaSlider = UINavigationController(rootViewController: TelaSliderViewController())
        let telaProgress = UINavigationController(rootViewController: TelaProgressBarViewController())
        let telaStepper = UINavigationController(rootViewController: TelaStepperViewController())
        let telaTableView = UINavigationController(rootViewController: TelaTableViewViewController())
        
        self.setViewControllers([telaSwitch, telaSlider, telaProgress, telaStepper, telaTableView], animated: true)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        guard let items = self.tabBar.items else {return}
        self.setUpItemsTabBar(items)
    }
    
    private func setUpItemsTabBar(_ items: [UITabBarItem]) {
        let titulos = ["Switch", "Slider", "Progress", "Stepper", "TableView"]
        let images = ["mensagem", "search", "usuario", "ajuste", "lixeira"]
        
        for item in items {
            guard let index = items.firstIndex(of: item) else { continue }
            item.title = titulos[index]
            item.image = UIImage(named: images[index])
        }
    }
    
}
