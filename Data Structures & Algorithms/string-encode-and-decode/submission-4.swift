class Solution {
    private func makeSeparator(of length: Int) -> String {
        String(UUID().uuidString.prefix(length))
    }

    func encode(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }

        let separator = makeSeparator(of: 6)

        var buffer = ""

        for string in strs {
            buffer.append(separator)
            buffer.append(string)
        }

        return buffer
    }

    func decode(_ str: String) -> [String] {
        if str.isEmpty {
            return []
        }

        let separator = str.prefix(6)
        let components = str.suffix(from: str.index(str.startIndex, offsetBy: 6)).components(separatedBy: separator)
        return components
    }
}
