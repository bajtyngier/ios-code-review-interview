//
//  RedeemPresenter.swift
//  CodeReviewChallenge
//
//  Created by Konrad Bajtyngier on 29/06/2023.
//

protocol RedeemPresenterProtocol {
    func showInitialForm()
    func showRedemptionResult(success: Bool)
}

final class RedeemPresenter {

    weak var viewController: RedeemViewController?

    private func viewModel(error: Bool) -> RedeemViewModel {
        var viewModel = RedeemViewModel()
        viewModel.codeFieldPlaceholderText = "Insert code here"
        viewModel.confirmButtonTitle = "Verify & redeem"
        if error {
            viewModel.errorMessage = "An error occured"
        }
        return viewModel
    }

}

extension RedeemPresenter: RedeemPresenterProtocol {

    func showInitialForm() {
        viewController?.updateView(with: viewModel(error: false))
    }

    func showRedemptionResult(success: Bool) {
        viewController?.updateView(with: viewModel(error: !success))
    }

}
