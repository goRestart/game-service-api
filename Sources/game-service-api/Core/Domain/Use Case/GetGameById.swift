import CoreService
import Vapor

public struct GetGameById {
  
  private let gameService: GameService
  
  init(gameService: GameService) {
    self.gameService = gameService
  }
  
  public func execute(with id: CoreService.Identifier<Game>) throws -> Game? {
    return try gameService.get(with: id)
  }
}

// MARK: - Public initializer

extension GetGameById {
  public init() {
    self.init(gameService: resolver.gameService)
  }
}
