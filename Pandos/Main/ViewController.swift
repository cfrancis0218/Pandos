//
//  ViewController.swift
//  Pandos
//
//  Created by Christian Elijah on 2020-08-23.
//  Copyright © 2020 Christian Elijah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var PandosImageView: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pandaImageView: UIImageView!
    @IBOutlet var choose: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton()
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheetOption = UIAlertController(title: "Pandos", message: "Choose a Pandos Source", preferredStyle: .actionSheet)
        
        actionSheetOption.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheetOption.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheetOption.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheetOption, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as? UIImage
        
        imageView.image = selectedImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func chooseButton() {
        choose.layer.borderColor = UIColor.white.cgColor
        choose.layer.borderWidth = 2
        choose.layer.cornerRadius = 25
    }

}

