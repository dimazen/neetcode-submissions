class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var hash = Set<Int>()
        hash.reserveCapacity(nums.count)

        for value in nums {
            if !hash.insert(value).inserted {
                return true
            }
        }

        return false
    }
}
