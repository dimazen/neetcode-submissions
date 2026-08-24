class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var buffer = [Int: Int]()
        var result = 0

        for num in nums {
            if buffer[num] == nil {
                let leading = buffer[num - 1] ?? 0
                let trailing = buffer[num + 1] ?? 0
                let length = leading + trailing + 1

                buffer[num] = length
                buffer[num - leading] = length
                buffer[num + trailing] = length

                result = max(result, length)
            }
        }

        return result
    }
}
