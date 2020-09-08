//
//  ContentView.swift
//  CustomBlurEffectView
//
//  Created by Kononec Dmitrii on 07.09.2020.
//

import UIKit
import CustomBlurEffectView

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private let colors: [UIColor] = [
        .red,
        .cyan,
        .black,
        .blue,
        .clear,
        .green,
        .yellow
    ]
    
    private lazy var backgroundImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "Orange"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: blurEffectViews)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var blurEffectViews: [CustomBlurEffectView] = {
        var views = [CustomBlurEffectView]()
        colors.forEach { color in
            let blurEffectView = CustomBlurEffectView(radius: 5, color: color, colorAlpha: 0.8)
            views.append(blurEffectView)
        }
        return views
    }()
    
    private lazy var blurRadiusSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.thumbTintColor = .black
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.minimumValue = 0.0
        slider.maximumValue = 20.0
        slider.value = 10
        slider.addTarget(self, action: #selector(blurRadiusSliderChange), for: .valueChanged)
        return slider
    }()
    
    @objc
    private func blurRadiusSliderChange() {
        let newValue = CGFloat(blurRadiusSlider.value)
        blurEffectViews.forEach({$0.blurRadius = newValue})
    }
    
    private lazy var colorTintOpacitySlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.thumbTintColor = .black
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.value = 0.8
        slider.addTarget(self, action: #selector(colorTintOpacitySliderChange), for: .valueChanged)
        return slider
    }()
    
    @objc
    private func colorTintOpacitySliderChange() {
        let newValue = CGFloat(colorTintOpacitySlider.value)
        blurEffectViews.forEach({$0.colorTintAlpha = newValue})
    }
    
    private func setupViews() {
        view.addSubview(backgroundImage)
        toEdges(view: backgroundImage)
        view.addSubview(stackView)
        toEdges(view: stackView)
        
        view.addSubview(blurRadiusSlider)
        NSLayoutConstraint.activate([
            blurRadiusSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            blurRadiusSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            blurRadiusSlider.heightAnchor.constraint(equalToConstant: 50),
            blurRadiusSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
        ])
        
        view.addSubview(colorTintOpacitySlider)
        NSLayoutConstraint.activate([
            colorTintOpacitySlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            colorTintOpacitySlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            colorTintOpacitySlider.heightAnchor.constraint(equalToConstant: 50),
            colorTintOpacitySlider.bottomAnchor.constraint(equalTo: blurRadiusSlider.topAnchor, constant: -20),
        ])
    }
    
    private func toEdges(view: UIView) {
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: view.topAnchor),
            self.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    
}
