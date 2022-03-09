# CDV Validator
Bank account validation

CDV (Check Digit Verification) is a tool made in Swift 5 helping you to validate your bank accounts.

Tested with Hungarian Bank accounts, where bank account number contains either 16 or 24 digits.

# How it works?

Sample Bank account: 11705008-20464565-00000000

Multiplier: 9, 7, 3, 1

In order to validate the bank account, you need to multiple the digits with the numbers above like:

1 x 9 = 9

1 x 7 = 7

7 x 3 = 21

0 x 1 = 0

5 x 9 = 45

0 x 7 = 0

0 x 3 = 0

8 x 1 = 8

Then add the numbers:
9 + 7 + 21 + 0 + 45 + 0 + 0 + 8 = 90

Result must be divisible by 10 without remainder.
