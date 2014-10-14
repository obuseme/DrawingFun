//
//  ViewController.swift
//  DrawingFun
//
//  Created by Matt Rein on 10/10/14.
//  Copyright (c) 2014 mr. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var drawView: DrawOnView!
    
    //Just for debugging purposes... should be removed later:
    @IBOutlet var startPointLabel: UILabel!
    @IBOutlet var endPointLabel: UILabel!

    let panRec = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        panRec.addTarget(self, action: "draggedView:")
        drawView.addGestureRecognizer(panRec)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func draggedView(sender:UIPanGestureRecognizer){
        self.view.bringSubviewToFront(sender.view!)
        
        var touchPoint = sender.locationInView(sender.view!)
        
        if sender.state == UIGestureRecognizerState.Began {
            startPointLabel.text = NSStringFromCGPoint(touchPoint)
            drawView.startPoint = touchPoint
        } else if sender.state == UIGestureRecognizerState.Changed {
            endPointLabel.text = NSStringFromCGPoint(touchPoint)
            drawView.touchPoint = touchPoint
            drawView.setNeedsDisplay()
        }
    }

}

 