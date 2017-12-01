import CoreService
import Vapor

private struct JSONKey {
  static let identifier = "id"
  static let name = "name"
}

struct GameConsoleMapper: Mappable {
  func map(_ from: JSON) throws -> GameConsole {
    guard let identifier = from[JSONKey.identifier]?.string else {
      throw GameError.invalidResponse
    }
    guard let name = from[JSONKey.name]?.string else {
      throw GameError.invalidResponse
    }
    return GameConsole(
      identifier: Identifier(identifier),
      name: name
    )
  }
}
