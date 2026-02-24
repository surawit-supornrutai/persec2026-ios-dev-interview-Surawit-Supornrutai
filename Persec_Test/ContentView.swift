//
//  ContentView.swift
//  Persec_Test
//
//  Created by Surawit Supornrutai on 24/2/2569 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("isValidBrackets") {
                print("() : ", isValidBrackets("()"))      // true
                print("([]] : ", isValidBrackets("([]]"))    // false
                print("([]}) : ", isValidBrackets("([]})"))   // false
                print(") : ", isValidBrackets(")"))       // false
            }
            .buttonStyle(.glassProminent)
            
            Button("naturalSort") {
                let input1 = ["TH19", "SG20", "TH2"]
                print("input: [TH19, SG20, TH2], output: ", naturalSort(input1))
                // ผลลัพธ์: ["SG20", "TH2", "TH19"]
                
                let input2 = ["TH10", "TH3Netflix", "TH1", "TH7"]
                print("input: [TH10, TH3Netflix, TH1, TH7], output: ", naturalSort(input2))
                // ผลลัพธ์: ["TH1", "TH3Netflix", "TH7", "TH10"]
            }
            .buttonStyle(.glassProminent)
            .padding(.top, 20)
            
            Button("autocomplete") {
                let items = ["Mother", "Think", "Worthy", "Apple", "Android"]
                let result = autocomplete(search: "th", items: items, maxResult: 2)
                print("autocomplete: ", result) // ผลลัพธ์: ["Think", "Mother"]
            }
            .buttonStyle(.glassProminent)
            .padding(.top, 20)
            
            Button("intToRoman") {
                print("1989: ", intToRoman(1989)) // "MCMLXXXIX"
                print("68: ", intToRoman(68)) // "LXVIII"
            }
            .buttonStyle(.glassProminent)
            .padding(.top, 20)
            
            Button("romanToInt") {
                print("MCMLXXXIX: ", romanToInt("MCMLXXXIX")) // 1989
                print("CIX: ", romanToInt("CIX")) // 109
            }
            .buttonStyle(.glassProminent)
            .padding(.top, 20)
            
            Button("descendingSort") {
                print("3008: ", descendingSort(3008)) // 8300
                print("1989: ", descendingSort(1989)) // 9981
            }
            .buttonStyle(.glassProminent)
            .padding(.top, 20)
            
            Button("tribonacci") {
                print("([1, 3, 5], 5): ", tribonacci([1, 3, 5], 5))     // [1, 3, 5, 9, 17]
                print("([2, 2, 2], 3): ", tribonacci([2, 2, 2], 3))     // [2, 2, 2]
                print("([10, 10, 10], 4): ", tribonacci([10, 10, 10], 4)) // [10, 10, 10, 30]
                print("([1, 1, 1], 1): ", tribonacci([1, 1, 1], 1))    // [1]
            }
            .buttonStyle(.glassProminent)
            .padding(.top, 20)
        }
    }
    
    func isValidBrackets(_ s: String) -> Bool {
        // ใช้ array เป็น stack เพื่อเก็บวงเล็บเปิด
        var stack: [Character] = []
        
        // ตรวจสอบแต่ละตัวอักษร
        for char in s {
            switch char {
            // เมื่อเจอวงเล็บเปิด ให้เก็บลงใน stack
            case "(", "[", "{":
                stack.append(char)
            
            // เมื่อเจอวงเล็บปิด ให้ตรวจสอบว่าเข้ากันไหม
            case ")":
                if stack.popLast() != "(" {
                    return false // ไม่เข้ากัน ❌
                }
            case "]":
                if stack.popLast() != "[" {
                    return false // ไม่เข้ากัน ❌
                }
            case "}":
                if stack.popLast() != "{" {
                    return false // ไม่เข้ากัน ❌
                }
            
            // อักษรอื่นๆ ไม่ต้องทำอะไร
            default:
                break
            }
        }
        
        // ตรวจสอบว่า stack ว่างหรือไม่
        // ถ้าว่าง = วงเล็บสมดุล ✅
        // ถ้าไม่ว่าง = มีวงเล็บเปิดที่ไม่ได้ปิด ❌
        return stack.isEmpty
    }
    
    func naturalSort(_ input: [String]) -> [String] {
        // เรียงลำดับโดยให้ตัวเลขถูกเรียงตามค่า ไม่ใช่รหัส ASCII
        // เช่น "TH2" < "TH19" (2 น้อยกว่า 19)
        return input.sorted { firstItem, secondItem in
            // localizedStandardCompare เปรียบเทียบตามวิธีธรรมชาติ
            let comparisonResult = firstItem.localizedStandardCompare(secondItem)
            
            // ถ้า firstItem < secondItem ให้ return true (firstItem ไว้ข้างหน้า)
            return comparisonResult == .orderedAscending
        }
    }
    
    func autocomplete(search: String, items: [String], maxResult: Int) -> [String] {
        let query = search.lowercased()
        
        // ขั้นที่ 1: กรองเฉพาะ items ที่มีคำค้นหา และเก็บตำแหน่งของมัน
        var matchedItems: [(itemName: String, position: Int)] = []
        
        for item in items {
            let lowercasedItem = item.lowercased()
            
            // ค้นหาคำที่ตรงกับการค้นหา
            if let range = lowercasedItem.range(of: query) {
                // คำนวณตำแหน่งที่เจอ (เช่น 0 = ก่อนอื่น, 3 = ตำแหน่งที่ 3)
                let position = lowercasedItem.distance(
                    from: lowercasedItem.startIndex,
                    to: range.lowerBound
                )
                
                // เก็บ item และตำแหน่งของมัน
                matchedItems.append((itemName: item, position: position))
            }
        }
        
        // ขั้นที่ 2: เรียงลำดับตามตำแหน่ง (ตำแหน่งก่อนหน้าที่สุดมาก่อน)
        let sortedItems = matchedItems.sorted { first, second in
            // ถ้าตำแหน่งเดียวกัน ให้เรียงตามตัวอักษร
            if first.position == second.position {
                return first.itemName < second.itemName
            }
            
            // ถ้าตำแหน่งต่างกัน ให้ตำแหน่งก่อนมาก่อน
            return first.position < second.position
        }
        
        // ขั้นที่ 3: เอาแค่จำนวนผลลัพธ์ที่ต้องการ
        var results: [String] = []
        for i in 0..<min(maxResult, sortedItems.count) {
            results.append(sortedItems[i].itemName)
        }
        
        return results
    }
    
    func intToRoman(_ num: Int) -> String {
        // ตารางค่าตัวเลขและสัญลักษณ์โรมัน (จากมากไปน้อย)
        let romanTable: [(value: Int, symbol: String)] = [
            (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
            (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
            (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
        ]
        
        var result = ""
        var remainingNumber = num
        
        // ลูปไปทีละแถวของตาราค่า
        for (value, symbol) in romanTable {
            // นับว่าเลขที่เหลือ ได้ขนาดนี้กี่ครั้ง
            let count = remainingNumber / value
            
            // เพิ่มสัญลักษณ์ที่จำนวนครั้ง
            result += String(repeating: symbol, count: count)
            
            // ลบส่วนที่คำนวณแล้ว
            remainingNumber = remainingNumber % value
        }
        
        return result
    }
    
    func romanToInt(_ s: String) -> Int {
        // ตารางแปลงสัญลักษณ์โรมัน เป็นค่าตัวเลข
        let romanValues: [Character: Int] = [
            "I": 1, "V": 5, "X": 10, "L": 50,
            "C": 100, "D": 500, "M": 1000
        ]
        
        var total = 0
        let characters = Array(s)
        
        // ตรวจสอบแต่ละตัวอักษร
        for i in 0..<characters.count {
            let currentChar = characters[i]
            let currentValue = romanValues[currentChar] ?? 0
            
            // ถ้าตัวอักษรต่อไปมีค่ามากกว่า = กรณีลบ (เช่น IV = 4)
            if i + 1 < characters.count {
                let nextValue = romanValues[characters[i + 1]] ?? 0
                
                if currentValue < nextValue {
                    // ลบค่าปัจจุบัน (เช่น I ใน IV ถูกลบจาก V)
                    total -= currentValue
                } else {
                    // บวกค่าปัจจุบัน
                    total += currentValue
                }
            } else {
                // ตัวอักษรสุดท้าย ให้บวกเสมอ
                total += currentValue
            }
        }
        
        return total
    }
    
    func descendingSort(_ num: Int) -> Int {
        // ขั้นที่ 1: แปลงตัวเลขเป็น String (เช่น 3008 → "3008")
        let numberString = String(num)
        
        // ขั้นที่ 2: เรียงตัวอักษรจากมากไปน้อย (เช่น "3008" → "8300")
        let sortedCharacters = numberString.sorted(by: >)
        
        // ขั้นที่ 3: รวมตัวอักษรกลับเป็น String
        let sortedString = String(sortedCharacters)
        
        // ขั้นที่ 4: แปลงกลับเป็นตัวเลข (ถ้าแปลงไม่ได้ให้ return 0)
        return Int(sortedString) ?? 0
    }
    
    func tribonacci(_ signature: [Int], _ n: Int) -> [Int] {
        // หากจำนวนที่ต้องการเป็น 0 หรือน้อยกว่า ให้ return array ว่าง
        if n <= 0 {
            return []
        }
        
        // เริ่มต้นด้วยค่าจาก signature (เอาแค่ n ตัว)
        var result = Array(signature.prefix(n))
        
        // ถ้า signature มีตัวเลขน้อยกว่า n ให้สร้างตัวใหม่
        while result.count < n {
            // หา 3 ตัวสุดท้ายในลำดับ
            let last3Elements = result.suffix(3)
            
            // บวกทั้ง 3 ตัว ได้ตัวเลขใหม่
            let newValue = last3Elements.reduce(0, +)
            
            // เพิ่มตัวเลขใหม่ลงใน result
            result.append(newValue)
        }
        
        return result
    }
}
