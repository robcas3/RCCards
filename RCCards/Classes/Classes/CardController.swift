//
//  CardController.swift
//  CardParts2
//
//  Created by Kier, Tom on 1/18/17.
//  Copyright © 2017 Kier, Tom. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public protocol CardController : NSObjectProtocol {
    
	func viewController() -> UIViewController
}

public protocol RCCard: NSObjectProtocol {
    var view: UIView { get }
    func setupCardParts(_ cardParts:[CardPartView])
}


public protocol NoTopBottomMarginsCardTrait {
	
	func requiresNoTopBottomMargins() -> Bool
}

extension NoTopBottomMarginsCardTrait {
	
	public func requiresNoTopBottomMargins() -> Bool {
		return true
	}
}

public protocol TopAccentViewCardTrait {
    
    func topAccentHeight() -> CGFloat
    func topAccentColor() -> UIColor
}

extension TopAccentViewCardTrait {
    
    func topAccentHeight() -> CGFloat {
        return 16.0
    }
    
    func topAccentColor() -> UIColor {
        return .white
    }
}

public protocol TransparentCardTrait {
	
	func requiresTransparentCard() -> Bool
}

extension TransparentCardTrait {
	
	public func requiresTransparentCard() -> Bool {
		return true
	}
}


public protocol EditableCardTrait {
	
	func isEditable() -> Bool
	
	func onEditButtonTap()
}

extension EditableCardTrait {
	
	public func isEditable() -> Bool {
		return true
	}
}

public protocol HiddenCardTrait {
	
	var isHidden: Variable<Bool> { get }
}

public protocol ShadowCardTrait {
    func shadowColor() -> CGColor
    func shadowRadius() -> CGFloat
    func shadowOpacity() -> Float
}

extension ShadowCardTrait {
    func shadowColor() -> CGColor {
        return UIColor.Gray2.cgColor
    }

    func shadowRadius() -> CGFloat {
        return 8.0
    }
    
    func shadowOpacity() -> Float {
        return 0.7
    }
}

public protocol RoundedCardTrait {
    func cornerRadius() -> CGFloat
}

extension RoundedCardTrait {
    func cornerRadius() -> CGFloat {
        return 10.0
    }
}

@objc public protocol GradientCardTrait {
    func gradientColors() -> [UIColor]
    @objc optional func gradientAngle() -> Float
}

@objc public protocol CardPartsLongPressGestureRecognizerDelegate: class {
    @objc func didLongPress(_ gesture: UILongPressGestureRecognizer) -> Void
    var minimumPressDuration: CFTimeInterval { get }
}
extension CardPartsLongPressGestureRecognizerDelegate {
    var minimumPressDuration: CFTimeInterval { return 1.0 }
}

