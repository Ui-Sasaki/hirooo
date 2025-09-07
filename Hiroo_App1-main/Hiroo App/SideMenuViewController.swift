//
//  MenuViewController.swift
//  Hiroo App
//
//  Created by 井上　希稟 on 2025/09/03.
//

import UIKit

final class SideMenuViewController: UITableViewController {
    private let items = ["学校選択に戻る", "校内マップ", "ホームページ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tv: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tv.deselectRow(at: indexPath, animated: true)
        
        let selectedItem = items[indexPath.row]
        
        // get the presenting navigation controller
        guard let presentingNav = presentingViewController as? UINavigationController else {
            dismiss(animated: true, completion: nil)
            return
        }
        
        switch selectedItem {
        case "学校選択に戻る":
            dismiss(animated: true) {
                let vc = SelectSchoolViewController()
                presentingNav.pushViewController(vc, animated: true)
            }
            
        case "校内マップ":
            dismiss(animated: true) {
                let vc = SchoolsViewController()
                presentingNav.pushViewController(vc, animated: true)
            }
            
        case "ホームページ":
            dismiss(animated: true) {
                if let url = URL(string: "https://www.hiroogakuen.jp") {
                    UIApplication.shared.open(url)
                }
            }
            
        default:
            break
        }
    }
}
