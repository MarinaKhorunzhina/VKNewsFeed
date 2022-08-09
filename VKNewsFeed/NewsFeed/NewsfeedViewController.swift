//
//  NewsfeedViewController.swift
//  VKNewsFeed
//
//  Created by Marina on 21.07.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedDisplayLogic: class {
  func displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData)
}

class NewsfeedViewController: UIViewController, NewsfeedDisplayLogic {

  var interactor: NewsfeedBusinessLogic?
  var router: (NSObjectProtocol & NewsfeedRoutingLogic)?

    private var feedViewModel = FeedViewModel.init(cells: [])
    @IBOutlet weak var table: UITableView!
    
    
    // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = NewsfeedInteractor()
    let presenter             = NewsfeedPresenter()
    let router                = NewsfeedRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    
    table.register(UINib(nibName: "NewsfeedCell", bundle: nil), forCellReuseIdentifier: NewsfeedCell.reuseId)
    table.register(NewsfeedCodeCell.self, forCellReuseIdentifier: NewsfeedCodeCell.reuseId)
    table.separatorStyle = .none
    table.backgroundColor = .clear
    view.backgroundColor = .systemCyan
    
    interactor?.makeRequest(request: Newsfeed.Model.Request.RequestType.getNewsfeed)
  }
  
  func displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData) {

    switch viewModel {
    case .displayNewsfeed(let feedViewModel):
        self.feedViewModel = feedViewModel
        table.reloadData()
    }
  }
  
}
extension NewsfeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedViewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: NewsfeedCell.reuseId, for: indexPath) as! NewsfeedCell
//        let cellViewModel = feedViewModel.cells[indexPath.row]
//        cell.set(viewModel: cellViewModel)
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsfeedCodeCell.reuseId, for: indexPath) as! NewsfeedCodeCell
        cell.textLabel?.text = "index \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // let cellViewModel = feedViewModel.cells[indexPath.row]
     //   return cellViewModel.sizes.totalHeight
        return 400
    }
    
}
