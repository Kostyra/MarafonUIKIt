//
//  ViewController.swift
//  SquareView
//
//  Created by Юлия Филиппова on 01.11.2023.
//

import UIKit

//final class ViewController: UIViewController {
//
//
//    private lazy var square:UIView =  {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
//         view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 12
//
//
//
//
//        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
//        view.clipsToBounds = true
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowRadius = 50
//        view.layer.shadowOffset = .zero
//        view.layer.shadowOpacity = 0.5
//        view.layer.masksToBounds = false
//
//
//
//         let gradientLayer = CAGradientLayer()
//         gradientLayer.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
//         gradientLayer.frame = view.bounds
//         view.layer.insertSublayer(gradientLayer, at: 0)
//
//
//        return view
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setup()
//
//    }
//
//    private func setup() {
//        view.addSubview(square)
//
//        NSLayoutConstraint.activate([
//            square.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            square.heightAnchor.constraint(equalToConstant: 150),
//            square.widthAnchor.constraint(equalToConstant: 150),
//            square.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
//        ])
//    }
//}


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
