//
//  RedeemBuilder.swift
//  CodeReviewChallenge
//
//  Created by Konrad Bajtyngier on 29/06/2023.
//

import UIKit

public final class RedeemBuilder {

    public init() {}

    public func viewController() -> UIViewController {
        let presenter = RedeemPresenter()
        let interactor = RedeemInteractor(presenter: presenter)
        let viewController = RedeemViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
