//
//  Persec_TestTests.swift
//  Persec_TestTests
//
//  Created by Surawit Supornrutai on 24/2/2569 BE.
//

import XCTest
@testable import Persec_Test

final class Persec_TestTests: XCTestCase {
    
    var contentView: ContentView!

    override func setUpWithError() throws {
        contentView = ContentView()
    }

    override func tearDownWithError() throws {
        contentView = nil
    }

    // MARK: - isValidBrackets Tests
    func testIsValidBracketsWithValidInput() throws {
        XCTAssertTrue(contentView.isValidBrackets("()"))
        XCTAssertTrue(contentView.isValidBrackets("[]"))
        XCTAssertTrue(contentView.isValidBrackets("{}"))
        XCTAssertTrue(contentView.isValidBrackets("()[]{}"))
        XCTAssertTrue(contentView.isValidBrackets("([{}])"))
    }

    func testIsValidBracketsWithInvalidInput() throws {
        XCTAssertFalse(contentView.isValidBrackets("([]]"))
        XCTAssertFalse(contentView.isValidBrackets("([]})"))
        XCTAssertFalse(contentView.isValidBrackets(")"))
        XCTAssertFalse(contentView.isValidBrackets("("))
        XCTAssertFalse(contentView.isValidBrackets("{[}"))
    }

    func testIsValidBracketsWithEmptyString() throws {
        XCTAssertTrue(contentView.isValidBrackets(""))
    }

    // MARK: - naturalSort Tests
    func testNaturalSortBasic() throws {
        let input = ["TH19", "SG20", "TH2"]
        let result = contentView.naturalSort(input)
        XCTAssertEqual(result, ["SG20", "TH2", "TH19"])
    }

    func testNaturalSortWithMixedContent() throws {
        let input = ["TH10", "TH3Netflix", "TH1", "TH7"]
        let result = contentView.naturalSort(input)
        XCTAssertEqual(result, ["TH1", "TH3Netflix", "TH7", "TH10"])
    }

    func testNaturalSortEmptyArray() throws {
        let input: [String] = []
        let result = contentView.naturalSort(input)
        XCTAssertEqual(result, [])
    }

    func testNaturalSortSingleElement() throws {
        let input = ["TH10"]
        let result = contentView.naturalSort(input)
        XCTAssertEqual(result, ["TH10"])
    }

    // MARK: - autocomplete Tests
    func testAutocompleteBasic() throws {
        let items = ["Mother", "Think", "Worthy", "Apple", "Android"]
        let result = contentView.autocomplete(search: "th", items: items, maxResult: 2)
        XCTAssertEqual(result, ["Think", "Mother"])
    }

    func testAutocompleteStartOfWord() throws {
        let items = ["Apple", "Android", "Application"]
        let result = contentView.autocomplete(search: "app", items: items, maxResult: 3)
        XCTAssertEqual(result, ["Apple", "Application"])
    }

    func testAutocompleteNoMatches() throws {
        let items = ["Mother", "Think", "Worthy"]
        let result = contentView.autocomplete(search: "xyz", items: items, maxResult: 5)
        XCTAssertEqual(result, [])
    }

    func testAutocompleteEmptyItems() throws {
        let items: [String] = []
        let result = contentView.autocomplete(search: "test", items: items, maxResult: 5)
        XCTAssertEqual(result, [])
    }

    func testAutocompleteMaxResult() throws {
        let items = ["Think", "Thought", "Thunder", "That", "This"]
        let result = contentView.autocomplete(search: "th", items: items, maxResult: 2)
        XCTAssertEqual(result.count, 2)
        XCTAssert(result.count <= 2)
    }

    // MARK: - intToRoman Tests
    func testIntToRomanBasic() throws {
        XCTAssertEqual(contentView.intToRoman(1989), "MCMLXXXIX")
        XCTAssertEqual(contentView.intToRoman(68), "LXVIII")
        XCTAssertEqual(contentView.intToRoman(3749), "MMMDCCXLIX")
    }

