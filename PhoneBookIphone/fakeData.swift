//
//  fakeData.swift
//  PhoneBookIphone
//
//  Created by Ong_Lao_Ngao on 5/26/20.
//  Copyright © 2020 Ong_Lao_Ngao. All rights reserved.
//

import Foundation
import UIKit
struct Section {
    var titleName: String
    var contacts: [data]
}
 struct data {
    var image: UIImage
    var name: String
    var phone: String
}
func fakedatas() -> [Section] {
    let demo1 = data(image: UIImage(named: "1")!, name: "A", phone: "012345567")
    let demo2 = data(image: UIImage(named: "2")!, name: "Ă", phone: "012345567")
    let demo3 = data(image: UIImage(named: "3")!, name: "Â", phone: "012345567")
    let demo4 = data(image: UIImage(named: "4")!, name: "B", phone: "012345567")
    let demo5 = data(image: UIImage(named: "5")!, name: "C", phone: "012345567")
    let demo6 = data(image: UIImage(named: "6")!, name: "D", phone: "012345567")
    let demo7 = data(image: UIImage(named: "7")!, name: "Đ", phone: "012345567")
    let demo8 = data(image: UIImage(named: "8")!, name: "E", phone: "012345567")
    let demo9 = data(image: UIImage(named: "9")!, name: "Ê", phone: "012345567")
    let demo10 = data(image: UIImage(named: "10")!, name: "G", phone: "012345567")
    let demo11 = data(image: UIImage(named: "11")!, name: "H", phone: "012345567")
    let demo12 = data(image: UIImage(named: "12")!, name: "I", phone: "012345567")
     let demo13 = data(image: UIImage(named: "12")!, name: "K", phone: "012345567")
     let demo14 = data(image: UIImage(named: "12")!, name: "L", phone: "012345567")
     let demo15 = data(image: UIImage(named: "12")!, name: "M", phone: "012345567")
     let demo16 = data(image: UIImage(named: "12")!, name: "N", phone: "012345567")
     let demo17 = data(image: UIImage(named: "12")!, name: "O", phone: "012345567")
     let demo18 = data(image: UIImage(named: "12")!, name: "Ô", phone: "012345567")
     let demo19 = data(image: UIImage(named: "12")!, name: "Ơ", phone: "012345567")
     let demo20 = data(image: UIImage(named: "12")!, name: "P", phone: "012345567")
     let demo21 = data(image: UIImage(named: "12")!, name: "Q", phone: "012345567")
     let demo22 = data(image: UIImage(named: "12")!, name: "R", phone: "012345567")
     let demo23 = data(image: UIImage(named: "12")!, name: "S", phone: "012345567")
     let demo24 = data(image: UIImage(named: "12")!, name: "T", phone: "012345567")
     let demo25 = data(image: UIImage(named: "12")!, name: "U", phone: "012345567")
     let demo26 = data(image: UIImage(named: "12")!, name: "Ư", phone: "012345567")
     let demo27 = data(image: UIImage(named: "12")!, name: "V", phone: "012345567")
     let demo28 = data(image: UIImage(named: "12")!, name: "X", phone: "012345567")
     let demo29 = data(image: UIImage(named: "12")!, name: "Y", phone: "012345567")
    
    
    let section_a = Section(titleName: "A", contacts: [demo1])
    let section_a1 = Section(titleName: "Ă", contacts: [demo2])
    let section_a2 = Section(titleName: "Â", contacts: [demo3])
    let section_b = Section(titleName: "B", contacts: [demo4])
    let section_c = Section(titleName: "C", contacts: [demo5])
    let section_d = Section(titleName: "D", contacts: [demo6])
    let section_d1 = Section(titleName: "Đ", contacts: [demo7])
    let section_e = Section(titleName: "E", contacts: [demo8])
    let section_e1 = Section(titleName: "Ê", contacts: [demo9])
    let section_g = Section(titleName: "G", contacts: [demo10])
    let section_h = Section(titleName: "H", contacts: [demo11])
    let section_i = Section(titleName: "I", contacts: [demo12])
    let section_k = Section(titleName: "K", contacts: [demo13])
    let section_l = Section(titleName: "L", contacts: [demo14])
    let section_m = Section(titleName: "M", contacts: [demo15])
    let section_n = Section(titleName: "N", contacts: [demo16])
    let section_o = Section(titleName: "O", contacts: [demo17])
    let section_o1 = Section(titleName: "Ô", contacts: [demo18])
    let section_o2 = Section(titleName: "Ơ", contacts: [demo19])
    let section_p = Section(titleName: "P", contacts: [demo20])
    let section_q = Section(titleName: "Q", contacts: [demo21])
    let section_r = Section(titleName: "R", contacts: [demo22])
    let section_s = Section(titleName: "S", contacts: [demo23])
    let section_t = Section(titleName: "T", contacts: [demo24])
    let section_u = Section(titleName: "U", contacts: [demo25])
    let section_u1 = Section(titleName: "Ư", contacts: [demo26])
    let section_v = Section(titleName: "V", contacts: [demo27])
    let section_x = Section(titleName: "X", contacts: [demo28])
    let section_y = Section(titleName: "Y", contacts: [demo29])
    return [section_a, section_a1, section_a2, section_b, section_c, section_d, section_d1, section_e, section_e1, section_g, section_h, section_i, section_k, section_l, section_m, section_n, section_o, section_o1, section_o2, section_p, section_q, section_r, section_s, section_t, section_u, section_u1, section_v, section_x, section_y]
}

