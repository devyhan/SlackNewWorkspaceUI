//
//  ViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import AudioToolbox.AudioServices
import UIKit

final class CreateNewWSViewController: UIViewController {
  
  private let nameWSViewController = CommonUI.navigationViewController(scene: 2)
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    
  }
  
  // MARK: UI
  
  private func setupUI() {
    let safeView = self.view.safeAreaLayoutGuide
    
    view.backgroundColor = .white
    
    // Navigation
    navigationController?.navigationBar.isHidden = true
    
    // UIButton
    let didChangeVCButton = UIButton()
    didChangeVCButton.addTarget(self, action: #selector(didTabButton(_:)), for: .touchUpInside)
    // Attribute
    CommonUI.defaultButton(
      for: didChangeVCButton,
      title: CommonUI.didChangeVCButtonText,
      titleColor: .systemBlue,
      where: view
    )
    // Layout
    didChangeVCButton.translatesAutoresizingMaskIntoConstraints.toggle()
    NSLayoutConstraint.activate([
      didChangeVCButton.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: CommonUI.margin),
      didChangeVCButton.trailingAnchor.constraint(equalTo: safeView.trailingAnchor, constant: -CommonUI.margin),
      didChangeVCButton.centerYAnchor.constraint(equalTo: safeView.centerYAnchor)
    ])
  }
  
  // MARK: Action
  
  @objc private func didTabButton(_ sender: UIButton) {
    AudioServicesPlayAlertSoundWithCompletion(kSystemSoundID_Vibrate) {
      print("진동발생")
    }
    
    nameWSViewController.modalPresentationStyle = .fullScreen
    present(nameWSViewController, animated: true)
  }
}
