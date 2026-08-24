class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result: [Int] = Array(repeating: 0, count: nums.count)
        var zeros = Set<Int>()

        var sum = 1

        for i in 0..<nums.count {
            let value = nums[i]

            if value != 0 {
                sum *= value
            } else {
                zeros.insert(i)
            }
        }

        if nums.count == zeros.count {
            return result
        }

        for i in 0..<nums.count {
            let value = nums[i]

            if zeros.count > 1 || (!zeros.contains(i) && !zeros.isEmpty) {
                result[i] = 0
            } else if value != 0 {
                result[i] = Int(Double(sum) / Double(value))
            } else {
                result[i] = sum
            }
        }

        return result
    }
}
