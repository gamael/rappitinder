//
//  Spinner.swift
//  Sigob-Mobile.ios
//
//  Created by Bradley Suira on 11/5/17.
//  Copyright © 2017 Bradley Suira. All rights reserved.
//

import UIKit

open class Spinner {
    
    private lazy var overlayView = UIView()
    private lazy var indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    private var isLoading: Bool = false
    private let overlayAlpha: CGFloat = 0.4
    init() {
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.backgroundColor = UIColor.white.withAlphaComponent(overlayAlpha)
        overlayView.clipsToBounds = true
        
        //MARK: indicator
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        overlayView.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor)
            ])
        
    }
    
    public func show(view: UIView, windowSize: Bool = false, customAlpha: CGFloat? = nil) {
        isLoading = true
        
        if self.overlayView.superview != nil {
            self.overlayView.removeFromSuperview()
        }
        
        if let alpha = customAlpha {
            overlayView.backgroundColor = UIColor.white.withAlphaComponent(alpha)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if self.isLoading {
                UIView.transition(with: view, duration: 0.2, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    
                    view.addSubview(self.overlayView)
                    
                    NSLayoutConstraint.activate([
                        self.overlayView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
                        self.overlayView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0),
                        self.overlayView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                        self.overlayView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                        ])
                    self.indicator.startAnimating()
                }, completion: nil)
            }
        }
    }
    
    public func hide() {
        isLoading = false
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                self.overlayView.backgroundColor = UIColor.white.withAlphaComponent(self.overlayAlpha)
                self.indicator.stopAnimating()
                if self.overlayView.superview != nil {
                    self.overlayView.removeFromSuperview()
                }
            })
        }
    }
    
}
