//
//  ViewController.swift
//  customCounting
//
//  Created by Nathan Ranghel on 14/10/18.
//  Copyright © 2018 Nathan Ranghel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     let  countingLabel : UILabel = {
        let label = UILabel()
        label.text = "1234"
        label.textAlignment = .center
        label.backgroundColor  = .orange
        label.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.sizeToFit()
        
        return label
    }()
    let  countingButton : UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Atualizar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor  = .red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(reload), for: .touchUpInside)
        
        return button
    }()
    
    
    @objc func reload() {
        self.startValue = 0.0
        animationStartDate = Date()
        print(startValue)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(countingLabel)
        view.addSubview(countingButton)
     

        countingButton.translatesAutoresizingMaskIntoConstraints = false
         countingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countingButton.topAnchor.constraint(equalTo: countingLabel.safeAreaLayoutGuide.bottomAnchor),
           // countingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            countingLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            countingLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            countingLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        
        let displayLink = CADisplayLink(target: self, selector: #selector(handlerUpdate))
        
        displayLink.add(to: .main, forMode: .default)
    }
    
    var startValue = 0.0
    let endValue = 12000.0
    let animationDuration : Double = 3.5
    var animationStartDate = Date()
    
    @objc func handlerUpdate(){
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
        
        if elapsedTime > animationDuration {
            countingLabel.text = String(format: "%.2f",endValue)
        }else {
            let porcentage = elapsedTime / animationDuration
            startValue = startValue + porcentage * (endValue - startValue)
            
            countingLabel.text = String(format: "%.2f",startValue)
        }
   
        
    }


}

