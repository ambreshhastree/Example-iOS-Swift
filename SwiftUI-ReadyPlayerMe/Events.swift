//
//  Events.swift
//  SwiftUI-ReadyPlayerMe
//
//  Event classes for Ready Player Me integration
//
class AvatarExportedEvent {
    var url: String
    
    init (url: String) {
        self.url = url
    }
}

class AssetUnlockedEvent {
    var userId: String
    var assetId: String
    
    init (userId: String, assetId: String) {
        self.userId = userId
        self.assetId = assetId
    }
}

class UserSetEvent {
    var id: String
    
    init (id: String) {
        self.id = id
    }
}

class UserAuthorizedEvent {
    var id: String
    
    init (id: String) {
        self.id = id
    }
}

class UserUpdatedEvent {
    var id: String
    
    init (id: String) {
        self.id = id
    }
}