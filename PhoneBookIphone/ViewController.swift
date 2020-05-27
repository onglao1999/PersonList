//
//  ViewController.swift
//  PhoneBookIphone
//
//  Created by Ong_Lao_Ngao on 5/26/20.
//  Copyright © 2020 Ong_Lao_Ngao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var viewMenu =  UIView()
    var viewLable = UIView()
    var scrollView = UIScrollView()
    var tableView = UITableView()
    var viewScrollView = UIView()
    var viewUser = UIView()
    var viewSearch = UIView()
    var searchTextFiled = UITextField()
    var buttonViewUser = UIButton()
    var nameViewUser = UILabel()
    var phoneViewUser = UILabel()
    var data = fakedatas()
    var mangTitle: [String] = []
    var mang1: [Character] = []
    var a: [Int] = []

    var sections = fakedatas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutAll()
        view.backgroundColor = .white
        self.title = "Liên Hệ"
        layoutScrollView()
        layoutTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "customTableViewCell", bundle: nil), forCellReuseIdentifier: "customTableViewCell")
        tableView.rowHeight = CGFloat(50)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addItem(){
        let mainStorybost = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = mainStorybost.instantiateViewController(withIdentifier: "addUser_ViewController") as! addUser_ViewController
        
        vc.passData = {
            [weak self] data in
            guard let strongSelf = self else {return}
            for i in 0..<self!.sections.count {
                for j in data.name {
                    if (self!.sections[i].titleName) == String(j) {
                        strongSelf.sections[i].contacts.append(data)
                        strongSelf.tableView.reloadData()
                    }
                    break
                }
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func layoutAll(){
        
        //layout viewMenu
        view.addSubview(viewMenu)
        viewMenu.translatesAutoresizingMaskIntoConstraints = false
        viewMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        viewMenu.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        viewMenu.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive  = true
        viewMenu.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        viewMenu.backgroundColor = .blue
        
        //layout viewSearch
        view.addSubview(viewSearch)
        viewSearch.translatesAutoresizingMaskIntoConstraints = false
        viewSearch.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        viewSearch.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        viewSearch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive  = true
        viewSearch.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.16).isActive = true
        
        
        // layout searchTextField
        viewSearch.addSubview(searchTextFiled)
        searchTextFiled.backgroundColor = .systemGray2
        searchTextFiled.translatesAutoresizingMaskIntoConstraints = false
        searchTextFiled.bottomAnchor.constraint(equalTo: viewSearch.bottomAnchor, constant: -5).isActive = true
        searchTextFiled.centerXAnchor.constraint(equalTo: viewSearch.centerXAnchor).isActive = true
        searchTextFiled.widthAnchor.constraint(equalTo: viewSearch.widthAnchor, multiplier: 0.9).isActive = true
        searchTextFiled.heightAnchor.constraint(equalTo: viewSearch.heightAnchor, multiplier: 0.3).isActive = true
        searchTextFiled.layer.cornerRadius = CGFloat(10)
        searchTextFiled.placeholder = "  Tìm Kiếm"
        
        //layout viewLable
        view.addSubview(viewLable)
        viewLable.translatesAutoresizingMaskIntoConstraints = false
        viewLable.bottomAnchor.constraint(equalTo: viewMenu.topAnchor, constant: 0).isActive = true
        viewLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        viewLable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive  = true
        viewLable.topAnchor.constraint(equalTo: viewSearch.bottomAnchor, constant: 0).isActive = true
        
        //layout scrollView
        viewLable.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: viewLable.topAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: viewLable.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: viewLable.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: viewLable.bottomAnchor, constant: 0).isActive = true
        
    }
    
    //layout thành phần con trong viewScroll
    func layoutScrollView(){
        // layout viewScrollView
        scrollView.addSubview(viewScrollView)
        viewScrollView.backgroundColor = .white
        viewScrollView.translatesAutoresizingMaskIntoConstraints = false
        viewScrollView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        viewScrollView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        viewScrollView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0).isActive = true
        viewScrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        viewScrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        viewScrollView.heightAnchor.constraint(equalToConstant: 3000).isActive = true
        
        // layout viewUser (view của chủ thiết bị)
        viewScrollView.addSubview(viewUser)
        viewUser.translatesAutoresizingMaskIntoConstraints = false
        viewUser.topAnchor.constraint(equalTo: viewScrollView.topAnchor, constant: 10).isActive = true
        viewUser.leftAnchor.constraint(equalTo: viewScrollView.leftAnchor, constant: 0).isActive = true
        viewUser.rightAnchor.constraint(equalTo: viewScrollView.rightAnchor, constant: 0).isActive = true
        viewUser.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.12).isActive = true
        
        //layout các thành phần trong viewUser (buttonViewUser, nameViewUser, phoneViewUser)
        
        // layout buttonViewUser
        viewUser.addSubview(buttonViewUser)
        buttonViewUser.translatesAutoresizingMaskIntoConstraints = false
        buttonViewUser.heightAnchor.constraint(equalTo: viewUser.heightAnchor, multiplier: 0.9).isActive = true
        buttonViewUser.leftAnchor.constraint(equalTo: viewUser.leftAnchor, constant: 5).isActive = true
        buttonViewUser.centerYAnchor.constraint(equalTo: viewUser.centerYAnchor).isActive = true
        buttonViewUser.widthAnchor.constraint(equalTo: buttonViewUser.heightAnchor, multiplier: 1).isActive = true
        buttonViewUser.setImage(sections[0].contacts[0].image, for: .normal)
        
        //layout nameViewUser
        viewUser.addSubview(nameViewUser)
        nameViewUser.translatesAutoresizingMaskIntoConstraints = false
        nameViewUser.bottomAnchor.constraint(equalTo: viewUser.centerYAnchor, constant: -5).isActive = true
        nameViewUser.leftAnchor.constraint(equalTo: buttonViewUser.rightAnchor, constant: 5).isActive = true
        nameViewUser.rightAnchor.constraint(equalTo: viewUser.rightAnchor, constant: 5).isActive = true
        nameViewUser.heightAnchor.constraint(equalTo: viewUser.heightAnchor, multiplier: 0.2).isActive = true
        nameViewUser.text = sections[0].contacts[0].name
        
        //layout phoneViewUser
        viewUser.addSubview(phoneViewUser)
        phoneViewUser.translatesAutoresizingMaskIntoConstraints = false
        phoneViewUser.topAnchor.constraint(equalTo: nameViewUser.bottomAnchor, constant: 5).isActive = true
        phoneViewUser.leftAnchor.constraint(equalTo: nameViewUser.leftAnchor, constant: 0).isActive = true
        phoneViewUser.rightAnchor.constraint(equalTo: nameViewUser.rightAnchor, constant: 0).isActive = true
        phoneViewUser.heightAnchor.constraint(equalTo: nameViewUser.heightAnchor, multiplier: 1).isActive = true
        phoneViewUser.text = sections[0].contacts[0].phone
    }
    
    //layout tableView
    
    
    
    func layoutTableView(){
        var count = 0
        for i in 0..<data.count {
            count += data[i].contacts.count
        }
        print(count)
        scrollView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: viewUser.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: viewLable.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: viewLable.rightAnchor, constant: 0).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: CGFloat((count) * 50 )).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! customTableViewCell
        cell.name.text = sections[indexPath.section].contacts[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].titleName
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStorybost = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = mainStorybost.instantiateViewController(withIdentifier: "editUser_ViewController") as! editUser_ViewController
        navigationController?.pushViewController(vc, animated: true)
        let a = indexPath.section
        vc.fakeImage = sections[a].contacts[indexPath.row].image
        vc.fakeName = sections[a].contacts[indexPath.row].name
        vc.fakePhone = sections[a].contacts[indexPath.row].phone
        vc.passData = {
            [weak self] data in
            
            guard let strongSelf = self else {return}
            strongSelf.sections[a].contacts[indexPath.row] = data
            strongSelf.tableView.reloadData()
            
        }
        
        vc.passData1 = {
            [weak self] data in
            
            guard let strongSelf = self else {return}
            strongSelf.sections[a].contacts.remove(at: indexPath.row)
            strongSelf.tableView.reloadData()
            
        }
    }
    
}


