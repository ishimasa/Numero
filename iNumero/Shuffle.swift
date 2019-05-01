/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

// Source: http://stackoverflow.com/a/24029847/1855792 - Nate Cooke

import Foundation

extension MutableCollection {
    /// Shuffles the contents of this collection.
    // A B C D の文字列をシャッフルして入れ替える
    mutating func shuffle() {
        let c = count
        // print("self_before", self)
        guard c > 1 else { return }
        // print("c: ", c)
        // firstUnshuffled: indices(0..<4)  (0->2),
        // unshuffledCount: stride(from: c, to: 1, by: -1)) (4->2)
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d = Int(arc4random_uniform(numericCast(unshuffledCount)))
            // firstUnshuffled =0 d: 3〜0の乱数
            // firstUnshuffled =1 d: 2〜0の乱数
            // firstUnshuffled =2 d: 1〜0の乱数
            let i = index(firstUnshuffled, offsetBy: d)
            // print("d: ", d, "i: ", i, "firstUnshuffled: ", firstUnshuffled)
            swapAt(firstUnshuffled, i)
            // print("self_after", self)
        }
        // print("self_fix", self)
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    // このシーケンスの内容を含む配列をシャッフルして返します。
    func shuffled() -> [Element] {
        var result = Array(self)
        // A B C D の文字列をシャッフルして入れ替える
        result.shuffle()
        return result
    }
}

extension String {
    // このシーケンスの内容を含む文字列をシャッフルして文字列で返します。
    func garbled() -> String {
        return String(shuffled())
    }
}

