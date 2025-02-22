//
//  ViewController.swift
//  AnimationsPractice
//
//  Created by Benjamin Stone on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var buttonStackView: UIStackView = {
       let buttonStack = UIStackView(arrangedSubviews: [LeftButton, RightButton, upButton, downButton])
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 15
        return buttonStack
    }()
    
    lazy var upButton: UIButton = {
       let button = UIButton()
        button.setTitle("Move up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareUp(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var downButton: UIButton = {
       let button = UIButton()
        button.setTitle("Move down", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareDown(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var LeftButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move left", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareLeft(sender:)), for: .touchUpInside)
        return button
        
    }()
    
    
    lazy var RightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move right", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareRight(sender:)), for: .touchUpInside)
        return button
        
    }()
    lazy var blueSquareHeightConstaint: NSLayoutConstraint = {
        blueSquare.heightAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareWidthConstraint: NSLayoutConstraint = {
        blueSquare.widthAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareCenterXConstraint: NSLayoutConstraint = {
        blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()
    
    lazy var blueSquareCenterYConstraint: NSLayoutConstraint = {
        blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
    }
    
    @objc func animateSquareUp(sender: UIButton) {
        let oldXPosition = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldXPosition - 150
        UIView.animate(withDuration: 2) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func animateSquareDown(sender: UIButton) {
        let oldYPosition = blueSquareCenterYConstraint.constant
        
        blueSquareCenterYConstraint.constant = oldYPosition + 150
        //This is saying that it wants the square to go from where it was before but move 150 units down.
        UIView.animate(withDuration: 2) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func animateSquareLeft(sender: UIButton) {
        let oldXPosition = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldXPosition - 150
        UIView.animate(withDuration: 1.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func animateSquareRight(sender: UIButton) {
        let oldXPosition = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldXPosition + 150
        UIView.animate(withDuration: 1.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func addSubviews() {
        view.addSubview(blueSquare)
        addStackViewSubviews()
        view.addSubview(buttonStackView)
    }
    
    private func addStackViewSubviews() {
        buttonStackView.addSubview(upButton)
        buttonStackView.addSubview(downButton)
        buttonStackView.addSubview(LeftButton)
    }
    
    private func configureConstraints() {
        constrainBlueSquare()
        constrainButtonStackView()
    }

    
    private func constrainBlueSquare() {
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueSquareHeightConstaint,
            blueSquareWidthConstraint,
            blueSquareCenterXConstraint,
            blueSquareCenterYConstraint
        ])
    }
    
    private func constrainButtonStackView() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}


