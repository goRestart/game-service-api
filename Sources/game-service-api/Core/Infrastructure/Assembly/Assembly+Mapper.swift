import CoreService

extension Assembly {
  var gameMapper: GameMapper {
    return GameMapper()
  }
  
  var gameConsoleMapper: GameConsoleMapper {
    return GameConsoleMapper()
  }
}
