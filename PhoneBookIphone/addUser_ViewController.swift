//
//  addUser_ViewController.swift
//  PhoneBookIphone
//
//  Created by Ong_Lao_Ngao on 5/26/20.
//  Copyright © 2020 Ong_Lao_Ngao. All rights reserved.
//

import UIKit
import Photos
class addUser_ViewController: UIViewController {
    
    var imageUser = UIImageView()
    var imagePicker: UIImagePickerController!
    var editImageUser: UIButton = {
        var button = UIButton()
        button.addTarget(nil, action: #selector(selectedImage), for: .touchUpInside)
        return button
    }()
    var name = UITextField()
    var phone = UITextField()
    var stackView = UIStackView()
    var passData: ((data) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        self.title = "Liên hệ mới"
        layout()
        let save = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveAction))
        navigationItem.rightBarButtonItem = save
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    @objc func saveAction(){
        guard let name1 = name.text, let phone1 = phone.text else {
            return
        }
        guard let image1 = imageUser.image else {
            passData?(data(image: UIImage(named: "1")!, name: name1, phone: phone1))
            self.navigationController?.popViewController(animated: true)
            return
        }
        passData?(data(image: image1, name: name1, phone: phone1))
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func selectedImage(){
        let alert = UIAlertController(title: "App", message: "Chọn ảnh từ", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "Máy ảnh", style: .default, handler: { (_) in
            print("Chọn ảnh từ máy ảnh")
            self.fromCamera()
        })
        let libray = UIAlertAction(title: "Thư viện", style: .default, handler: { (_) in
            print("Chọn ảnh từ thư viện")
            self.fromLibrary()
        })
        
        alert.addAction(camera)
        alert.addAction(libray)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    func confirm(message: String, viewController: UIViewController?, success: @escaping () -> Void){
        let alert = UIAlertController(title: "NoiBai App", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func setting(){
        let message = "App cần truy cập máy ảnh và thư viện của bạn. Ảnh của bạn sẽ không được chia sẻ khi chưa được phép của bạn."
        confirm(message: message, viewController: self) {
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.openURL(settingsUrl)
                } else {
                    UIApplication.shared.openURL(settingsUrl)
                }
            }
        }
    }
    // layout giao diện
    func layout(){
        
        // layout imageUser
        view.addSubview(imageUser)
        imageUser.translatesAutoresizingMaskIntoConstraints = false
        imageUser.topAnchor.constraint(equalTo: view.topAnchor, constant:100).isActive = true
        imageUser.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageUser.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        imageUser.heightAnchor.constraint(equalTo: imageUser.widthAnchor, multiplier: 1).isActive = true
        imageUser.layer.cornerRadius = CGFloat(view.frame.maxX * 0.2)
        imageUser.clipsToBounds = true
        imageUser.backgroundColor = .blue
        
        // layout editImageUser
        view.addSubview(editImageUser)
        editImageUser.translatesAutoresizingMaskIntoConstraints = false
        editImageUser.topAnchor.constraint(equalTo: imageUser.bottomAnchor, constant: 5).isActive = true
        editImageUser.widthAnchor.constraint(equalTo: imageUser.widthAnchor, multiplier: 0.5).isActive = true
        editImageUser.heightAnchor.constraint(equalTo: editImageUser.widthAnchor, multiplier: 0.3).isActive = true
        editImageUser.centerXAnchor.constraint(equalTo: imageUser.centerXAnchor).isActive = true
        editImageUser.setTitle("Thêm ảnh", for: .normal)
        editImageUser.setTitleColor(.blue, for: .normal)
        
        // layout stackView
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(phone)
        name.placeholder = "   Tên"
        phone.placeholder = "   Phone"
        name.backgroundColor = .white
        phone.backgroundColor = .white
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.topAnchor.constraint(equalTo: editImageUser.bottomAnchor, constant: 10).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    private func fromLibrary(){
        func choosePhoto(){
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.imagePicker.modalPresentationStyle = .popover
            DispatchQueue.main.async {
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        // khai báo biến để lấy quyền truy cập
        let status = PHPhotoLibrary.authorizationStatus()
        if (status == PHAuthorizationStatus.authorized) {
            // quyền truy cập đã được cấp
            choosePhoto()
        }else if (status == PHAuthorizationStatus.denied) {
            // quyền truy cập bị từ chối
            setting()
        }else if (status == PHAuthorizationStatus.notDetermined) {
            // quyền truy cập chưa được xác nhận
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                if (newStatus == PHAuthorizationStatus.authorized) {
                    choosePhoto()
                }else {
                    print("Không được cho phép truy cập vào thư viện ảnh")
                    self.setting()
                }
            })
        }else if (status == PHAuthorizationStatus.restricted) {
            // Truy cập bị hạn chế, thông thường sẽ không xảy ra
            print("Restricted access")
            setting()
        }
    }
    
    private func fromCamera(){
        func takePhoto(){
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
                self.imagePicker.cameraCaptureMode = .photo
                self.imagePicker.cameraDevice = .front
                self.imagePicker.modalPresentationStyle = .fullScreen
                DispatchQueue.main.async {
                    self.present(self.imagePicker, animated: true,completion: nil)
                }
            }else{
                print("abc")
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Thông báo", message: "Không tìm thấy máy ảnh", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        //Camera
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                takePhoto()
            } else {
                print("camera denied")
                self.setting()
            }
        }
    }
}

extension addUser_ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("error: \(info)")
            return
        }
        self.imageUser.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}


