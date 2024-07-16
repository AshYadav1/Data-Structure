import UIKit

/*
 Given an array of integers, find the sum of its elements.
For example, if the array ar=[1,2,3], 1+2+3=6, so return 6.
 */

func simpleArraySum(ar: [Int]) -> Int {
    // Write your code here
    var sum = 0
   for value in ar {
       sum += value
   }
   return sum
}

/*
 Alice and Bob each created one problem for HackerRank. A reviewer rates the two challenges, awarding points on a scale from 1 to 100 for three categories: problem clarity, originality, and difficulty.
 
 The rating for Alice's challenge is the triplet a = (a[0], a[1], a[2]), and the rating for Bob's challenge is the triplet b = (b[0], b[1], b[2]).
 The task is to find their comparison points by comparing a[0] with b[0], a[1] with b[1], and a[2] with b[2].
 
 If a[i] > b[i], then Alice is awarded 1 point.
 If a[i] < b[i], then Bob is awarded 1 point.
 If a[i] = b[i], then neither person receives a point.
 Comparison points is the total points a person earned.
 Given a and b, determine their respective comparison points.
 
 Example
 a = [1, 2, 3]
 b = [3, 2, 1]
 
 For elements *0*, Bob is awarded a point because a[0] .
 For the equal elements a[1] and b[1], no points are earned.
 Finally, for elements 2, a[2] > b[2] so Alice receives a point.
 The return array is [1, 1] with Alice's score first and Bob's second.
 */

func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var output: [Int] = [0,0]
    for index in 0..<a.count where a.count == b.count {
        if a[index] > b[index] {
            output[0] += 1
        } else if a[index] < b[index] {
            output[1] += 1
        }
    }
    return output
}

/*
 Given a square matrix, calculate the absolute difference between the sums of its diagonals.
For example, the square matrix  is shown below:
1 2 3
4 5 6
9 8 9
 
 The left-to-right diagonal = 1+5+9 = 15.  The right to left diagonal = 3+5+9=17. Their absolute difference is |15-17| = 2.
 */

func diagonalDifference(arr: [[Int]]) -> Int {
    var absoluteValue: Int = 0
    for rowIndex in 0..<arr.count {
        let columnArr = arr[rowIndex]
        if arr.count == columnArr.count {
            let leftDiagnolValue = columnArr[rowIndex]
            let rightDiagnolValue = columnArr[columnArr.count - 1 - rowIndex]
            absoluteValue += (leftDiagnolValue - rightDiagnolValue)
        } else {
            break
        }
    }
    return absoluteValue < 0 ? -(absoluteValue) : absoluteValue
}

/*
 Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero. Print the decimal value of each fraction on a new line with 6 places after the decimal.
 Note: This challenge introduces precision problems. The test cases are scaled to six decimal places, though answers with absolute error of up to 10 to the power of -4 are acceptable.
 Example
  arr = [1,1,0,-1,-1]
 
 There are n = 5 elements, two positive, two negative and one zero. Their ratios are 2/5 = 0.400000, 2/5 = 0.400000 and 1/5 = 0.200000. Results are printed as:
 
 0.400000
 0.400000
 0.200000
 
 */

func plusMinus(arr: [Int]) {
    
    var numberofPositive: Double = 0
    var numberOfNegative: Double = 0
    var numberOfZeros: Double = 0
    for value in arr {
        if value < 0 {
            numberOfNegative += 1
        } else if value == 0 {
            numberOfZeros += 1
        } else {
            numberofPositive += 1
        }
    }
    let positiveDivision = numberofPositive / Double(arr.count)
    let negativeDivision = numberOfNegative / Double(arr.count)
    let zeroDivision = numberOfZeros / Double(arr.count)
    print(String(format: "%.6f", positiveDivision))
    print(String(format: "%.6f", negativeDivision))
    print(String(format: "%.6f", zeroDivision))
}

/*
 Staircase detail
 This is a staircase of size :
    #
   ##
  ###
 ####
 Its base and height are both equal to . It is drawn using # symbols and spaces. The last line is not preceded by any spaces.
 Write a program that prints a staircase of size .
 Function Description
 Complete the staircase function in the editor below.
 staircase has the following parameter(s):
 int n: an integer
 */

func staircase(n: Int) -> Void {
    // Write your code here
    var output: String = ""
    for row1 in 0..<n {
        for column1 in 0..<n {
            if (n - row1 - 1) <= column1 {
                output += "#"
            } else {
                output += " "
            }
        }
         output += "\n"
    }
    print(output)
}

/*
 Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.
 Example
 arr = [1,3,5,7,9]
 
 The minimum sum is 1+3+5+7 = 16  and the maximum sum is 3+5+7+9=24. The function prints
 
 16 24
 */

func miniMaxSum(arr: [Int]) -> Void {
   
    var sum = 0
    for value in arr {
        sum += value
    }
    var min = sum - arr[0]
    var max = sum - arr[0]
    for index in 1..<arr.count {
        let expectedMinMax = sum - arr[index]
        if expectedMinMax < min {
            min = expectedMinMax
        } else if max < expectedMinMax {
            max = expectedMinMax
        }
    }
    print(min, max)
}

/*
 You are in charge of the cake for a child's birthday. You have decided the cake will have one candle for each year of their total age. They will only be able to blow out the tallest of the candles. Count how many candles are tallest.
 Example
 
 candels = [4,4,1,3]
 
 The maximum height candles are 4 units high. There are 2 of them, so return 2.
 Function Description
 Complete the function birthdayCakeCandles in the editor below.
 birthdayCakeCandles has the following parameter(s):
 int candles[n]: the candle heights
 */

func birthdayCakeCandles(candles: [Int]) -> Int {
    guard !candles.isEmpty else { return 0 }

    var maxCandleHeight = candles[0]
    var maxCandleCount = 1

    for i in 1..<candles.count {
        if candles[i] > maxCandleHeight {
            maxCandleHeight = candles[i]
            maxCandleCount = 1
        } else if candles[i] == maxCandleHeight {
            maxCandleCount += 1
        }
    }

    return maxCandleCount
}

/*
 Given a time in 12-hour AM/PM format, convert it to military (24-hour) time.
 Note: - 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock.
 - 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock.
 Example
   s = "12:01:00PM"
 Return '12:01:00'.
   s = "12:01:00AM"
 Return '00:01:00'.
 */

func timeConversion(s: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm:ssa"
    let date = formatter.date(from: s)
    let dateFormatter24 = DateFormatter()
    dateFormatter24.dateFormat = "HH:mm:ss"
    let convertedTime = dateFormatter24.string(from: date!)
    return convertedTime
}
