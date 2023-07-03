//
//  ViewController.swift
//  ExRefactor_10_6
//
//  Created by 김종권 on 2023/07/03.
//

import UIKit

enum FetchItemType: CaseIterable {
    static var allCases: [FetchItemType] = [.item(""), .fail]
    
    case item(String)
    case fail
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = fetchItem()
        print(item)
    }
    
    private func fetchItem() -> FetchItemType {
        FetchItemType.allCases.randomElement()!
    }
}

enum MyErrorType: Error {
    case myError
}

func A() {
    do {
        try B()
    } catch {
        print(error)
    }
}

func B() throws {
    try C()
}

func C() throws {
    if Bool.random() {
        print("success")
    } else {
        throw MyErrorType.myError
    }
}
