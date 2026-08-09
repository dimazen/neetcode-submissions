class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var buffer: [Int: [String]] = [:]

        for string in strs {
            let key = string.reduce(into: [Character: Int]()) { acc, character in
                if let count = acc[character] {
                    acc[character, default: 0] += count
                } else {
                    acc[character] = 1
                }
            }.hashValue

            buffer[key, default: Array<String>()].append(string)
        }

        return Array(buffer.values)
    }
}
