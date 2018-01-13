import CoreService
import Vapor

private struct JSONKey {
  static let identifier = "id"
  static let name = "name"
  static let alternativeNames = "alternativeNames"
}

struct GameMapper: Mappable {
  func map(_ from: JSON) throws -> Game {
    guard let identifier = from[JSONKey.identifier]?.string else {
      throw GameError.invalidResponse
    }
    guard let name = from[JSONKey.name]?.string else {
      throw GameError.invalidResponse
    }
    guard let alternativeNames = from[JSONKey.alternativeNames]?.array else {
      throw GameError.invalidResponse
    }
    return Game(
      identifier: Identifier(identifier),
      name: name,
      alternativeNames: alternativeNames.flatMap { $0.string }
    )
  }
}
