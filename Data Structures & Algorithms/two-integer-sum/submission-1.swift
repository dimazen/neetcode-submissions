class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var buffer: [Int: Int] = Dictionary(nums.enumerated().map { ($0.element, $0.offset) }, uniquingKeysWith: { lhs, rhs in lhs })

        for (index, value) in nums.enumerated() {
            let difference = target - value
            
            if let match = buffer[difference], match != index {
                return index < match ? [index, match] : [match, index]
            }
        }

        return []
    }
}
