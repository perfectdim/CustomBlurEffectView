//
//  CustomBlurEffectView.swift
//  CustomBlurEffectView
//
//  Created by Kononec Dmitrii on 07.09.2020.
//

import UIKit

open class CustomBlurEffectView: UIView {
    
    private enum Constants {
        static let blurRadiusKey = "blurRadius"
        static let colorTintKey = "colorTint"
        static let colorTintAlphaKey = "colorTintAlpha"
    }
    
    // MARK: - Public
    
    /// Blur radius. Defaults to `10`
    open var blurRadius: CGFloat = 10.0 {
        didSet {
            _setValue(blurRadius, forKey: Constants.blurRadiusKey)
        }
    }
    
    /// Tint color. Defaults to `nil`
    open var colorTint: UIColor? {
        didSet {
            _setValue(colorTint, forKey: Constants.colorTintKey)
        }
    }
    
    /// Tint color alpha. Defaults to `0.8`
    open var colorTintAlpha: CGFloat = 0.8 {
        didSet {
            _setValue(colorTintAlpha, forKey: Constants.colorTintAlphaKey)
        }
    }
    
    /// Visual effect view layer.
    public var blurLayer: CALayer {
        return visualEffectView.layer
    }
    
    // MARK: - Initialization
    
    public init(
        radius: CGFloat = 10.0,
        color: UIColor? = nil,
        colorAlpha: CGFloat = 0.8) {
        blurRadius = radius
        super.init(frame: .zero)
        backgroundColor = .clear
        setupViews()
        defer {
            blurRadius = radius
            colorTint = color
            colorTintAlpha = colorAlpha
        }
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
        setupViews()
        defer {
            blurRadius = 10.0
            colorTint = nil
            colorTintAlpha = 0.8
        }
    }
    
    
    // MARK: - Private
    
    /// Visual effect view.
    private lazy var visualEffectView: UIVisualEffectView = {
        if #available(iOS 14.0, *) {
            return UIVisualEffectView(effect: customBlurEffect_ios14)
        } else {
            return UIVisualEffectView(effect: customBlurEffect)
        }
    }()
    
    /// Blur effect for IOS >= 14
    private lazy var customBlurEffect_ios14: CustomBlurEffect = {
        let effect = CustomBlurEffect.effect(with: .extraLight)
        effect.blurRadius = blurRadius
        return effect
    }()
    
    /// Blur effect for IOS < 14
    private lazy var customBlurEffect: UIBlurEffect = {
        return (NSClassFromString("_UICustomBlurEffect") as! UIBlurEffect.Type).init()
    }()
    
    /// Sets the value for the key on the blurEffect.
    private func _setValue(_ value: Any?, forKey key: String) {
        if #available(iOS 14.0, *) {
            if key == Constants.blurRadiusKey {
                updateViews()
            }
            let subviewClass = NSClassFromString("_UIVisualEffectSubview") as? UIView.Type
            let visualEffectSubview: UIView? = visualEffectView.subviews.filter({ type(of: $0) == subviewClass }).first
            visualEffectSubview?.backgroundColor = colorTint
            visualEffectSubview?.alpha = colorTintAlpha
        } else {
            customBlurEffect.setValue(value, forKeyPath: key)
            visualEffectView.effect = customBlurEffect
        }
    }
    
    /// Setup views.
    private func setupViews() {
        addSubview(visualEffectView)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(equalTo: topAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    /// Update visualEffectView for ios14+, if we need to change blurRadius
    private func updateViews() {
        if #available(iOS 14.0, *) {
            visualEffectView.removeFromSuperview()
            let newEffect = CustomBlurEffect.effect(with: .extraLight)
            newEffect.blurRadius = blurRadius
            customBlurEffect_ios14 = newEffect
            visualEffectView = UIVisualEffectView(effect: customBlurEffect_ios14)
            setupViews()
        }
    }
}
