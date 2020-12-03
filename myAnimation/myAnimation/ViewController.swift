//
//  ViewController.swift
//  myAnimation
//
//  Created by Pushparaj Selvam on 30/11/20.
//

import UIKit

class ViewController: UIViewController {
    let imgview:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "berkay-gumustekin-ngqyo2AYYnE-unsplash")
        img.contentMode = .scaleToFill
        return img
    }()
    
    let btn:UIButton = {
        let btn1 = UIButton(frame: CGRect(x: 150, y: 250, width: 100, height: 60))
        btn1.backgroundColor = .white
        btn1.setTitle("Blur", for: .normal)
        btn1.setTitleColor(.red, for: .normal)
        btn1.addTarget(self, action: #selector(doit), for: .touchUpInside)
        btn1.layer.borderWidth = 0.2
        btn1.layer.cornerRadius = 5
        return btn1
    }()
   
    let btn2:UIButton = {
        let btn1 = UIButton(frame: CGRect(x: 150, y: 250, width: 100, height: 60))
        btn1.backgroundColor = .white
        btn1.setTitle("Vibrancy", for: .normal)
        btn1.setTitleColor(.red, for: .normal)
        btn1.layer.borderWidth = 0.2
        btn1.layer.cornerRadius = 2
        btn1.addTarget(self, action: #selector(doit1), for: .touchUpInside)
        return btn1
    }()
    
    let blurEffect = UIBlurEffect(style: .dark)
    var blurredEffectView:UIVisualEffectView?
    
    var vibrancyEffect:UIVibrancyEffect?
    var vibrancyEffectView:UIVisualEffectView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgview.frame = view.bounds
        view.addSubview(imgview)
        view.addSubview(btn)
    }
    
    @objc func doit(){
        blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView!.frame = imgview.bounds
        view.addSubview(blurredEffectView!)
        blurredEffectView!.contentView.addSubview(btn2)
    }
    
    @objc func doit1(){
        let segmentedControl = UISegmentedControl(items: ["First Item", "Second Item"])
        segmentedControl.sizeToFit()
        segmentedControl.center = view.center
        vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyEffectView!.frame = imgview.bounds
        vibrancyEffectView!.contentView.addSubview(segmentedControl)
        btn2.removeFromSuperview()
        blurredEffectView!.contentView.addSubview(vibrancyEffectView!)
    }
    
}


