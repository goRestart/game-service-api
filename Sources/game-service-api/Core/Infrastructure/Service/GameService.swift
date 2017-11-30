import CoreService
import Vapor

struct GameService {
  
  private let client: ClientProtocol
  private let gameMapper: GameMapper
  
  init(client: ClientProtocol,
       gameMapper: GameMapper)
  {
    self.client = client
    self.gameMapper = gameMapper
  }
  
  func get(with id: CoreService.Identifier<Game>) throws -> Game? {
    let response = try client.get("/\(id.value)")
    
    guard response.status == .ok else { return nil }
    guard let json = response.json else {
      throw GameError.invalidResponse
    }
    return try gameMapper.map(json)
  }
}
