class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var buffer: [Int: Int] = [:]
        buffer.reserveCapacity(nums.count)

        for value in nums {
            buffer[value, default: 0] += 1
        }

        let result = buffer
            .sorted(by: { lhs, rhs in lhs.value > rhs.value })
            .prefix(k)
            .map { $0.key }
        return result
    }
}
