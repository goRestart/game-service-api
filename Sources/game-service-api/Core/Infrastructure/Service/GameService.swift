import CoreService
import Vapor

struct GameService {
  
  private let clientProvider: ClientProvider
  private let gameMapper: GameMapper
  private let gameConsoleMapper: GameConsoleMapper
  
  init(clientProvider: ClientProvider,
       gameMapper: GameMapper,
       gameConsoleMapper: GameConsoleMapper)
  {
    self.clientProvider = clientProvider
    self.gameMapper = gameMapper
    self.gameConsoleMapper = gameConsoleMapper
  }
  
  func get(with id: CoreService.Identifier<Game>) throws -> Game? {
    let json = try unwrap(.gameById(id))
    return try gameMapper.map(json)
  }
  
  func get(with id: CoreService.Identifier<GameConsole>) throws -> GameConsole? {
    let json = try unwrap(.gameConsoleById(id))
    return try gameConsoleMapper.map(json)
  }
  
  private func unwrap(_ endpoint: Endpoint) throws -> JSON? {
    do {
      let response = try clientProvider.client().get(endpoint.path)
      guard response.status == .ok,
        let json = response.json else {
          return nil
      }
      return json
    } catch {
      return nil
    }
  }
}
