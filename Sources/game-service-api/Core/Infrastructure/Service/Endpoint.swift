import CoreService

enum Endpoint {
  case gameById(CoreService.Identifier<Game>)
  case gameConsoleById(CoreService.Identifier<GameConsole>)
  
  var path: String {
    switch self {
    case .gameById(let identifier):
      return "/\(identifier.value)"
    case .gameConsoleById(let identifier):
      return "/game-console/\(identifier.value)"
    }
  }
}
