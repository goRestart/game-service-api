import CoreService
import Vapor

struct GameService {
  
  private let client: ClientProtocol
  private let gameMapper: GameMapper
  private let gameConsoleMapper: GameConsoleMapper
  
  init(client: ClientProtocol,
       gameMapper: GameMapper,
       gameConsoleMapper: GameConsoleMapper)
  {
    self.client = client
    self.gameMapper = gameMapper
    self.gameConsoleMapper = gameConsoleMapper
  }
  
  func get(with id: CoreService.Identifier<Game>) throws -> Game? {
    let response = try client.get(
      Endpoint.gameById(id).path
    )
    let json = try unwrap(response)
    return try gameMapper.map(json)
  }
  
  func get(with id: CoreService.Identifier<GameConsole>) throws -> GameConsole? {
    let response = try client.get(
      Endpoint.gameConsoleById(id).path
    )
    let json = try unwrap(response)
    return try gameConsoleMapper.map(json)
  }
  
  private func unwrap(_ response: Response) throws -> JSON {
    guard response.status == .ok,
      let json = response.json else {
      throw GameError.invalidResponse
    }
    return json
  }
}
