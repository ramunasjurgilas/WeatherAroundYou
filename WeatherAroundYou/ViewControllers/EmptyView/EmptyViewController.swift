//
//  EmptyViewController.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-04.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import UIKit

protocol EmptyViewControllerDelegate {
    func askedForAllowLocationPermission()
    func askedForRetry()
}

class EmptyViewController: NSObject {

    var delegate: EmptyViewControllerDelegate?
    
    var status: EmptyViewStatus? { didSet { update() } }

    @IBOutlet var emptyView: EmptyView!
    
    
    private func update() {
        emptyView.label.text = status?.localizedTitle
        emptyView.button.setTitle(status?.localizedButtonTitle, for: .normal)
        emptyView.imageView.image = status?.image
    }

    @IBAction func didTapActionButton(_ sender: Any) {
        guard let status = status else { return }
        switch status {
        case .error:
            delegate?.askedForRetry()
            
        case .location:
            delegate?.askedForAllowLocationPermission()
            
        case .unknownLocation:
            break
        }
    }
}
