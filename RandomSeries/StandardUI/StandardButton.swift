/*
 *  FILENAME : StandardButton.swift
 *  APPID : eu.soleriant.RandomSeries
 *  CREATION DATE : 2021, July 27th
 *  AUTHOR : GK
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import Foundation
import UIKit

/* UIButton configured in a single call (background images per state, alpha, visibility, interaction) */
class StandardButton:UIButton
{
    /* Sets the background image for each state ; pass nil for the states that are not used */
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
