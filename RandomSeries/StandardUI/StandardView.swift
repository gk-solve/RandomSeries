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

class StandardView:UIView{
    
    let internalFrame = UIView()
        
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


