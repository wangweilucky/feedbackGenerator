//
//  ViewController.swift
//  沉浸式体验
//
//  Created by 王大吉 on 27/6/2018.
//  Copyright © 2018 王大吉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectedFeedback      = UISelectionFeedbackGenerator()
    let impactLightFeedback   = UIImpactFeedbackGenerator(style: .light)
    let impactMediumFeedback  = UIImpactFeedbackGenerator(style: .medium)
    let impactHeavyFeedback   = UIImpactFeedbackGenerator(style: .heavy)
    let notificationFeedback  = UINotificationFeedbackGenerator()
    
    var feedbackGenerator : UISelectionFeedbackGenerator? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(gestureHandler(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            selectedFeedback.selectionChanged()
        case 2:
            selectedFeedback.selectionChanged()
        case 3:
            impactLightFeedback.impactOccurred()
        case 4:
            impactMediumFeedback.impactOccurred()
        case 5:
            impactHeavyFeedback.impactOccurred()
        case 6:
            notificationFeedback.notificationOccurred(.success)
        case 7:
            notificationFeedback.notificationOccurred(.warning)
        case 8:
            notificationFeedback.notificationOccurred(.error)
        default:
            break
        }
        
    }
    
    @IBAction func gestureHandler(_ sender: UIPanGestureRecognizer) {
        
        switch(sender.state) {
        case .began:
            
            // Instantiate a new generator.
            feedbackGenerator = UISelectionFeedbackGenerator()
            
            // Prepare the generator when the gesture begins.
            feedbackGenerator?.prepare()
            
        case .changed:
            
            // Check to see if the selection has changed...
            // Trigger selection feedback.
            feedbackGenerator?.selectionChanged()
            
            // Keep the generator in a prepared state.
            feedbackGenerator?.prepare()
            
        case .cancelled, .ended, .failed:
            
            // Release the current generator.
            feedbackGenerator = nil
            
        default:
            // Do Nothing.
            break
        }}
}

