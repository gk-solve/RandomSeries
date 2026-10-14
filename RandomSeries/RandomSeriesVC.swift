/*
 *  FILENAME : RandomSeriesVC.swift
 *  APPID : eu.soleriant.RandomSeries
 *  CREATION DATE : 2021, July 27th
 *  AUTHOR : GK
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import UIKit

/*
 *  Main (and only) screen of the app.
 *  Shows a display label, a 2 x 5 keypad of letters A-J in a random order, and a Cancel button.
 *  Each tap appends a letter to the display ; Cancel clears it and reshuffles the keypad.
 *  The whole interface is built in code with frames (no storyboard).
 */
class RandomSeriesVC: UIViewController {

    /* Square container holding the display, the keypad and the Cancel button */
    var randomView = StandardView()

    /* Display of the sequence typed so far */
    var displayLabel = StandardLabel()
    var displayText = ""

    /* Keypad : buttonDim is the side of one button (1/5 of the container width) */
    var buttonDim:CGFloat!
    let buttonsView = StandardView()

    /* Images and letters share the same index : index i <=> letter i <=> button tag i */
    var arrayButtonImagesNormal:[String] = ["A.pdf","B.pdf","C.pdf","D.pdf","E.pdf","F.pdf","G.pdf","H.pdf","I.pdf","J.pdf"]
    var arrayLetters:[String] = ["A","B","C","D","E","F","G","H","I","J"]

    /* Cancel button, only visible once at least one letter has been typed */
    let resetButton = StandardButton()


    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.createUserInterface()
    }
    
    /* Builds the whole interface. All sizes derive from the screen width, so the layout assumes portrait orientation */
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
        
        
            /* dim : 5 buttons per row fill the container width */
            buttonDim = 0.2 * self.randomView.frame.size.width

            /* display : top band of the container */
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
            
            /* buttonsView : 2 rows of buttons, vertically centred in the container */
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
            
            /* Reset button : bottom band of the container, hidden until the first tap */
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
    
    /* (Re)creates the 10 keypad buttons in a new random order */
    func insertButtons()
    {
        /* Remove the previous keypad, if any */
        for view:UIView in buttonsView.subviews {view.removeFromSuperview()}

        /* Random permutation of 0...9, computed in C++ (Fisher-Yates) through the Objective-C++ wrapper */
        let shuffledTags:[Int] = BasicOpPack().shuffledArray(withElements: 10) as NSMutableArray as! [Int]

        var xCoordinate:CGFloat!
        var yCoordinate:CGFloat!

            /* Slot i (0-4 : first row, 5-9 : second row) receives the letter shuffledTags[i] */
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
                /* The tag stores the letter index, read back in tapRandomButton */
                randomButton.tag = shuffledTags[i]
                buttonsView.addSubview(randomButton)
                
                randomButton.addTarget(self, action: #selector(tapRandomButton), for: UIControl.Event.touchUpInside)
            }
    }
    
    /* Keypad tap : appends the button's letter to the display and shows the Cancel button */
    @objc func tapRandomButton(sender:StandardButton)
    {
        //displayText = String(format: "%@%i", displayText, sender.tag)
        displayText = String(format: "%@%@", displayText, arrayLetters[sender.tag])
        displayLabel.text = displayText
        
        resetButton.isHidden = false
    }
    
    /* Cancel tap : clears the display, reshuffles the keypad and hides itself */
    @objc func tapResetButton(sender:StandardButton)
    {
        displayText = ""
        displayLabel.text = displayText
        
        self.insertButtons()
        
        resetButton.isHidden = true
    }
}
