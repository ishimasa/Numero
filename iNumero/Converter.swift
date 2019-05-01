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

// ローマ数字変換器を表すモデル。
class Converter {
    func convert(_ number: Int) -> String {
        var localNumber = number
        var result = ""
        
        let numberSymbols: [(number: Int, symbol: String)] =
            [(1000, "M"),
             (900, "CM"),
             (500, "D"),
             (400, "CD"),
             (100, "C"),
             (90, "XC"),
             (50, "L"),
             (40, "XL"),
             (10, "X"),
             (9, "IX"),
             (5, "V"),
             (4, "IV"),
             (1, "I")]
        
        for item in numberSymbols {
            while localNumber >= item.number {
                result += item.symbol
                localNumber = localNumber - item.number
            }
        }
        
        return result
    }
    
    /*
    func convert(_ number: Int) -> String {
        // 空の出力文字列を初期化します。
        var result = ""
        // 作業する入力のローカルコピーを作成します。
        var localNumber = number
        /*
        // 入力が10以上かどうかをチェックします。
        while localNumber >= 10 {
            // 出力結果に10というローマ数字を付加します。
            result += "X"
            // 5と1を処理する次のフェーズに実行を渡す前に、入力のローカルコピーから10を減らします。
            localNumber = localNumber - 10
        }
        */
        let numberSymbols: [(number: Int, symbol: String)] // 1
            = [(10, "X")] // 2
        
        for item in numberSymbols { // 3
            while localNumber >= item.number { // 4
                result += item.symbol
                localNumber = localNumber - item.number
            }
        }
        
        
        if localNumber >= 9 {
            result += "IX"
            localNumber = localNumber - 9
        }
        //  入力が5以上であるかどうかをチェックします。
        if localNumber >= 5 {
            // 出力に5のローマ数字を追加します。
            result += "V"
            // ローカル入力を5だけデクリメントします。
            localNumber = localNumber - 5
        }
        if localNumber >= 4 {
            result += "IV"
            localNumber = localNumber - 4
        }
        // 1に対するローマ数字変換の繰り返しカウントで出力を追加します。
        while localNumber >= 1 {
            result += "I"
            localNumber = localNumber - 1
        }
        return result
    }
    */
}
