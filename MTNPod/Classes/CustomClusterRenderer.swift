import Foundation
import GoogleMapsUtils
/**
 This class is used to render clusters on map.
 */
public class CustomClusterRenderer: GMUDefaultClusterRenderer {
    /**
     This function returns if the markers should be clustered.

     - parameters:
         - cluster: The marker cluster.
         - zoom: Zoom level.

     - returns:
     True if the markers should be clustered, false otherwise.
     */
    public override func shouldRender(as cluster: GMUCluster, atZoom zoom: Float) -> Bool {
        return zoom <= 17 && cluster.count >= 2
    }
}
