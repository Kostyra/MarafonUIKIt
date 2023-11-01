

import UIKit




final class ViewController:   UIViewController {
    
    private lazy var shadowView: UIView = {
        let shadowView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        shadowView.layer.shadowRadius = 8.0
        shadowView.layer.shadowOpacity = 1
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        return shadowView
    }()
    
    private lazy var roundedView: UIView = {
        let roundedView = UIView()
        roundedView.frame = shadowView.bounds
        roundedView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner]
        roundedView.layer.cornerRadius = 10
        roundedView.layer.masksToBounds = true
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = roundedView.bounds
        roundedView.layer.insertSublayer(gradientLayer, at: 0)
        
        return roundedView
    }()
  override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
}
    
        private func setup() {
            shadowView.addSubview(roundedView)
            view.addSubview(shadowView)
    
            NSLayoutConstraint.activate([
                shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                shadowView.heightAnchor.constraint(equalToConstant: 150),
                shadowView.widthAnchor.constraint(equalToConstant: 150),
                shadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
            ])
        }
    
    
}
