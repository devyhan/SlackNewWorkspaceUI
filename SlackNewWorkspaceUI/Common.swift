//
//  Common.swift
//  SlackNewWorkspaceUI
//
//  Created by 요한 on 2020/06/19.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

struct CommonUI {
  static let didChangeVCButtonText = "Create New Workspace"
  static let writeWorkspacePlaceholder = "Name your workspace"
  
  static let margin: CGFloat = 10
  static let titleFontSize: CGFloat = 37
  static let contantsFontSize: CGFloat = 20
  
  // Navigation
  static func navigationViewController(scene: UIViewController) -> UIViewController {
    switch scene {
    case is UrlWSViewController:
      let urlWSViewController = UrlWSViewController()
      let urlWSVC = UINavigationController(rootViewController: urlWSViewController)
      return urlWSVC
    case is NameWSViewController:
      let nameWSViewController = NameWSViewController()
      let nameWSVC = UINavigationController(rootViewController: nameWSViewController)
      return nameWSVC
    default:
      let createNewWSViewController = CreateNewWSViewController()
      let createNewWSVC = UINavigationController(rootViewController: createNewWSViewController)
      return createNewWSVC
    }
    
  }
  // UILabel
  static func contantsLabel(for uiLable: UILabel, title: String?, fontColor: UIColor,  textAlignment: NSTextAlignment?, where uiView: UIView) {
    uiLable.text = title ?? ""
    uiLable.textAlignment = textAlignment ?? .center
    uiLable.font = UIFont.boldSystemFont(ofSize: contantsFontSize - 5)
    
    uiView.addSubview(uiLable)
  }
  // UIButton
  static func defaultButton(for uiButton: UIButton, title: String, titleColor: UIColor, where uiView: UIView) {
    uiButton.setTitle(title, for: .normal)
    uiButton.layer.cornerRadius = 4
    uiButton.setTitleColor(titleColor, for: .normal)
    
    uiView.addSubview(uiButton)
  }
  // UITextField
  static func defaultTextField(for uiTextField: UITextField, placeholder: String, textAlignment: NSTextAlignment, keyboardType: UIKeyboardType, where uiView: UIView) {
    uiTextField.placeholder = placeholder
    uiTextField.textAlignment = textAlignment
    uiTextField.keyboardType = keyboardType
    uiTextField.font = UIFont.boldSystemFont(ofSize: contantsFontSize)
    uiTextField.textColor = .black
    
    uiView.addSubview(uiTextField)
  }
  // Animation
  static func showUpAnimation(for uiLabel: UILabel, showUPAnimationEnable: Bool) {
    if showUPAnimationEnable == true {
      UIView.animate(
        withDuration: 0.3,
        animations: (
          {
            uiLabel.transform = CGAffineTransform(translationX: 0, y: -20)
            uiLabel.alpha = 1
          }
        )
      )
    } else {
      UIView.animate(
        withDuration: 0.3,
        animations: (
          {
            uiLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            uiLabel.alpha = 0
          }
        )
      )
    }
  }
  
}


