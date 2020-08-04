//
//  ViewController.swift
//  ManchesterUnitedSquad
//
//  Created by clicklabs on 24/06/20.
//  Copyright © 2020 clicklabs. All rights reserved.
//

import UIKit
import os.log
protocol addPlayerToTable: class {
    func addingPlayerToTable(player: SquadPlayer)
}
class ViewController: UIViewController, UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    weak var newPlayerdelegate: addPlayerToTable?
    override func viewDidLoad() {
        super.viewDidLoad()
        playerNameTextField.delegate = self
//        saveButton.isEnabled = false
        // Do any additional setup after loading the view.
    }

    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPhoto(_ sender: UITapGestureRecognizer) {
        playerNameTextField.resignFirstResponder()
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        navigationItem.title = textField.text
        saveButton.isEnabled = true
//        os_log("save", <#T##args: CVarArg...##CVarArg#>)
    }
    @IBAction func savePlayer(_ sender: UIBarButtonItem) {
        let playerName = playerNameTextField.text!
        let photo = photoImage.image
        guard let player = SquadPlayer(name: playerName, photo: photo) else {
            fatalError("Failed to instantiate Player")
        }
        newPlayerdelegate?.addingPlayerToTable(player: player)
        dismiss(animated: true, completion: nil)
    }
}

