class Solution {
    func encode(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }

        var buffer = ""
        for string in strs {
            buffer.append("\(string.count),")
        }

        buffer.removeLast()
        buffer.append("=")
        buffer.append(contentsOf: strs.joined())

        return buffer
    }

    func decode(_ str: String) -> [String] {
        if str.isEmpty {
            return []
        }

        guard let index = str.firstIndex(of: "=") else {
            return []
        }

        let counts = str[..<index].components(separatedBy: ",").compactMap(Int.init)
        var buffer: [String] = []

        var start = str.index(after: index)

        for count in counts {
            let end = str.index(start, offsetBy: count)
            let slice = String(str[start..<end])
            buffer.append(slice)

            start = end
        }

        return buffer
    }
}
