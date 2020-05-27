//
//  editUser_ViewController.swift
//  PhoneBookIphone
//
//  Created by Ong_Lao_Ngao on 5/26/20.
//  Copyright © 2020 Ong_Lao_Ngao. All rights reserved.
//

import UIKit

class editUser_ViewController: UIViewController {
    var imageUser = UIImageView()
    var editImageUser = UIButton()
    var name = UITextField()
    var phone = UITextField()
    var stackView = UIStackView()
    var fakeImage = UIImage()
    var fakeName = String()
    var fakePhone = String()
    var passData: ((data) -> Void)?
    var passData1: ((data) -> Void)?
    var deleteUser: UIButton = {
        let button = UIButton()
        button.addTarget(nil, action: #selector(deleteUserTouch), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        self.title = "Liên hệ mới"
        imageUser.image = fakeImage
        name.text = fakeName
        phone.text = fakePhone
        layout()
        let save = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveAction))
        navigationItem.rightBarButtonItem = save
    }
    
    @objc func deleteUserTouch(){
        guard let imageUser1 = imageUser.image, let name1 = name.text, let phone1 = phone.text else {
            return
        }
        passData1?(data(image: imageUser1, name: name1, phone: phone1))
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func saveAction(){
        
        guard let imageUser1 = imageUser.image, let name1 = name.text, let phone1 = phone.text else {
            return
        }
        passData?(data(image: imageUser1, name: name1, phone: phone1))
        self.navigationController?.popViewController(animated: true)
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
        
        // layout deleteUser
        view.addSubview(deleteUser)
        deleteUser.translatesAutoresizingMaskIntoConstraints = false
        deleteUser.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        deleteUser.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deleteUser.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        deleteUser.heightAnchor.constraint(equalTo: deleteUser.widthAnchor, multiplier: 0.3).isActive = true
        deleteUser.setTitle("Delete", for: .normal)
        deleteUser.backgroundColor = .white
        deleteUser.setTitleColor(.black, for: .normal)
        deleteUser.layer.cornerRadius = 10
    }
}
