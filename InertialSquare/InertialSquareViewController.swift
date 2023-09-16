//
//  InertialSquareViewController.swift
//  InertialSquare
//
//  Created by Александр Горелкин on 16.09.2023.
//

import UIKit


final class InertialSquareViewController: UIViewController {
    
    private var location: CGPoint?
    
    private lazy var animator = UIDynamicAnimator(referenceView: view)
    
    private lazy var inertialSquare: UIView = {
        let view = UIView()
        view.frame.size = .init(width: 100, height: 100)
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        location = view.center
        view.backgroundColor = .white
        view.addSubview(inertialSquare)
        inertialSquare.center = view.center
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch: UITouch = touches.first else { return }
        moveToLocation(item: inertialSquare, location: touch.location(in: self.view))
        
    }
    
    func moveToLocation(item: UIView, location: CGPoint) {
        animator.removeAllBehaviors()
        let snapBehavior = UISnapBehavior(item: inertialSquare, snapTo: location)
        snapBehavior.damping = 0.7
        animator.addBehavior(snapBehavior)
    }
    
}
