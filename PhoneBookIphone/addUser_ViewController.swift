//
//  addUser_ViewController.swift
//  PhoneBookIphone
//
//  Created by Ong_Lao_Ngao on 5/26/20.
//  Copyright © 2020 Ong_Lao_Ngao. All rights reserved.
//

import UIKit

class addUser_ViewController: UIViewController {
    
    var imageUser = UIImageView()
    var editImageUser = UIButton()
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
    
    
}
