import CoreService

extension Assembly {
  var gameService: GameService {
    return GameService(
      client: httpClient,
      gameMapper: gameMapper,
      gameConsoleMapper: gameConsoleMapper
    )
  }
}
