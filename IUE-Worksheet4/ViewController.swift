//
//  ViewController.swift
//  IUE-Worksheet4
//
//  Created by formando on 30/10/2019.
//  Copyright © 2019 formando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var plusButton: CustomButtom!
    @IBOutlet var minusButton: CustomButtom!
    @IBOutlet var counterView: CounterView!
    @IBOutlet var counterLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        plusButton.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        minusButton.transform = CGAffineTransform(translationX: view.bounds.width, y: 0)
        counterView.transform = CGAffineTransform(translationX: 0, y: -view.bounds.height)
        counterLabel.transform = CGAffineTransform(translationX: 0, y: view.bounds.height)
    }
    
    override func   viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1, delay: 0,
        options: [.curveEaseInOut], animations: {[weak self] in
            self?.plusButton.transform = CGAffineTransform.identity
            self?.minusButton.transform = CGAffineTransform.identity
            self?.counterView.transform = CGAffineTransform.identity
            self?.counterLabel.transform = CGAffineTransform.identity
        }, completion: nil)
    }

    @IBAction func plusButtonClick(_ sender: Any) {
        UIView.animate(withDuration: 0.5,
                            animations: {[weak self] in
                                self?.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                                self?.plusButton.transform = CGAffineTransform.identity
            })
        counterView.currentNumber += 1
        updateCounterLabel()
    }
    
    @IBAction func minusButtonClick(_ sender: Any) {
        UIView.animate(withDuration: 0.25, animations: {[weak self] in
                self?.minusButton.transform = CGAffineTransform(scaleX: 2, y: 2)
                        self?.minusButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
        counterView.currentNumber -= 1
        updateCounterLabel()
    }
    
    private func updateCounterLabel() {
        UIView.transition(with: counterLabel,
                          duration: 0.25,
                          options: .transitionCrossDissolve, animations: { [weak self] in
                            guard let self = self else { return }
                            self.counterLabel.text =
                                String(self.counterView.currentNumber)
            }, completion: nil)
        
    }
    
}

