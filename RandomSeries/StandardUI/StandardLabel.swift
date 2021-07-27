/*
 *  FILENAME : StandardLabel.swift
 *  APPID : eu.soleriant.RandomSeries
 *  CREATION DATE : 2021, July 27th
 *  AUTHOR : GK
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import Foundation
import UIKit

class StandardLabel:UILabel
{
    func implementStandardLabel(bkgcolor:UIColor,
                                textalign:NSTextAlignment,
                                fontname:String,
                                fontsize:CGFloat,
                                textcolor:UIColor,
                                nboflines:Int,
                                linebreakmode:NSLineBreakMode,
                                alphafloat:CGFloat,
                                hiddenstatus:Bool,
                                userinteraction:Bool)
    {
        self.backgroundColor = bkgcolor
        
        self.textAlignment = textalign
        self.font = UIFont(name: fontname, size: fontsize)
        self.textColor = textcolor
        self.numberOfLines = nboflines
        self.lineBreakMode = linebreakmode
        
        self.alpha = alphafloat
        self.isHidden = hiddenstatus
        self.isUserInteractionEnabled = userinteraction
    }
    
    func implementExtendedStandardLabel(bkgcolor:UIColor,
                                        laycornerradius:CGFloat,
                                        laybordercolor:UIColor,
                                        layborderwidth:CGFloat,
                                        laybkgcolor:UIColor,
                                        maskstobounds:Bool,
                                        textalign:NSTextAlignment,
                                        fontname:String,
                                        fontsize:CGFloat,
                                        textcolor:UIColor,
                                        nboflines:Int,
                                        linebreakmode:NSLineBreakMode,
                                        alphafloat:CGFloat,
                                        hiddenstatus:Bool,
                                        userinteraction:Bool)
    {
        self.backgroundColor = bkgcolor
        self.layer.cornerRadius = laycornerradius
        self.layer.borderColor = laybordercolor.cgColor
        self.layer.borderWidth = layborderwidth
        self.layer.backgroundColor = laybkgcolor.cgColor
        self.layer.masksToBounds = maskstobounds
        
        self.textAlignment = textalign
        self.font = UIFont(name: fontname, size: fontsize)
        self.textColor = textcolor
        self.numberOfLines = nboflines
        self.lineBreakMode = linebreakmode
        
        self.alpha = alphafloat
        self.isHidden = hiddenstatus
        self.isUserInteractionEnabled = userinteraction
    }

    
    func display(mytext:String)
    {
        self.text = mytext
    }
}
