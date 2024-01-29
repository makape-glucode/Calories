// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//  let foodFetcher = try? JSONDecoder().decode(FoodFetcher.self, from: jsonData)
//import Foundation
//// MARK: - FoodFetcher
//struct FoodFetcher: Codable {
//  let text: String?
//  let parsed: [Parsed]?
//  let hints: [Hint]?
//  let links: Links?
//  enum CodingKeys: String, CodingKey {
//    case text, parsed, hints
//    case links = "_links"
//  }
//}
//// MARK: - Hint
//struct Hint: Codable {
//  let food: HintFood?
//  let measures: [Measure]?
//  let label: String? // Added label property
//  enum CodingKeys: String, CodingKey {
//    case food, measures, label
//  }
//}
//// MARK: - HintFood
//struct HintFood: Codable {
//  let foodID, label, knownAs: String?
//  let nutrients: Nutrients?
//  let category: Category?
//  let categoryLabel: CategoryLabel?
//  let image: String?
//  let brand, foodContentsLabel: String?
//  let servingSizes: [ServingSize]?
//  let servingsPerContainer: Double?
//  enum CodingKeys: String, CodingKey {
//    case foodID = "foodId"
//    case label, knownAs, nutrients, category, categoryLabel, image, brand, foodContentsLabel, servingSizes, servingsPerContainer
//  }
//}
//enum Category: String, Codable {
//  case genericFoods = "Generic foods"
//  case genericMeals = "Generic meals"
//  case packagedFoods = "Packaged foods"
//}
//enum CategoryLabel: String, Codable {
//  case food = "food"
//  case meal = "meal"
//}
//// MARK: - Nutrients
//struct Nutrients: Codable {
//  let enercKcal, procnt, fat, chocdf: Double?
//  let fibtg: Double?
//  enum CodingKeys: String, CodingKey {
//    case enercKcal = "ENERC_KCAL"
//    case procnt = "PROCNT"
//    case fat = "FAT"
//    case chocdf = "CHOCDF"
//    case fibtg = "FIBTG"
//  }
//}
//// MARK: - ServingSize
//struct ServingSize: Codable {
//  let uri: String?
//  let label: Label?
//  let quantity: Double?
//}
//enum Label: String, Codable {
//  case cup = "Cup"
//  case egg = "Egg"
//  case gram = "Gram"
//  case ounce = "Ounce"
//}
//// MARK: - Measure
//struct Measure: Codable {
//  let uri: String?
//  let label: String?
//  let weight: Double?
//  let qualified: [Qualified]?
//}
//// MARK: - Qualified
//struct Qualified: Codable {
//  let qualifiers: [Qualifier]?
//  let weight: Int?
//}
//// MARK: - Qualifier
//struct Qualifier: Codable {
//  let uri: String?
//  let label: String?
//}
//// MARK: - Links
//struct Links: Codable {
//  let next: Next?
//}
//// MARK: - Next
//struct Next: Codable {
//  let title: String?
//  let href: String?
//}
//// MARK: - Parsed
//struct Parsed: Codable {
//  let food: ParsedFood?
//}
//// MARK: - ParsedFood
//struct ParsedFood: Codable {
//  let foodID: String?
//  let label: Label?
//  let knownAs: String?
//  let nutrients: Nutrients?
//  let category: Category?
//  let categoryLabel: CategoryLabel?
//  let image: String?
//  enum CodingKeys: String, CodingKey {
//    case foodID = "foodId"
//    case label, knownAs, nutrients, category, categoryLabel, image
//  }
//}











/// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//  let foodFetcher = try? JSONDecoder().decode(FoodFetcher.self, from: jsonData)
import Foundation

struct FoodFetcher: Codable {
    let text: String?
    let parsed: [JSONAny]?
    let hints: [Hint]?
    let links: Links?
    
    enum CodingKeys: String, CodingKey {
        case text, parsed, hints
        case links = "_links"
    }
}

struct Hint: Codable {
    let food: Food?
    let measures: [Measure]?
}

struct Food: Codable {
    let foodID, label, knownAs: String?
    let nutrients: Nutrients?
    let category: Category?
    let categoryLabel: CategoryLabel?
    let foodContentsLabel: String?
    let image: String?
    let brand: String?
    let servingSizes: [ServingSize]?
    
    enum CodingKeys: String, CodingKey {
        case foodID = "foodId"
        case label, knownAs, nutrients, category, categoryLabel, foodContentsLabel, image, brand, servingSizes
    }
}

struct Nutrients: Codable {
    let enercKcal, procnt, fat, chocdf: Double?
    let fibtg: Double?
    
    enum CodingKeys: String, CodingKey {
        case enercKcal = "ENERC_KCAL"
        case procnt = "PROCNT"
        case fat = "FAT"
        case chocdf = "CHOCDF"
        case fibtg = "FIBTG"
    }
}

struct ServingSize: Codable {
    let uri: String?
    let label: String?
    let quantity: Double?
}

struct Measure: Codable {
    let uri: String?
    let label: String?
    let weight: Double?
}

struct Links: Codable {
    let next: Next?
}

struct Next: Codable {
    let title: String?
    let href: String?
}

// Encode/decode helpers
class JSONNull: Codable, Hashable {
    static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }

    init() {}

    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannotdecode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil(), value {
            return JSONNull()
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key), value {
            return JSONNull()
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            try encode(to: &container, value: value)
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
       for (key, value) in dictionary {
            let codingKey = JSONCodingKey(stringValue: key)!
            try encode(to: &container, key: codingKey, value: value)
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, key: JSONCodingKey, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value, forKey: key)
        } else if let value = value as? Int64 {
            try container.encode(value, forKey: key)
        } else if let value = value as? Double {
            try container.encode(value, forKey: key)
        } else if let value = value as? String {
            try container.encode(value, forKey: key)
        } else if let value = value as? JSONNull {
            try container.encodeNil(forKey: key)
        } else if let value = value as? [Any] {
            try container.encode(value, forKey: key)
        } else if let value = value as? [String: Any] {
            try container.encode(value, forKey: key)
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    func encode(to encoder: Encoder) throws {
        var container: SingleValueEncodingContainer
        switch value {
        case let value as Bool:
            try encode(to: &container, value: value)
        case let value as Int64:
            try encode(to: &container, value: value)
        case let value as Double:
            try encode(to: &container, value: value)
        case let value as String:
            try encode(to: &container, value: value)
        case is JSONNull:
            try encode(to: &container, value: JSONNull())
        case let value as [Any]:
            container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: value)
        case let value as [String: Any]:
            container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: value)
        default:
            throw encodingError(forValue: value, codingPath: encoder.codingPath)
        }
    }
}
