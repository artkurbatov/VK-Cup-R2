//
//  ViewController.swift
//  VK Cup R2
//
//  Created by Kurbatov Artem on 05.01.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let elementsTableView = UITableView()
    private let elements = ["Опрос", "2", "3", "4", "Оценка"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        elementsTableView.delegate = self
        elementsTableView.dataSource = self
        
        view.backgroundColor = .systemBackground
        
        navigationItem.backButtonTitle = ""
        
        configureTableView()
    }
        
    private func configureTableView() {
        
        view.addSubview(elementsTableView)
        
        elementsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: Helpers.homeVCIdentifier)
        
        elementsTableView.separatorStyle = .none
        elementsTableView.isScrollEnabled = false
        
        elementsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            elementsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            elementsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            elementsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            elementsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = elementsTableView.dequeueReusableCell(withIdentifier: Helpers.homeVCIdentifier, for: indexPath) as! CustomTableViewCell
        cell.configureCell(text: elements[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let destinationVC: Any?
        
        switch indexPath.row {
        case 0:
            destinationVC = SurveyVC()
//        case 1:
//        case 2:
//        case 3:
        case 4:
            destinationVC = RatingVC()
        default:
            destinationVC = SurveyVC()
        }
        
        navigationController?.pushViewController(destinationVC as! UIViewController, animated: true)
    }
}

