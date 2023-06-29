//
//  RedeemView.swift
//  CodeReviewChallenge
//
//  Created by Konrad Bajtyngier on 29/06/2023.
//

import UIKit

protocol RedeemViewDelegate: AnyObject {
    func redeem(code: String)
}

protocol RedeemViewProtocol: UIView {
    var delegate: RedeemViewDelegate? { get set }
    func update(with viewModel: RedeemViewModel)
}

public class RedeemView: UIView {

    // MARK: - Properties

    var delegate: RedeemViewDelegate?

    // MARK: Subviews

    let containerView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        return view
    }()

    private var codeField: UITextField = {
        let view = UITextField()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 22
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        view.leftViewMode = .always
        return view
    }()

    private lazy var confirmButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.layer.cornerRadius = 22
        view.addTarget(self, action: #selector(redeemAction), for: .touchUpInside)
        return view
    }()

    private lazy var errorLabel: UILabel = {
        let view = UILabel()
        view.textColor = .red
        return view
    }()

    // MARK: Init

    init() {
        super.init(frame: .zero)
        configureSubviews()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration

    private func configureSubviews() {
        addSubview(containerView)
        containerView.addArrangedSubview(codeField)
        containerView.addArrangedSubview(confirmButton)
        containerView.addArrangedSubview(errorLabel)
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            codeField.heightAnchor.constraint(equalToConstant: 44)
        ])
        NSLayoutConstraint.activate([
            confirmButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    // MARK: Actions

    @objc private func redeemAction() {
        delegate?.redeem(code: "ABC123")
    }

}

extension RedeemView: RedeemViewProtocol {

    func update(with viewModel: RedeemViewModel) {
        codeField.placeholder = viewModel.codeFieldPlaceholderText
        confirmButton.setTitle(viewModel.confirmButtonTitle, for: .normal)
        errorLabel.text = viewModel.errorMessage
    }

}
