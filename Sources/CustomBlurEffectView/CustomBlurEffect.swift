//
//  CustomBlurEffect.swift
//  CustomBlurEffectView
//
//  Created by Kononec Dmitrii on 07.09.2020.
//

import UIKit

class CustomBlurEffect: UIBlurEffect {
    
    public var blurRadius: CGFloat = 10.0
    
    private enum Constants {
        static let blurRadiusSettingKey = "blurRadius"
    }
    
    class func effect(with style: UIBlurEffect.Style) -> CustomBlurEffect {
        let result = super.init(style: style)
        object_setClass(result, self)
        return result as! CustomBlurEffect
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let result = super.copy(with: zone)
        object_setClass(result, Self.self)
        return result
    }
    
    override var effectSettings: AnyObject {
        get {
            let settings = super.effectSettings
            settings.setValue(blurRadius, forKey: Constants.blurRadiusSettingKey)
            return settings
        }
        set {
            super.effectSettings = newValue
        }
    }
    
}
