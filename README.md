# Persec_Test

SwiftUI project containing useful utility functions and comprehensive unit tests for learning and practice.

## 📋 Overview

This project demonstrates 7 common algorithm functions with clean, readable code suitable for junior developers. Each function includes detailed comments explaining the logic step-by-step.

## 🎯 Functions

### 1. **isValidBrackets** ✓
Validates whether brackets in a string are properly matched and balanced.

**Input:** String containing brackets: `()`, `[]`, `{}`  
**Output:** Boolean (true if valid, false otherwise)

**Examples:**
```swift
isValidBrackets("()")       // ✅ true
isValidBrackets("([)]")     // ❌ false (wrong order)
isValidBrackets("([])")     // ✅ true
```

**Algorithm:** Uses a Stack to match opening and closing brackets

---

### 2. **naturalSort** 🔤
Sorts strings in natural order where numbers are treated as numbers, not ASCII characters.

**Input:** Array of strings  
**Output:** Sorted array

**Examples:**
```swift
naturalSort(["TH19", "SG20", "TH2"])
// ✅ ["SG20", "TH2", "TH19"]
// (TH2 comes before TH19 because 2 < 19)

naturalSort(["TH10", "TH3Netflix", "TH1", "TH7"])
// ✅ ["TH1", "TH3Netflix", "TH7", "TH10"]
```

**Algorithm:** Uses `localizedStandardCompare` for natural sorting

---

### 3. **autocomplete** 🔍
Searches for items containing a query string and ranks them by position of first match.

**Input:** `search` (query), `items` (array), `maxResult` (limit)  
**Output:** Array of matching items (sorted by match position)

**Examples:**
```swift
autocomplete(search: "th", 
             items: ["Mother", "Think", "Worthy", "Apple", "Android"],
             maxResult: 2)
// ✅ ["Think", "Mother"]
// "th" in Think at position 0
// "th" in Mother at position 2
// "Worthy" has "th" at position 2, but M < W alphabetically
```

**Algorithm:** 
1. Find all items containing query
2. Track position of first match
3. Sort by position, then alphabetically
4. Return top N results

---

### 4. **intToRoman** 🏛️
Converts integers (1-3999) to Roman numerals.

**Input:** Integer  
**Output:** Roman numeral string

**Examples:**
```swift
intToRoman(1989)    // "MCMLXXXIX"
intToRoman(68)      // "LXVIII"
intToRoman(4)       // "IV"
```

**Algorithm:** Uses lookup table from largest to smallest values

---

### 5. **romanToInt** 🔢
Converts Roman numerals back to integers.

**Input:** Roman numeral string  
**Output:** Integer value

**Examples:**
```swift
romanToInt("MCMLXXXIX")  // 1989
romanToInt("CIX")        // 109
romanToInt("IV")         // 4
```

**Algorithm:** 
- If digit value < next digit value → subtract (subtractive notation)
- Otherwise → add

---

### 6. **descendingSort** 📊
Rearranges digits of a number in descending order.

**Input:** Integer  
**Output:** Integer with digits sorted descending

**Examples:**
```swift
descendingSort(3008)  // 8300
descendingSort(1989)  // 9981
descendingSort(5)     // 5
```

**Algorithm:**
1. Convert to String
2. Sort characters descending
3. Merge back to String
4. Convert back to Int

---

### 7. **tribonacci** 📈
Generates Tribonacci sequence (similar to Fibonacci but with 3 terms instead of 2).

**Input:** `signature` (initial 3 values), `n` (length)  
**Output:** Array of n numbers

**Examples:**
```swift
tribonacci([1, 3, 5], 5)
// [1, 3, 5, 9, 17]
// 9 = 1+3+5, 17 = 3+5+9

tribonacci([2, 2, 2], 3)
// [2, 2, 2]

tribonacci([10, 10, 10], 4)
// [10, 10, 10, 30]
```

**Algorithm:** Each value = sum of previous 3 values

---

## 🧪 Unit Tests

All functions have comprehensive unit tests in `Persec_TestTests.swift`.

### Test Coverage:
- **isValidBrackets:** 5 tests (valid, invalid, empty cases)
- **naturalSort:** 4 tests (basic, mixed content, edge cases)
- **autocomplete:** 5 tests (basic, no matches, maxResult limit)
- **intToRoman:** 6 tests (single digits, subtractive notation, large numbers)
- **romanToInt:** 6 tests (basic, single chars, subtractive notation)
- **descendingSort:** 4 tests (basic, single digit, same digits, with zeros)
- **tribonacci:** 4 tests (basic, zero length, large n, with zeros)

**Total:** 34 unit tests

### Running Tests

Run tests using Xcode or command line:

```bash
# Using Xcode (UI)
Open Persec_Test.xcodeproj in Xcode
Product > Test (Cmd + U)

# Using command line
xcodebuild test -scheme Persec_Test
```

---

## 📁 Project Structure

```
Persec_Test/
├── Persec_Test/
│   ├── ContentView.swift        # Main view with 7 functions
│   ├── Persec_TestApp.swift     # App entry point
│   └── Assets.xcassets/
├── Persec_TestTests/
│   └── Persec_TestTests.swift   # 34 unit tests
├── Persec_TestUITests/
│   ├── Persec_TestUITests.swift
│   └── Persec_TestUITestsLaunchTests.swift
└── README.md
```

---

## 🛠 Requirements

- **Xcode:** 14.0 or later
- **iOS:** 16.0+
- **Swift:** 5.7+

---

## 📝 Code Style

Each function follows a consistent pattern for **junior developer readability**:

✅ **Do:**
- Use descriptive variable names (`matchedItems`, `romanValues`)
- Break complex operations into multiple steps
- Add comments explaining each step
- Use clear for-loops instead of complex functional chains

❌ **Don't:**
- Chain multiple operations (`.map().filter().reduce()`)
- Use overly condensed code
- Skip comments on non-obvious logic

---

## 🚀 Features

- ✅ Clean, readable code suitable for learning
- ✅ Comprehensive comments on each function
- ✅ 34 unit tests with good coverage
- ✅ Examples and use cases for each function
- ✅ Git repository initialized

---

## 📚 Learning Topics

This project teaches:
- Stack data structure (`isValidBrackets`)
- String sorting and comparison (`naturalSort`)
- Search algorithms and ranking (`autocomplete`)
- Conversion between number systems (`intToRoman`, `romanToInt`)
- String and array manipulation (`descendingSort`)
- Dynamic programming / sequences (`tribonacci`)

---

## ✍️ Author

Created: February 24, 2026  
For: Learning Swift and algorithm practice

---

## 📄 License

This project is open source and available for educational purposes.
