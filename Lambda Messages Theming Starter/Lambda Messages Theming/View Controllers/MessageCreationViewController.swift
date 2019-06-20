//
//  MessageCreationViewController.swift
//  UIAppearanceAndAnimation
//
//  Created by Spencer Curtis on 8/21/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageCreationViewController: UIViewController, UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppearances()

        navigationBar.delegate = self
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.topAttached
    }
    
    @IBAction func clearText(_ sender: Any) {
        messageTextView.text = ""
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let message = messageTextView.text else { return }
        
        messageController?.createMessage(with: message, completion: { (_) in
            
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func discardMessage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupAppearances() {
        self.messageTextView.backgroundColor = AppearanceHelper.backgroundGray
        self.messageTextView.textColor = .white
        self.messageTextView.layer.borderColor = UIColor.white.cgColor
        self.messageTextView.layer.borderWidth = 0.5
        self.messageTextView.layer.cornerRadius = 8.0
        self.messageTextView.font = AppearanceHelper.typerighterFont(with: .body, pointSize: 28)
        self.messageTextView.keyboardAppearance = .dark
        
        self.view.backgroundColor = AppearanceHelper.backgroundGray
        
        AppearanceHelper.style(button: clearTextButton)
        AppearanceHelper.style(button: sendMessageButton)
    }
    
    var messageController: MessageController?

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var clearTextButton: UIButton!
    @IBOutlet weak var sendMessageButton: UIButton!
}
