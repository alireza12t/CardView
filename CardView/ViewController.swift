//
//  ViewController.swift
//  CardView
//
//  Created by ali on 11/3/20.
//

import UIKit
import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var cardView: DesignableView!
    
    @IBOutlet weak var circle1CenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var circle3CenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var circle4CenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var circle2CenterConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imageView1: DesignableImageView!
    @IBOutlet weak var imageView2: DesignableImageView!
    @IBOutlet weak var imageView3: DesignableImageView!
    @IBOutlet weak var imageView4: DesignableImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCardView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        doAnimation()
    }
    
    
    func doAnimation(){
        UIView.animate(withDuration: 1, delay: 0) { [weak self] in
            self?.circle1CenterConstraint.constant = 30
            self?.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 1, delay: 0.5) { [weak self] in
            self?.circle2CenterConstraint.constant = 30
            self?.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 1, delay: 1) { [weak self] in
            self?.circle3CenterConstraint.constant = 30
            self?.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 1, delay: 1.5) {[weak self] in
            self?.circle4CenterConstraint.constant = 30
            self?.view.layoutIfNeeded()
        } completion: { (_) in
            self.setImages(with: BankHelper.getNextBankImagesGroup())
            UIView.animate(withDuration: 1, delay: 0) { [weak self] in
                self?.circle4CenterConstraint.constant = 0
                self?.view.layoutIfNeeded()
            }
            UIView.animate(withDuration: 1, delay: 0.5) { [weak self] in
                self?.circle3CenterConstraint.constant = 0
                self?.view.layoutIfNeeded()
            }
            UIView.animate(withDuration: 1, delay: 1) { [weak self] in
                self?.circle2CenterConstraint.constant = 0
                self?.view.layoutIfNeeded()
            }
            
            UIView.animate(withDuration: 1, delay: 1.5) {[weak self] in
                self?.circle1CenterConstraint.constant = 0
                self?.view.layoutIfNeeded()
            } completion: { [weak self] (_) in
                self?.doAnimation()
            }
            
        }
    }
    
    func setImages(with names: [String]){
        for (index, imageView) in [imageView1, imageView2, imageView3, imageView4].enumerated() {
            imageView?.image = UIImage(named: names[index]) ?? UIImage()
        }
    }
    
    func configureCardView(){
        self.setImages(with: BankHelper.getNextBankImagesGroup())
        setCardViewBackgroundGradient()
    }
    
    func setCardViewBackgroundGradient(){
        let leftColor = UIColor(red: 18.0 / 255.0, green: 197.0 / 255.0, blue: 149.0 / 255.0, alpha: 1.0).cgColor
        let rightColor = UIColor(red: 133.0 / 255.0, green: 236.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0).cgColor
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.cardView.frame
        gradientLayer.colors = [leftColor, rightColor]
        
        gradientLayer.cornerRadius = 25
        #warning("Bug n showing gradient 🤦🏻‍♂️")
        
        //        cardView.layer.insertSublayer(gradientLayer, at: 0)
    }
}


