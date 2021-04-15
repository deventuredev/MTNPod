import Foundation
import Loooot
import GoogleMaps

public class LooootManager : BaseLooootManager, MapViewDelegate {
    var mapView: MTNMapView?
    
    public static var shared:BaseLooootManager {
        get {
            if(BaseLooootManager.sharedInstance.protoHttpManagerDelegate == nil) {
                BaseLooootManager.sharedInstance.protoHttpManagerDelegate = ProtoClientManager.shared
            }
            return BaseLooootManager.sharedInstance
        }
    }
    
    public func GetMapView() -> BaseMapView {
        GMSServices.provideAPIKey(LooootManager.googleMapsApiKey)
        return mapView!
    }
    
    private override init() {
        super.init()
    }
}
