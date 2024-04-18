

import Foundation
import FirebaseStorage

final class StorageManager {
    static let shared = StorageManager()
    private init() { }
    
    private let storage = Storage.storage().reference()
    
    func saveImage(data: Data, fileName: String) async throws -> (path: String, name: String){
        let meta = StorageMetadata()
        meta.contentType = "image/heic"
        let path = fileName

        let returnedMetaData = try await storage.child(path).putDataAsync(data, metadata: meta)
        guard let returnedPath = returnedMetaData.path, let returnedName = returnedMetaData.name else {
            throw URLError(.badServerResponse)
        }
        
        return (returnedPath, returnedName)
    }
}
