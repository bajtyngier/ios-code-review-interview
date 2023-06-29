//
//  RedeemInteractor.swift
//  CodeReviewChallenge
//
//  Created by Konrad Bajtyngier on 29/06/2023.
//

protocol RedeemInteractorProtocol {
    func initialize()
    func redeem(code: String)
}

final class RedeemInteractor {

    // MARK: - Properties

    private var presenter: RedeemPresenterProtocol
    private let redemptionWorker = RedemptionWorker()
    private let userWorker = UserInfoWorker()

    // MARK: - Init

    init(presenter: RedeemPresenterProtocol) {
        self.presenter = presenter
    }

}

extension RedeemInteractor: RedeemInteractorProtocol {

    func initialize() {
        presenter.showInitialForm()
    }

    func redeem(code: String) {
        Task {
            do {
                let userInfo = try? await userWorker.getUserInfo()
                let validationStatus = try? await redemptionWorker.checkCodeAvailability(code: code)
                if let userInfo, let validationStatus {
                    try await redemptionWorker.redeem(code: code, user: userInfo, validationStatus: validationStatus)
                    presenter.showRedemptionResult(success: true)
                } else {
                    presenter.showRedemptionResult(success: false)
                }
            } catch {
                presenter.showRedemptionResult(success: false)
            }
        }
    }

}
