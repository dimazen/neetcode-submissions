class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sCharacters = Dictionary(s.utf8.map { ($0, 1) }, uniquingKeysWith: { $0 + $1 })
        let tCharacters = Dictionary(t.utf8.map { ($0, 1) }, uniquingKeysWith: { $0 + $1 })

        return sCharacters == tCharacters
    }
}