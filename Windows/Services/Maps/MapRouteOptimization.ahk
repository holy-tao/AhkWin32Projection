#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * [Deprecated - see Remarks.] Specifies the optimizations applied to a route. This enumeration provides values for certain parameters of some overloads of the [GetDrivingRouteAsync](maproutefinder_getdrivingrouteasync_1041948120.md) and [GetDrivingRouteFromWaypointsAsync](maproutefinder_getdrivingroutefromwaypointsasync_1378129125.md) methods.
 * @remarks
 * > [!IMPORTANT]
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and Windows Maps platform APIs ([Windows.Services.Maps.*](../windows.services.maps/windows_services_maps.md)) are deprecated and may not be available in future versions of Windows. For more information, see [Resources for deprecated features](/windows/whats-new/deprecated-features-resources#windows-uwp-map-control-and-windows-maps-platform-apis).
 * 
 * > [!IMPORTANT]
 * > **Bing Maps for Enterprise service retirement**
 * >
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services from the [Windows.Services.Maps](windows_services_maps.md) namespaces rely on Bing Maps. Bing Maps for Enterprise is deprecated and will be retired, at which point the MapControl and services will no longer receive data.
 * >
 * > For more information, see the [Bing Maps Developer Center](https://www.bingmapsportal.com/) and [Bing Maps documentation](/bingmaps/getting-started/).
 * 
 * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
 * 
 * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maprouteoptimization
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapRouteOptimization extends Win32Enum{

    /**
     * Optimize the route by minimizing the time.
     * @type {Integer (Int32)}
     */
    static Time => 0

    /**
     * Optimize the route by minimizing the distance.
     * @type {Integer (Int32)}
     */
    static Distance => 1

    /**
     * Optimize the route by minimizing the time with traffic.
     * 
     * > > [!TIP]
     * > Traffic-based routing is not automatically updated. To capture changes in traffic conditions, repeat the query.
     * @type {Integer (Int32)}
     */
    static TimeWithTraffic => 2

    /**
     * Optimize the route to include the most scenic roads.
     * @type {Integer (Int32)}
     */
    static Scenic => 3
}
