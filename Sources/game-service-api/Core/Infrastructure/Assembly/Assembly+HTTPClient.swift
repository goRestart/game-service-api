import CoreService
import Vapor

protocol ClientProvider {
  func client() -> ClientProtocol
}

extension Assembly: ClientProvider {
  func client() -> ClientProtocol {
    return try! EngineClient
      .factory
      .makeClient(
        hostname: "game.restart-api.com",
        port: 80,
        securityLayer: .none,
        proxy: nil
    )
  }
}
