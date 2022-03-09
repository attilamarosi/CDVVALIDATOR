//  Created by Marosi Attila on 2022. 03. 09..

import Foundation

func cdvValidator(bankAccount: String?) -> Bool {
    guard let formattedBankAccount = bankAccount?.filter("0123456789".contains),
          formattedBankAccount.count == 16 || formattedBankAccount.count == 24 else {
              return false
          }

    var isValid = true
    var summa: Int = 0

    // Numbers in validator array have to be multiplied by bank account digits
    let validator = [9,7,3,1,9,7,3,1]

    // Transform String to Integer Array
    let accountNumbers: [Int] = formattedBankAccount.compactMap { Int(String($0)) }

    // Bank account could be 16 or 24 digits long
    let isThreeStripes: Bool = accountNumbers.count == 24

    // Create 8 digit stripes
    let firstStripe = accountNumbers.prefix(8)
    let secondStripe = isThreeStripes ? accountNumbers[8...15] : accountNumbers.suffix(8)
    let thirdStripe: ArraySlice? = isThreeStripes ? accountNumbers.suffix(8) : nil

    // Multiple digits with validator values
    func multiplyStripes(stripe: ArraySlice<Int>?) {
        guard let stripe = stripe else { return }

        stripe.enumerated().forEach { index, number in
            guard index <= validator.count else { return isValid = false }
            summa += number * validator[index]
            isValid = summa % 10 == 0
        }
    }

    multiplyStripes(stripe: firstStripe)
    multiplyStripes(stripe: secondStripe)
    multiplyStripes(stripe: thirdStripe)

    return isValid
}
