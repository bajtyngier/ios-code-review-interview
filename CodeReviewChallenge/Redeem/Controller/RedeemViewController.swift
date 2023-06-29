//
//  RedeemViewController.swift
//  CodeReviewChallenge
//
//  Created by Konrad Bajtyngier on 29/06/2023.
//

import UIKit

protocol RedeemViewControllerProtocol {
    func updateView(with viewModel: RedeemViewModel)
}

final class RedeemViewController: UIViewController {

    // MARK: - Properties

    private var interactor: RedeemInteractorProtocol

    private lazy var mainView: RedeemViewProtocol = {
        let view = RedeemView()
        view.delegate = self
        return view
    }()

    // MARK: Init

    init(interactor: RedeemInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        interactor.initialize()
    }

}

extension RedeemViewController: RedeemViewControllerProtocol {

    func updateView(with viewModel: RedeemViewModel) {
        mainView.update(with: viewModel)
    }

}

extension RedeemViewController: RedeemViewDelegate {

    func redeem(code: String) {
        interactor.redeem(code: code)
    }

}
