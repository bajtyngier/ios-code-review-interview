//
//  RedemptionWorker.swift
//  CodeReviewChallenge
//
//  Created by Konrad Bajtyngier on 29/06/2023.
//

enum RedemptionWorkerError: Error {
    case validationError
    case redemptionError
}

enum CodeValidationStatus {
    case valid
    case expired
    case alreadyUsed
    case wrongCountry(codeCountry: String)
}

final class RedemptionWorker {

    func redeem(code: String, user: VivinoUserInfo, validationStatus: CodeValidationStatus) async throws {
        let random = Int.random(in: 0...100)
        guard random.isMultiple(of: 4) else { throw RedemptionWorkerError.validationError }
        guard random.isMultiple(of: 2) else { throw RedemptionWorkerError.redemptionError }
    }

    func checkCodeAvailability(code: String) async throws -> CodeValidationStatus {
        return .valid
    }

}

final class UserInfoWorker {

    func getUserInfo() async throws -> VivinoUserInfo {
        VivinoUserInfo()
    }

}

class VivinoUserInfo {

}
