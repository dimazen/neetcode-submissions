class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var buffer: [Int: Int] = [:]

        for (index, value) in nums.enumerated() {
            let difference = target - value
            
            if let match = buffer[difference] {
                return [match, index]
            }

            buffer[value] = index
        }

        return []
    }
}
