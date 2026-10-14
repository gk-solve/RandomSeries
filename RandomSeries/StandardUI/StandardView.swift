/*
 *  FILENAME : StandardView.swift
 *  APPID : eu.soleriant.RandomSeries
 *  CREATION DATE : 2021, July 27th
 *  AUTHOR : GK
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import Foundation
import UIKit

/* UIView configured in a single call */
class StandardView:UIView{

    /* Optional inner white border, added by insertInternalFrameWithMargin */
    let internalFrame = UIView()

    /* Basic setup : background, alpha, visibility, interaction */
    func implementStandardView(backgroundColor:UIColor,
                               viewAlpha:CGFloat,
                               hiddenStatus:Bool,
                               userInteraction:Bool)
    {
        self.backgroundColor = backgroundColor
        
        self.alpha = viewAlpha
        self.isHidden = hiddenStatus
        self.isUserInteractionEnabled = userInteraction
    }
    
    /* Basic setup plus layer styling (rounded corners, border, layer background) */
    func implementExtendedStandardView(backgroundColor:UIColor,
                                       layerCornerRadius:CGFloat,
                                       layerBorderColor:UIColor,
                                       layerBorderWidth:CGFloat,
                                       layerBackgroundColor:UIColor,
                                       layerMasksBound:Bool,
                                       viewAlpha:CGFloat,
                                       hiddenStatus:Bool,
                                       userInteraction:Bool)
    {
        self.backgroundColor = backgroundColor
        
        self.layer.cornerRadius = layerCornerRadius
        self.layer.borderColor = layerBorderColor.cgColor
        self.layer.borderWidth = layerBorderWidth
        self.layer.backgroundColor = layerBackgroundColor.cgColor
        self.layer.masksToBounds = layerMasksBound
        
        self.alpha = viewAlpha
        self.isHidden = hiddenStatus
        self.isUserInteractionEnabled = userInteraction
    }
    
    /* Adds a rounded white border inset by `margin`. Call it after the view's frame is set */
    func insertInternalFrameWithMargin(margin:CGFloat)
    {
        internalFrame.frame = CGRect(x: margin,
                                     y: margin,
                                     width: self.frame.size.width - 2*margin,
                                     height: self.frame.size.height - 2*margin)
        
        internalFrame.layer.cornerRadius = 20
        internalFrame.layer.borderColor = UIColor.white.cgColor
        internalFrame.layer.borderWidth = 2
        internalFrame.layer.masksToBounds = true
        
        self.addSubview(internalFrame)
    }
}


