/*
 *  FILENAME : StandardButton.swift
 *  APPID : eu.soleriant.MyLaps
 *  CREATION DATE : 2021, April 2cd
 *  AUTHOR : GK
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import Foundation
import UIKit

class StandardButton:UIButton
{    
    func implementStandardButton(unselectedenabledbkgimage:UIImage?,
                                 selectedenabledbkgimage:UIImage?,
                                 unselecteddisabledbkgimage:UIImage?,
                                 selecteddisabledbkgimage:UIImage?,
                                 highlightedbkgimage:UIImage?,
                                 alphafloat:CGFloat,
                                 hidden:Bool,
                                 userinteraction:Bool)
    {
        self.setBackgroundImage(unselectedenabledbkgimage, for: UIControl.State.normal)
        self.setBackgroundImage(selectedenabledbkgimage, for: UIControl.State.selected)
        self.setBackgroundImage(unselecteddisabledbkgimage, for: [UIControl.State.normal, UIControl.State.disabled])
        self.setBackgroundImage(selecteddisabledbkgimage, for: [UIControl.State.selected, UIControl.State.disabled])
        
        self.alpha = alphafloat;
        self.isHidden = hidden;
        self.isUserInteractionEnabled = userinteraction;
    }

}
