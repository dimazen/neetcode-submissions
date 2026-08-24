class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        class Cell: CustomStringConvertible {
            class Storage {
                var value: ClosedRange<Int> = 1...1
            }

            private(set) var storage = Storage()

            func relink(to cell: Cell) {
                storage = cell.storage
            }

            var count: Int {
                storage.value.count
            }

            var description: String {
                "\(ObjectIdentifier(self)) \(storage.value.count)"
            }
        }

        var ranges: [Int: Cell] = [:]

        for num in nums where ranges[num] == nil {
            let leadingRangeEnd = num - 1
            let trailintRangeStart = num + 1

            let leadingRange = ranges[leadingRangeEnd]
            let trailingRange = ranges[trailintRangeStart]

            switch (leadingRange, trailingRange) {
            case (nil, nil):
                let cell = Cell()
                cell.storage.value = num...num
                ranges[num] = cell

            case (nil, let trailingRange?):
                trailingRange.storage.value = num...trailingRange.storage.value.upperBound
                ranges[num] = trailingRange

            case (let leadingRange?, nil):
                leadingRange.storage.value = leadingRange.storage.value.lowerBound...num
                ranges[num] = leadingRange

            case (let leadingRange?, let trailingRange?) where leadingRange !== trailingRange:
                leadingRange.storage.value = leadingRange.storage.value.lowerBound...trailingRange.storage.value.upperBound
                trailingRange.relink(to: leadingRange)
                ranges[num] = leadingRange
                ranges[trailingRange.storage.value.upperBound]?.relink(to: leadingRange)

            case (_?, _?):
                break
            }
        }

        return ranges.max(by: { $0.value.count < $1.value.count })?.value.count ?? 0
    }
}
