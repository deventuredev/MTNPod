import Foundation
import SwiftSignalRClient
import Loooot

public protocol SignalRCallback {
    func onTokenCollectedSignal(data: SignalRService.TokenNotifyPlayerModel)
    func onRefreshCampaigns()

    func connectionDidOpen(hubConnection: HubConnection)
    func connectionDidFailToOpen(error: Error)
    func connectionDidClose(error: Error?)
    func connectionWillReconnect(error: Error?)
    func connectionDidReconnect()
}

public class SignalRService: HubConnectionDelegate {
    public var isConnected: Bool = false
    
    public func connectionDidOpen(hubConnection: HubConnection) {
        isConnected = true
        callback?.connectionDidOpen(hubConnection: hubConnection)
    }
    
    public func connectionDidFailToOpen(error: Error) {
        isConnected = false
        callback?.connectionDidFailToOpen(error: error)
    }
    
    public func connectionDidClose(error: Error?) {
        isConnected = false
        callback?.connectionDidClose(error: error)
    }
    
    public func connectionWillReconnect(error: Error) {
        isConnected = false
        callback?.connectionWillReconnect(error: error)
    }

    public func connectionDidReconnect(){
        isConnected = true
        callback?.connectionDidReconnect()
    }
    
    private static var instance: SignalRService?
    
    private var connection: HubConnection?
    private var callback: SignalRCallback?
    
    public static func shared(callback: SignalRCallback) -> SignalRService {
        return SignalRService(callback: callback)
    }
    
    private init(callback: SignalRCallback) {
        self.callback = callback
    }
    
    public func start() {
        let url = URL(string: BaseLooootManager.sharedInstance.getSignalRUrl())
        connection = HubConnectionBuilder(url: url!).withLogging(minLogLevel: .error).withAutoReconnect().build()
        connection?.on(method: "onTokenCollected", callback: { (message:  String) in
            let data = TokenNotifyPlayerModel(json: self.convertToDictionary(text:message)!)
            self.callback?.onTokenCollectedSignal(data: data)
        })
        connection?.on(method: "onRefreshCampaigns", callback: { (message:  String) in
            self.callback?.onRefreshCampaigns()
        })
        connection?.delegate = self
        connection?.start()
    }
    
    public func stop() {
        connection?.stop()
    }
    
    public func getConnectionId() -> String {
        if(!isConnected) {
            return "DISCONNECTED"
        }
        return (connection?.connectionId)!
    }

    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    public func onClaimToken(claimTokenModel: ClaimTokenSignalRModel) {
        if !isConnected {
            return
        }
        connection?.send(method: "onClaimToken", claimTokenModel.toJson())
    }
    
    public func changeRoomByLatLongIdentifier(oldRoom: String, newRoom: String) {
        if !isConnected {
            return
        }
        let param = RoomsPlayerModel(oldRoom: oldRoom, newRoom: newRoom)
        connection?.send(method: "ChangeRoomByLatLongIdentifier", param.toJson())
    }
    
    public class RoomsPlayerModel
    {
        private var oldRoom: String!
        private var newRoom: String!
        
        public init(oldRoom: String, newRoom: String) {
            initObj(newRoom: newRoom, oldRoom: oldRoom)
        }
        
        public init(json: [String: Any]) {
            deserialize(json: json)
            
        }
        
        public func getOldRoom() -> String {
            return oldRoom
        }
        
        
        public func setOldRoom(oldRoom: String) {
            self.oldRoom = oldRoom
        }
        
        public func getNewRoom() -> String {
            return oldRoom
        }
        
        
        public func setNewRoom(oldRoom: String) {
            self.oldRoom = oldRoom
        }
        
        private func deserialize(json: [String: Any]) {
            
            let newRoom = json["N"] as! String
            let oldRoom = json["O"] as! String
            
            
            initObj(newRoom: newRoom, oldRoom: oldRoom)
        }
        
        private func initObj(newRoom: String, oldRoom: String) {
            self.oldRoom = oldRoom
            self.newRoom = newRoom
        }
        
        public func toJson() -> String {
            return "{\"O\":\"\(oldRoom.description)\",\"N\":\"\(newRoom.description)\"}"
        }
    }
    
    public class TokenNotifyPlayerModel
    {
        private var tokenId: Int64!
        private var groupId: Int64!
        private var campaignId: Int64!
        
        public init(tokenId: Int64, groupId: Int64, campaignId: Int64) {
            initObj(tokenId: tokenId, groupId: groupId, campaignId:campaignId)
        }
        
        public init(json: [String: Any]) {
            deserialize(json: json)
            
        }
        
        public func getTokenId() -> Int64 {
            return tokenId
        }
        
        
        public func setTokenId(tokenId: Int64) {
            self.tokenId = tokenId
        }
        
        public func getGroupId() -> Int64 {
            return groupId
        }
        
        
        public func setGroupId(groupId: Int64) {
            self.groupId = groupId
        }
        
        public func getCampaignId() -> Int64 {
            return campaignId
        }
        
        
        public func setCampaignId(campaignId: Int64) {
            self.campaignId = campaignId
        }
        
        private func deserialize(json: [String: Any]) {
            
            let tokenId = json["T"] as! Int64
            let groupId = json["G"] as! Int64
            let campaignId = json["C"] as! Int64
            
            initObj(tokenId: tokenId, groupId: groupId, campaignId: campaignId)
        }
        
        private func initObj(tokenId: Int64, groupId: Int64, campaignId: Int64) {
            self.tokenId = tokenId
            self.groupId = groupId
            self.campaignId = campaignId
        }
    }
}
