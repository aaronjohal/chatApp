//
//  ConversationsController.swift
//  FireChat
//
//  Created by Aaron Johal on 10/03/2021.
//

import UIKit

private let reuseIdentififer = "ConversationCell"

class ConversationsController: UIViewController {
    
    //properties
    private let tableView = UITableView()
    //lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //helpers
    
    func configureUI(){
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //navigation item
        
        let image = UIImage(systemName: "person.circle.fill") //already in apple
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showProfile)) //add icon to bar
        
        configNavBar()
        configTableView()
    }
    
    
    //atrributes of nav bar
    func configNavBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white] //text white
        appearance.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) //change nav bar colour
        
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        //navigation title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark //make toolbar buttons white
       
    }
    
    func configTableView(){
        //table  attributes
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentififer) //register cells
        tableView.tableFooterView = UIView() //hides seperator lines from empty cells
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView) //add the table view to the frame
        tableView.frame = view.frame
    }
    
    
    //Selectors
    
    @objc func showProfile(){
        print("show profile")
    }
    
    
    
}


extension ConversationsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row
        )
    }
    
}

extension ConversationsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentififer, for: indexPath)
        cell.textLabel?.text = "Test Cell"
        return cell
    }
    
    
}
