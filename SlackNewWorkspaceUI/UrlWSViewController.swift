//
//  UrlWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class UrlWSViewController: UIViewController {
  
  lazy var leftButton: UIBarButtonItem = {
    let button = UIBarButtonItem(
      image: UIImage(systemName: "arrow.left"),
      style: .plain,
      target: self,
      action:  #selector(buttonPressed(_:))
    )
    button.tag = 1
    return button
  }()
  
  lazy var rightButton: UIBarButtonItem = {
    let button = UIBarButtonItem(
      title: "Done",
      style: .plain,
      target: self,
      action: #selector(buttonPressed(_:))
    )
    button.tag = 2
    return button
  }()
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    
  }
  
  // MARK: Layout
  
  private func setupUI() {
    let safeView = self.view.safeAreaLayoutGuide
    
    view.backgroundColor = .white
    
    // Navigation
    navigationItem.leftBarButtonItem = self.leftButton
    navigationItem.rightBarButtonItem = self.rightButton
    navigationController?.navigationBar.tintColor = .black
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.shadowImage = UIImage()
  }
  
  // MARK: Action
  
  @objc func buttonPressed(_ sender: Any) {
    if let button = sender as? UIBarButtonItem {
      switch button.tag {
      case 1: // Change the background color to blue.
        dismiss(animated: false)
      case 2: // Change the background color to red.
        self.view.window?.rootViewController?.dismiss(animated: true, completion: {
          
          let dashBoardVC = CommonUI.navigationViewController(scene: CreateNewWSViewController())
          dashBoardVC.modalPresentationStyle = .fullScreen
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
          appDelegate.window?.rootViewController?.present(dashBoardVC, animated: true, completion: nil)
        })
      default: print("error")
      }
    }
  }
}
