import CoreService

extension Assembly {
  var gameService: GameService {
    return GameService(
      clientProvider: self,
      gameMapper: gameMapper,
      gameConsoleMapper: gameConsoleMapper
    )
  }
}
