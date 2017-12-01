import CoreService
import Vapor

public struct GetGameConsoleById {
  
  private let gameService: GameService
  
  init(gameService: GameService) {
    self.gameService = gameService
  }
  
  public func execute(with id: CoreService.Identifier<GameConsole>) throws -> GameConsole? {
    return try gameService.get(with: id)
  }
}

// MARK: - Public initializer

extension GetGameConsoleById {
  public init() {
    self.init(gameService: resolver.gameService)
  }
}