    func testIntToRomanSingleDigits() throws {
        XCTAssertEqual(contentView.intToRoman(1), "I")
        XCTAssertEqual(contentView.intToRoman(2), "II")
        XCTAssertEqual(contentView.intToRoman(3), "III")
        XCTAssertEqual(contentView.intToRoman(4), "IV")
        XCTAssertEqual(contentView.intToRoman(5), "V")
        XCTAssertEqual(contentView.intToRoman(9), "IX")
    }

    func testIntToRomanLargeNumbers() throws {
        XCTAssertEqual(contentView.intToRoman(1000), "M")
        XCTAssertEqual(contentView.intToRoman(3000), "MMM")
    }

    // MARK: - romanToInt Tests
    func testRomanToIntBasic() throws {
        XCTAssertEqual(contentView.romanToInt("MCMLXXXIX"), 1989)
        XCTAssertEqual(contentView.romanToInt("CIX"), 109)
        XCTAssertEqual(contentView.romanToInt("MMMDCCXLIX"), 3749)
    }

    func testRomanToIntSingleCharacters() throws {
        XCTAssertEqual(contentView.romanToInt("I"), 1)
        XCTAssertEqual(contentView.romanToInt("V"), 5)
        XCTAssertEqual(contentView.romanToInt("X"), 10)
        XCTAssertEqual(contentView.romanToInt("L"), 50)
        XCTAssertEqual(contentView.romanToInt("C"), 100)
        XCTAssertEqual(contentView.romanToInt("D"), 500)
        XCTAssertEqual(contentView.romanToInt("M"), 1000)
    }

    func testRomanToIntSubtractiveNotation() throws {
        XCTAssertEqual(contentView.romanToInt("IV"), 4)
        XCTAssertEqual(contentView.romanToInt("IX"), 9)
        XCTAssertEqual(contentView.romanToInt("XL"), 40)
        XCTAssertEqual(contentView.romanToInt("XC"), 90)
        XCTAssertEqual(contentView.romanToInt("CD"), 400)
        XCTAssertEqual(contentView.romanToInt("CM"), 900)
    }

    // MARK: - descendingSort Tests
    func testDescendingSortBasic() throws {
        XCTAssertEqual(contentView.descendingSort(3008), 8300)
        XCTAssertEqual(contentView.descendingSort(1989), 9981)
    }

    func testDescendingSortSingleDigit() throws {
        XCTAssertEqual(contentView.descendingSort(5), 5)
        XCTAssertEqual(contentView.descendingSort(0), 0)
    }

    func testDescendingSortAllSameDigits() throws {
        XCTAssertEqual(contentView.descendingSort(1111), 1111)
        XCTAssertEqual(contentView.descendingSort(5555), 5555)
    }

    func testDescendingSortWithZeros() throws {
        XCTAssertEqual(contentView.descendingSort(1000), 1000)
        XCTAssertEqual(contentView.descendingSort(1020), 2100)
    }

    // MARK: - tribonacci Tests
    func testTribonacciBasic() throws {
        let result1 = contentView.tribonacci([1, 3, 5], 5)
        XCTAssertEqual(result1, [1, 3, 5, 9, 17])

        let result2 = contentView.tribonacci([2, 2, 2], 3)
        XCTAssertEqual(result2, [2, 2, 2])

        let result3 = contentView.tribonacci([10, 10, 10], 4)
        XCTAssertEqual(result3, [10, 10, 10, 30])

        let result4 = contentView.tribonacci([1, 1, 1], 1)
        XCTAssertEqual(result4, [1])
    }

    func testTribonacciZeroLength() throws {
        let result = contentView.tribonacci([1, 2, 3], 0)
        XCTAssertEqual(result, [])
    }

    func testTribonacciLargeN() throws {
        let result = contentView.tribonacci([1, 1, 1], 10)
        XCTAssertEqual(result.count, 10)
        XCTAssertEqual(result, [1, 1, 1, 3, 5, 9, 17, 31, 57, 105])
    }

    func testTribonacciWithZeros() throws {
        let result = contentView.tribonacci([0, 0, 0], 5)
        XCTAssertEqual(result, [0, 0, 0, 0, 0])
    }

}
