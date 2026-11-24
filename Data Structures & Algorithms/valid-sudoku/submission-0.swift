class Solution {
func isValidSudoku(_ board: [[Character]]) -> Bool {
        if board.isEmpty {
            return false
        }

        var rows = Array(repeating: Set<Character>(), count: 9)
        var columns = Array(repeating: Set<Character>(), count: 9)
        var buckets = Array(repeating: Set<Character>(), count: 9)

        for i in 0..<9 {
            for j in 0..<9 {
                let character = board[i][j]

                if !character.isNumber {
                    continue
                }

                let bucketIndex = (i / 3) * 3 + (j / 3)
                if buckets[bucketIndex].insert(character).inserted == false {
                    return false
                }

                if rows[i].insert(character).inserted == false {
                    return false
                }

                if columns[j].insert(character).inserted == false {
                    return false
                }
            }
        }

        return true
    }
}
