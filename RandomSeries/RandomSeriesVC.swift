//
//  RandomSeriesVC.swift
//  RandomSeries
//
//  Created by WESTOWN on 27/07/2021.
//

import UIKit

class RandomSeriesVC: UIViewController {

    var randomView = StandardView()
    
    var displayLabel = StandardLabel()
    var displayText = ""
    
    var buttonDim:CGFloat!
    let buttonsView = StandardView()
    var arrayButtonImagesNormal:[String] = ["Zero.pdf","One.pdf","Two.pdf","Three.pdf","Four.pdf","Five.pdf","Six.pdf","Seven.pdf","Eight.pdf","Nine.pdf"]
    
    let resetButton = StandardButton()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.createUserInterface()
    }
    
    func createUserInterface()
    {
        self.view.backgroundColor = AppCommons.shared.darkerGreen
        
        /* Définition écran interne de type "square" */
        randomView.frame = CGRect(x: 10,
                                  y: self.view.center.y - self.view.frame.width/2 + 10,
                                  width: self.view.frame.width - 2*10,
                                  height: self.view.frame.width - 2*10)
        randomView.implementExtendedStandardView(backgroundColor: UIColor.clear,
                                                layerCornerRadius: 20.0,
                                                layerBorderColor: UIColor.clear,
                                                layerBorderWidth: 0.0,
                                                layerBackgroundColor: UIColor.blue,
                                                layerMasksBound: true,
                                                viewAlpha: 1.0,
                                                hiddenStatus: false,
                                                userInteraction: true)
        self.view.addSubview(randomView)
        
        
            /* dim */
            buttonDim = 0.2 * self.randomView.frame.size.width
            
            /* display */
            displayLabel.frame = CGRect(x:20,
                                        y:0.25*buttonDim + 10,
                                        width:self.randomView.frame.size.width - 2*20,
                                        height:buttonDim - 2*10)
            displayLabel.implementExtendedStandardLabel(bkgcolor: UIColor.clear,
                                                        laycornerradius:0.050*self.randomView.frame.size.height,
                                                        laybordercolor:UIColor.gray,
                                                        layborderwidth:2.0,
                                                        laybkgcolor:UIColor.white,
                                                        maskstobounds:true,
                                                        textalign: NSTextAlignment.center,
                                                        fontname: AppCommons.shared.heavyFont,
                                                        fontsize: 1.5*AppCommons.shared.mainPoliceDim,
                                                        textcolor: UIColor.black,
                                                        nboflines: 0,
                                                        linebreakmode: NSLineBreakMode.byWordWrapping,
                                                        alphafloat: 1.0,
                                                        hiddenstatus: false,
                                                        userinteraction: true)
            self.randomView.addSubview(displayLabel)
            
            displayLabel.text = displayText
            
            /* buttonsView */
            buttonsView.frame = CGRect(x: 0,
                                       y: CGFloat(0.50 * self.randomView.frame.size.width - buttonDim),
                                       width: CGFloat(self.randomView.frame.size.width),
                                       height: CGFloat(2*buttonDim))
            buttonsView.implementExtendedStandardView(backgroundColor: UIColor.clear,
                                                      layerCornerRadius: 20,
                                                      layerBorderColor: UIColor.clear,
                                                      layerBorderWidth: 0.0,
                                                      layerBackgroundColor: UIColor.clear,
                                                      layerMasksBound: true,
                                                      viewAlpha: 1.0,
                                                      hiddenStatus: false,
                                                      userInteraction: true)
            self.randomView.addSubview(buttonsView)
            
            self.insertButtons()
            
            /* Reset button */
            resetButton.frame = CGRect(x:20,
                                       y:3.75*buttonDim + 10,
                                       width:self.randomView.frame.size.width - 2*20,
                                       height:buttonDim - 2*10)
            resetButton.implementStandardButton(unselectedenabledbkgimage: nil,
                                                selectedenabledbkgimage: nil,
                                                unselecteddisabledbkgimage: nil,
                                                selecteddisabledbkgimage: nil,
                                                highlightedbkgimage: nil,
                                                alphafloat: 1.0,
                                                hidden: false,
                                                userinteraction: true)
            resetButton.setTitle(NSLocalizedString("Cancel", comment:""), for: UIControl.State.normal)
            resetButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            resetButton.setTitleColor(UIColor.gray, for: UIControl.State.highlighted)
            self.randomView.addSubview(resetButton)
            
            resetButton.isHidden = true
            
            resetButton.addTarget(self, action: #selector(tapResetButton), for: UIControl.Event.touchUpInside)
    }
    
    func insertButtons()
    {
        for view:UIView in buttonsView.subviews {view.removeFromSuperview()}
        
        let shuffledTags:[Int] = BasicOpPack().shuffledArray(withElements: 10) as NSMutableArray as! [Int]
        
        var xCoordinate:CGFloat!
        var yCoordinate:CGFloat!
    
            for i in 0..<arrayButtonImagesNormal.count
            {
                if i<5{
                    xCoordinate = CGFloat(i)
                    yCoordinate = 0
                }
                if i>=5 && i<10{
                    xCoordinate = CGFloat(i-5)
                    yCoordinate = 1
                }
                
                let randomButton = StandardButton()
                randomButton.frame = CGRect(x: CGFloat(xCoordinate * buttonDim),
                                            y: CGFloat(yCoordinate * buttonDim),
                                            width: buttonDim,
                                            height: buttonDim)
                randomButton.implementStandardButton(unselectedenabledbkgimage: UIImage(named:arrayButtonImagesNormal[shuffledTags[i]]),
                                                     selectedenabledbkgimage: nil,
                                                     unselecteddisabledbkgimage: nil,
                                                     selecteddisabledbkgimage: nil,
                                                     highlightedbkgimage: nil,
                                                     alphafloat: 1.0,
                                                     hidden: false,
                                                     userinteraction: true)
                randomButton.tag = shuffledTags[i]
                buttonsView.addSubview(randomButton)
                
                randomButton.addTarget(self, action: #selector(tapRandomButton), for: UIControl.Event.touchUpInside)
            }
    }
    
    @objc func tapRandomButton(sender:StandardButton)
    {
        displayText = String(format: "%@%i", displayText, sender.tag)
        displayLabel.text = displayText
        
        resetButton.isHidden = false
    }
    
    @objc func tapResetButton(sender:StandardButton)
    {
        displayText = ""
        displayLabel.text = displayText
        
        self.insertButtons()
        
        resetButton.isHidden = true
    }
}
